---
author: M-Stahl
title: XGameSaveSubmitUpdateAsync
description: Submit an update to the XGameSave service asynchronously. Updates blobs within a container.
kindex: XGameSaveSubmitUpdateAsync
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveSubmitUpdateAsync  

Submit an update to the **XGameSave** service asynchronously. Updates blobs within a container.  

## Syntax  
  
```cpp
HRESULT XGameSaveSubmitUpdateAsync(  
         XGameSaveUpdateHandle updateContext,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*updateContext* &nbsp;&nbsp;\_In\_  
Type: XGameSaveUpdateHandle  

  
A handle to the XGameSaveUpdate to be updated.  


*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
An AsyncBlock containing the calling context and callback function for the **XGameSaveSubmitUpdateAsync** call.  

  
### Return value
Type: HRESULT
  
Function result  
  
## Remarks  

This function is called as a part of the AsyncBlock call function of [XGameSaveSubmitUpdateAsync](xgamesavesubmitupdateasync.md). This function will be used to determine the results of [XGameSaveSubmitUpdateAsync](xgamesavesubmitupdateasync.md).

The storage portion of this API is designed to easily transfer data from the game to persisted storage in a safe, reliable and transactional manner. We want to make sure the backing data for a container is always consistent and as such we want the whole operation to succeed or fail atomically. We don’t want to have a partial update where some blob data is inconsistent with other data within the container. In order to do this we provide an update context that blob writes and deletes are submitted to and when that is ready the whole context is submitted. In practice this looks like the following:
 
An XGameSaveUpdate will be filled with Write and Delete actions to be carried out on blobs within the container by way of [XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md) and [XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md). An update is completed by calling [XGameSaveSubmitUpdateAsync](xgamesavesubmitupdateasync.md).  

When you are finished with an **XGameSaveUpdate** close it using the [XGameSaveCloseUpdate](xgamesavecloseupdate.md) method. 
  
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
[XGameSaveCreateUpdate](xgamesavecreateupdate.md)  
[XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md)  
[XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)