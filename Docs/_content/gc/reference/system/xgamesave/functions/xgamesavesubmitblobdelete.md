---
author: M-Stahl
title: XGameSaveSubmitBlobDelete
description: Adds a delete action to a game save XGameSaveUpdate.
kindex: XGameSaveSubmitBlobDelete
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveSubmitBlobDelete  

Adds a delete action to a game save XGameSaveUpdate. 

## Syntax  
  
```cpp
HRESULT XGameSaveSubmitBlobDelete(  
         XGameSaveUpdateHandle updateContext,  
         const char* blobName  
)  
```  
  
### Parameters  
  
*updateContext* &nbsp;&nbsp;\_In\_  
Type: XGameSaveUpdateHandle  

  
Handle to the **XGameSaveUpdate** where the blob will be deleted.  


*blobName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the blob to be deleted.  


  
### Return value
Type: HRESULT
  
Function result  
  
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
[XGameSaveSubmitBlobWrite](xgamesavesubmitblobwrite.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)