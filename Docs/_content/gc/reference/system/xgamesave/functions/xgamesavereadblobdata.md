---
author: M-Stahl
title: XGameSaveReadBlobData
description: Reads the blob data for a container.
kindex: XGameSaveReadBlobData
ms.author: kelcon
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveReadBlobData  

Reads the blob data for a container.  

## Syntax  
  
```cpp
HRESULT XGameSaveReadBlobData(  
         XGameSaveContainerHandle container,  
         const char** blobNames,  
         uint32_t* countOfBlobs,  
         size_t blobsSize,  
         XGameSaveBlob* blobData  
)  
```  
  
### Parameters  
  
*container* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerHandle  

  
Handle to the **XGameSaveContainer** containing the XGameSaveBlob data.  


*blobNames* &nbsp;&nbsp;\_In\_opt\_z\_count\_(*countOfBlobs)  
Type: char**  

  
Pointer to an array of strings representing the [XGameSaveBlob](../structs/xgamesaveblob.md) names.  


*countOfBlobs* &nbsp;&nbsp;\_Inout\_  
Type: uint32_t*  

  
Number of blobs to read.  


*blobsSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

  
Size of the allocated blob data, can be inferred from reading the blob metadata.  


*blobData* &nbsp;&nbsp;\_Out\_writes\_bytes\_(blobsSize)  
Type: [XGameSaveBlob*](../structs/xgamesaveblob.md)  

[XGameSaveBlob](../structs/xgamesaveblob.md) pointer to contain the blob data. Must have memory allocated to store all of the blobs requested from the container.

  
### Return value
Type: HRESULT

Function result.

#### Common errors

- E_GS_INVALID_CONTAINER_NAME
- E_GS_PROVIDED_BUFFER_TOO_SMALL
- E_GS_BLOB_NOT_FOUND
- E_GS_CONTAINER_NOT_IN_SYNC
- E_GS_CONTAINER_SYNC_FAILED
- E_GS_HANDLE_EXPIRED
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to read the data in a game save blob. The function will return the number of blobs and the data inside of a blob container. You can use these in order to iterate over the blobs in a container to read the appropriate information. There is an asynchronous version of this function called [XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md).
  
```cpp
// SYNC Read - should not be called on time sensitive thread 
//             as this will block until the operation is complete 
void Sample::_ReadContainerBlobsSync(const XGameSaveContainerInfo* container) 
{ 
    const char* blobNames[] = { 
        "WorldState", 
        "PlayerState", 
        "PlayerInventory" 
    }; 
  
    XGameSaveContainerHandle containerContext = nullptr; 
    size_t allocSize; 
    uint32_t countOfBlobs = _countof(blobNames); 
    XGameSaveBlob* blobs = nullptr; 
    HRESULT hr = XGameSaveCreateContainer(_provider, container->name, &containerContext); 
  
    if (SUCCEEDED(hr)) 
    { 
        // this method finds the size for only the blobs in the container 
        // that we are requesting to read right now 
        hr = _GetContainerBlobsDataSize(container, blobNames, _countof(blobNames), &allocSize); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        blobs = reinterpret_cast<XGameSaveBlob*>(malloc(allocSize)); 
        if (blobs == nullptr) 
        { 
            hr = E_OUTOFMEMORY; 
        } 
    } 
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveReadBlobData(containerContext, blobNames, &countOfBlobs, allocSize, blobs); 
    } 
    if (SUCCEEDED(hr)) 
    { 
        if (countOfBlobs == _countof(blobNames)) 
        { 
            for (uint32_t i = 0; i < countOfBlobs; i++) 
            { 
                XGameSaveBlob* currentBlob = blobs + i; 
                if (strcmp(currentBlob->info.name, "WorldState") == 0) 
                { 
                    hr = _LoadSaveBlob(currentBlob, _worldState); 
                } 
                else if (strcmp(currentBlob->info.name, "PlayerState") == 0) 
                { 
                    hr = _LoadSaveBlob(currentBlob, _playerState); 
                } 
                else if (strcmp(currentBlob->info.name, "PlayerInventory") == 0) 
                { 
                    hr = _LoadSaveBlob(currentBlob, _playerInventory); 
                } 
                if (FAILED(hr)) 
                { 
                    break; 
                } 
            } 
        } 
        else 
        { 
            hr = E_UNEXPECTED; 
        } 
    } 
  
    _HandleContainerBlobErrors(hr); 
  
    if (blobs != nullptr) 
    { 
        free(blobs); 
    } 
    if (containerContext != nullptr) 
    { 
        XGameSaveCloseContainer(containerContext); 
    } 
} 
  
  
void Sample::_HandleContainerBlobErrors(HRESULT hr) 
{ 
    // set some state 
    switch (hr) 
    { 
    case E_GS_INVALID_CONTAINER_NAME: 
        // tried to access a container with an invalid name 
        break; 
    case E_GS_PROVIDED_BUFFER_TOO_SMALL: 
        // shouldn't ever happen unless our math is wrong!! 
        break; 
    case E_GS_BLOB_NOT_FOUND: 
        // we asked for a blob that isn't in the container 
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
[XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md)  
[XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)