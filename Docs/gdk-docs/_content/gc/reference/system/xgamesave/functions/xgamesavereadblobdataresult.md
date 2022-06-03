---
author: M-Stahl
title: XGameSaveReadBlobDataResult
description: Retrieves the results of a [XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md) call.
kindex: XGameSaveReadBlobDataResult
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveReadBlobDataResult  

Retrieves the results of a [XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md) call.  

## Syntax  
  
```cpp
HRESULT XGameSaveReadBlobDataResult(  
         XAsyncBlock* async,  
         size_t blobsSize,  
         XGameSaveBlob* blobData,  
         uint32_t* countOfBlobs  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
AsyncBlock passed from the [XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md) function.  


*blobsSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

  
Required size of the allocated blob data. Retrieve via GetAsyncResultSize.  


*blobData* &nbsp;&nbsp;\_Out\_writes\_bytes\_(blobsSize)  
Type: [XGameSaveBlob*](../structs/xgamesaveblob.md)  

  
[XGameSaveBlob](../structs/xgamesaveblob.md) pointer to contain the blob data. Must have memory allocated to store all of the blobs in the container.  


*countOfBlobs* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  

  
Number of blobs returned in the result.  


  
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
  
Call this function after [XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md) is completed as a part of the callback function to verify success and retrieve the XGameSaveBlob data as well as the count of blobs. You can use these values in order to iterate over the blobs in a container to read the appropriate information. Result methods are commonly written in line with the asynchronous call which will call them later, but can also be written as separate functions.
  
See the [XGameSaveReadBlobDataSync example](xgamesavereadblobdataasync.md#example) for usage.
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveReadBlobDataAsync](xgamesavereadblobdataasync.md)  
[XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)