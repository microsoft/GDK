---
author: M-Stahl
title: XGameSaveReadBlobDataAsync
description: Read XGameSaveBlob data from a XGameSaveContainer asynchronously.
kindex: XGameSaveReadBlobDataAsync
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveReadBlobDataAsync  

Read [XGameSaveBlob](../structs/xgamesaveblob.md) data from a **XGameSaveContainer** asynchronously.

## Syntax  
  
```cpp
HRESULT XGameSaveReadBlobDataAsync(  
         XGameSaveContainerHandle container,  
         const char** blobNames,  
         uint32_t countOfBlobs,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*container* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerHandle  

  
Container holding the gamesave blob data..


*blobNames* &nbsp;&nbsp;\_In\_opt\_z\_count\_(countOfBlobs)  
Type: char**  

  
Pointer to an array of strings representing the [XGameSaveBlob](../structs/xgamesaveblob.md) names.  


*countOfBlobs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Number of blobs to read.  


*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
AsyncBlock containing the context and callback function for the **XGameSaveReadBlobDataAsync** call.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  
Results and data are captured in the [XGameSaveReadBlobDataResult](xgamesavereadblobdataresult.md) function. [XGameSaveReadBlobDataResult](xgamesavereadblobdataresult.md) will return the count of blobs in the container as well as the blob data itself. There is a synchronous version of this function called [XGameSaveReadBlobData](xgamesavereadblobdata.md).
  
<a id="example"></a>

```cpp
// ASYNC Read - can be kicked off from a time sensitive thread 
//              actual work and completion will be scheduled based upon  
//              the configuration of the async_queue tied to the XAsyncBlock 
void Sample::_ReadContainerBlobsAsync(const XGameSaveContainerInfo* container) 
{ 
    const char* blobNames[] = { 
        "WorldState", 
        "PlayerState", 
        "PlayerInventory" 
    }; 
  
    struct LoadContext 
    { 
        LoadContext(Sample* s) : container(nullptr), self(s) {} 
        ~LoadContext() 
        { 
            XGameSaveCloseContainer(container); 
        } 
        XAsyncBlock async; 
        XGameSaveContainerHandle container; 
        Sample* self; 
    }; 
    HRESULT hr; 
    LoadContext* loadContext = new LoadContext(this); 
    if (loadContext == nullptr) 
    { 
        hr = E_OUTOFMEMORY; 
    } 
  
    auto completionCallback = [](XAsyncBlock* async) 
    { 
        auto ctx = reinterpret_cast<LoadContext*>(async->context); 
        auto self = ctx->self; 
        size_t allocatedSize; 
        XGameSaveBlob* blobData = nullptr; 
        uint32_t blobCount = 0; 
  
        HRESULT hr = GetAsyncStatus(async, false); 
  
        if (SUCCEEDED(hr)) 
        { 
            // use local wrapper for GetAsyncResultSize to give strongly typed alloc 
            XGameSaveBlob* blobData = _AllocAsyncResult<XGameSaveBlob>(async, &allocatedSize); 
            if (blobData == nullptr) 
            { 
                hr = E_OUTOFMEMORY; 
            } 
        } 
  
        if (SUCCEEDED(hr)) 
        { 
            // now that we have allocated the required buffers 
            // ask XGameSave to populate them 
            hr = XGameSaveReadBlobDataResult(async, allocatedSize, blobData, &blobCount); 
        } 
        if (SUCCEEDED(hr)) 
        { 
            if (blobCount == _countof(blobNames)) 
            { 
                for (uint32_t i = 0; i < blobCount; i++) 
                { 
                    XGameSaveBlob* currentBlob = blobData + i; 
                    if (strcmp(currentBlob->info.name, "WorldState") == 0) 
                    { 
                        hr = self->_LoadSaveBlob(currentBlob, self->_worldState); 
                    } 
                    else if (strcmp(currentBlob->info.name, "PlayerState") == 0) 
                    { 
                        hr = self->_LoadSaveBlob(currentBlob, self->_playerState); 
                    } 
                    else if (strcmp(currentBlob->info.name, "PlayerInventory") == 0) 
                    { 
                        hr = self->_LoadSaveBlob(currentBlob, self->_playerInventory); 
                    } 
                    if (FAILED(hr)) 
                    { 
                        break; 
                    } 
                } 
            } 
            else 
            { 
                // what containers are missing? Can we get by without XXX? 
                hr = E_UNEXPECTED; 
            } 
        } 
  
        self->_HandleContainerBlobErrors(hr); 
  
        if (blobData != nullptr) 
        { 
            // we own the buffer so better kill it 
            free(blobData); 
        } 
        // be sure to clear this since it will be no longer valid after we exit 
        self->_asyncLoad = nullptr; 
        // kill the temp context tracking the async op 
        delete ctx; 
    }; 
  
    if (SUCCEEDED(hr)) 
    { 
        loadContext->async.context = loadContext; 
        // set the XTaskQueueHandle so the completion will be done on our thread 
        // and then we can allocate the larger buffers with less lock contention 
        loadContext->async.queue = _asyncCompleteQueue; 
        loadContext->async.callback = completionCallback; 
    } 
  
    hr = XGameSaveCreateContainer(_provider, container->name, &loadContext->container); 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveReadBlobDataAsync(loadContext->container, blobNames, _countof(blobNames), &loadContext->async); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        // keep a reference to this so we can Cancel later if needed 
        _asyncLoad = &loadContext->async;  
        // hand over ownership to the async callback 
        loadContext = nullptr;  
    } 
  
    if (loadContext) 
    { 
        delete loadContext; 
    } 
    if (FAILED(hr)) 
    { 
        _HandleContainerBlobErrors(hr); 
    } 
} 
 
// Allocate a strongly typed portion from an Async Result 
template<typename T> 
static T* _AllocAsyncResult(XAsyncBlock* async, size_t* allocatedSize) 
{ 
    *allocatedSize = 0; 
    size_t allocSize = 0; 
    HRESULT hr = XAsyncGetResultSize(async, &allocSize); 
    if (SUCCEEDED(hr) && allocSize > 0) 
    { 
        *allocatedSize = allocSize; 
        return reinterpret_cast<T*>(malloc(allocSize)); 
    } 
    return nullptr; 
} 
  
/*static*/ 
DWORD Sample::_CompleteThreadProc(PVOID context) 
{ 
    auto self = reinterpret_cast<Sample*>(context); 
  
    while (DWORD wait = WaitForSingleObjectEx(self->_shutdownEvent, INFINITE, TRUE) == WAIT_IO_COMPLETION) 
    { 
        // loop waiting for APC, any other return should exit the thread 
    } 
} 
  
// Init thread and async queue 
HRESULT Sample::_InitQueueThread() 
{ 
    HRESULT hr = S_OK; 
    _shutdownEvent = CreateEvent(nullptr, TRUE, FALSE, nullptr); 
    if (_shutdownEvent == nullptr) 
    { 
        hr = HRESULT_FROM_WIN32(GetLastError()); 
    } 
     
    if (SUCCEEDED(hr)) 
    { 
        _completeThread = CreateThread(nullptr, 0, _CompleteThreadProc, this, 0, &_completeThreadId); 
        if (_completeThread == nullptr) 
        { 
            hr = HRESULT_FROM_WIN32(GetLastError()); 
        } 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XTaskQueueCreate(XTaskQueueDispatchMode::ThreadPool, XTaskQueueDispatchMode::Manual, &_asyncCompleteQueue); 
    } 
    return hr; 
} 
  
void Sample::_CancelReadContainerBlobsAsync() 
{ 
    if (_asyncLoad) 
    { 
        XAsyncCancel(_asyncLoad); 
    } 
}
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md)  
[XGameSaveReadBlobDataResult](xgamesavereadblobdataresult.md)  
[XGameSaveReadBlobData](xgamesavereadblobdata.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)