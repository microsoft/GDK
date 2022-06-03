---
author: M-Stahl
title: XGameSaveCreateUpdate
description: Creates an update which will later be submitted by calling [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).
kindex: XGameSaveCreateUpdate
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveCreateUpdate  

Creates an update which will later be submitted by calling [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).  

## Syntax  
  
```cpp
HRESULT XGameSaveCreateUpdate(  
         XGameSaveContainerHandle container,  
         const char* containerDisplayName,  
         XGameSaveUpdateHandle* updateContext  
)  
```  
  
### Parameters  
  
*container* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerHandle  

  
Handle to the XGameSaveContainer to be updated.  


*containerDisplayName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Display name for the container to be updated.  


*updateContext* &nbsp;&nbsp;\_Outptr\_result\_nullonfailure\_  
Type: XGameSaveUpdateHandle*  

  
Handle to the XGameSaveUpdate to be created.  

  
### Return value
Type: HRESULT
  
Function result.  
 
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The storage portion of this API is designed to easily transfer data from the game to persisted storage in a safe, reliable and transactional manner. We want to make sure the backing data for a container is always consistent and as such we want the whole operation to succeed or fail atomically. We don't want to have a partial update where some blob data is inconsistent with other data within the container. In order to do this we provide an update context that blob writes and deletes are submitted to and when that is ready the whole context is submitted. In practice this looks like the following:
 
An **XGameSaveUpdate** will be filled with Write and Delete actions to be carried out on blobs within the container by way of [XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md) and [XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md). An update is completed by calling [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).  

When you have finished with an **XGameSaveUpdate** close it with [XGameSaveCloseUpdate](xgamesavecloseupdate.md).
  
The following C++ sample demonstrates a synchronous XGameSave update.
  
<a id="example"></a>

```cpp
// SYNC Write - should not be called on a time sensitive thread 
//              as this will block until the operation is complete 
void Sample::_SaveDataSync(const char* containerName, const char* containerDisplayName) 
{ 
    HRESULT hr; 
    XGameSaveContainerHandle containerContext; 
    XGameSaveUpdateHandle updateContext; 
  
    hr = XGameSaveCreateContainer(_provider, containerName, &containerContext); 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveCreateUpdate(containerContext, containerDisplayName, &updateContext); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(updateContext, "WorldState", _worldState.data(), _worldState.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(updateContext, "PlayerState", _playerState.data(), _playerState.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(updateContext, "PlayerInventory", _playerInventory.data(), _playerInventory.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        if (_clearLevelProgress) 
        { 
            hr = XGameSaveSubmitBlobDelete(updateContext, "LevelProgress"); 
        } 
    } 
  
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitUpdate(updateContext); 
    } 
  
    if (updateContext) 
    { 
        XGameSaveCloseUpdate(updateContext); 
    } 
    if (containerContext) 
    { 
        XGameSaveCloseContainer(containerContext); 
    } 
  
    _HandleContainerUpdateErrors(hr); 
} 
  
  
void Sample::_HandleContainerUpdateErrors(HRESULT hr) 
{ 
    switch (hr) 
    { 
    case E_GS_INVALID_CONTAINER_NAME: 
        // tried to access a container with an invalid name 
        break; 
    case E_GS_OUT_OF_LOCAL_STORAGE: 
        // storage location is full, let the user know that saves won't work till this is fixed 
        break; 
    case E_GS_UPDATE_TOO_BIG: 
        // the blob that we provided was too big, can't be larger than GS_MAX_BLOB_SIZE 
        break; 
    case E_GS_QUOTA_EXCEEDED: 
        // the update we did was larger than our overall quota, need to track that! (see XGameSaveQueryRemainingQuota & XGameSaveQueryRemainingQuotaAsync) 
        break; 
    case E_GS_CONTAINER_NOT_IN_SYNC: 
    case E_GS_CONTAINER_SYNC_FAILED: 
        // need to sync and we are offline ? 
        break; 
    case E_GS_HANDLE_EXPIRED: 
        // need to re-initialize since another device has taken 
        // ownership while we were suspended and/or busy 
        break; 
    } 
}
```
 

The following C++ sample demonstrates an asynchronous XGameSave update.

```cpp
// ASYNC Write - can be kicked off from a time sensitive thread 
//               actual work and completion will be scheduled base upon 
//               the configuration of the async_queue tied to the XAsyncBlock. 
void Sample::_SaveDataAsync(const char* containerName, const char* containerDisplayName) 
{ 
    struct SaveContext 
    { 
        SaveContext(Sample* s) : self(s), containerContext(nullptr), updateContext(nullptr) {} 
        ~SaveContext() 
        { 
            if (updateContext) 
            { 
                XGameSaveCloseUpdate(updateContext); 
            } 
            if (containerContext) 
            { 
                XGameSaveCloseContainer(containerContext); 
            } 
        } 
  
        XAsyncBlock async; 
        XGameSaveContainerHandle containerContext; 
        XGameSaveUpdateHandle updateContext; 
        Sample* self; 
    }; 
  
    HRESULT hr; 
    SaveContext* saveContext = new SaveContext(this); 
    if (saveContext == nullptr) 
    { 
        hr = E_OUTOFMEMORY; 
    } 
    if (SUCCEEDED(hr)) 
    { 
        saveContext->async.context = saveContext; 
        saveContext->async.callback = [](XAsyncBlock* async) 
        { 
            auto ctx = reinterpret_cast<SaveContext*>(async->context); 
            auto self = ctx->self; 
            HRESULT hr = XGameSaveSubmitUpdateResult(async); 
            self->_HandleContainerUpdateErrors(hr); 
            delete ctx; 
        }; 
    } 
  
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveCreateContainer(_provider, containerName, &saveContext->containerContext); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveCreateUpdate(saveContext->containerContext, containerDisplayName, &saveContext->updateContext); 
    } 
  
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(saveContext->updateContext, "WorldState", _worldState.data(), _worldState.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(saveContext->updateContext, "PlayerState", _playerState.data(), _playerState.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitBlobWrite(saveContext->updateContext, "PlayerInventory", _playerInventory.data(), _playerInventory.size()); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        if (_clearLevelProgress) 
        { 
            hr = XGameSaveSubmitBlobDelete(saveContext->updateContext, "LevelProgress"); 
        } 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveSubmitUpdateAsync(saveContext->updateContext, &saveContext->async); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        // context is now owned by the async 
        saveContext = nullptr; 
    } 
  
    // if there was any error we need to cleanup the saveContext 
    if (saveContext) 
    { 
        delete saveContext; 
    } 
  
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md)  
[XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md)  
[XGameSaveSubmitUpdate](xgamesavesubmitupdate.md)  
[XGameSaveCloseUpdate](xgamesavecloseupdate.md)
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)