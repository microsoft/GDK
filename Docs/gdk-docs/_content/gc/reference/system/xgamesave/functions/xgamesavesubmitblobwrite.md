---
author: M-Stahl
title: XGameSaveSubmitBlobWrite
description: Adds a write action to a XGameSaveUpdate.
kindex: XGameSaveSubmitBlobWrite
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveSubmitBlobWrite  

Adds a write action to a XGameSaveUpdate.  

## Syntax  
  
```cpp
HRESULT XGameSaveSubmitBlobWrite(  
         XGameSaveUpdateHandle updateContext,  
         const char* blobName,  
         const uint8_t* data,  
         size_t byteCount  
)  
```  
  
### Parameters  
  
*updateContext* &nbsp;&nbsp;\_In\_  
Type: XGameSaveUpdateHandle  

  
Handle to the **XGameSaveUpdate** the blob will be written to.  


*blobName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the blob to be written. The size of the blob name should not be greater than GS_MAX_BLOB_NAME_SIZE, in bytes.  


*data* &nbsp;&nbsp;\_In\_reads\_bytes\_(byteCount)  
Type: uint8_t*  

  
Data to be written to the blob.  


*byteCount* &nbsp;&nbsp;\_In\_  
Type: size_t  

  
Size of the data to be written to the blob.  The size of the blob data should not be greater than GS_MAX_BLOB_SIZE, in bytes.  
> [!NOTE]
> While the size of the blob data is limited to GS_MAX_BLOB_SIZE, the entire update is also limited to GS_MAX_BLOB_SIZE. If an update contains a blob of GS_MAX_BLOB_SIZE, additional updates must be made in separate update requests.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
You need to successfully call [XGameSaveCreateUpdate](xgamesavecreateupdate.md) before making this call.  

The storage portion of this API is designed to easily transfer data from the game to persisted storage in a safe, reliable and transactional manner. We want to make sure the backing data for a container is always consistent and as such we want the whole operation to succeed or fail atomically. We don't want to have a partial update where some blob data is inconsistent with other data within the container. In order to do this we provide an update context that blob writes and deletes are submitted to and when that is ready the whole context is submitted. In practice this looks like the following:
 
An XGameSaveUpdate will be filled with Write and Delete actions to be carried out on blobs within the container by way of [XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md) and [XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md). An update is completed by calling [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).
  
See the [XGameSaveCreateUpdate examples](xgamesavecreateupdate.md#example) for usage.
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveCreateUpdate](xgamesavecreateupdate.md)  
[XGameSaveSubmitUpdate](xgamesavesubmitupdate.md)  
[XGameSaveSubmitBlobDelete](xgamesavesubmitblobdelete.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)