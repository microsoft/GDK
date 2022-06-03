---
author: M-Stahl
title: XGameSaveSubmitUpdate
description: Submit an update to the XGameSave service. Updates blobs within a container.
kindex: XGameSaveSubmitUpdate
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveSubmitUpdate  

Submit an update to the XGameSave service. Updates blobs within a container.  

## Syntax  
  
```cpp
HRESULT XGameSaveSubmitUpdate(  
         XGameSaveUpdateHandle updateContext  
)  
```  
  
### Parameters  
  
*updateContext* &nbsp;&nbsp;\_In\_  
Type: XGameSaveUpdateHandle  

  
A handle to the XGameSaveUpdate to be updated.  


  
### Return value
Type: HRESULT
  
Function result.  

Common Errors
- E_GS_INVALID_CONTAINER_NAME
- E_GS_OUT_OF_LOCAL_STORAGE
- E_GS_UPDATE_TOO_BIG
- E_GS_QUOTA_EXCEEDED
- E_GS_CONTAINER_NOT_IN_SYNC
- E_GS_CONTAINER_SYNC_FAILED
- E_GS_HANDLE_EXPIRED
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
You need to successfully call [XGameSaveCreateUpdate](xgamesavecreateupdate.md) before making this call.  

The storage portion of this API is designed to easily transfer data from the game to persisted storage in a safe, reliable and transactional manner. We want to make sure the backing data for a container is always consistent and as such we want the whole operation to succeed or fail atomically. We don’t want to have a partial update where some blob data is inconsistent with other data within the container. In order to do this we provide an update context that blob writes and deletes are submitted to and when that is ready the whole context is submitted. In practice this looks like the following:
 
An XGameSaveUpdate will be filled with Write and Delete actions to be carried out on blobs within the container by way of [XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md) and [XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md). An update is completed by calling [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).  

When you are finished with an **XGameSaveUpdate** close it using the [XGameSaveCloseUpdate](xgamesavecloseupdate.md) method.
  
The following C++ sample demonstrates a synchronous XGameSave update.

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

  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveCreateUpdate](xgamesavecreateupdate.md)  
[XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md)  
[XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md)  
[XGameSaveCloseUpdate](xgamesavecloseupdate.md)
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)