---
author: M-Stahl
title: XGameSaveEnumerateBlobInfoByName
description: Retrieves the blob info for the contents of a XGameSaveContainer limited to the blobs which share a prefix with the blobNamePrefix parameter.
kindex: XGameSaveEnumerateBlobInfoByName
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveEnumerateBlobInfoByName  

Retrieves the blob info for the contents of a **XGameSaveContainer** limited to the blobs which share a prefix with the *blobNamePrefix* parameter.  

## Syntax  
  
```cpp
HRESULT XGameSaveEnumerateBlobInfoByName(  
         XGameSaveContainerHandle container,  
         const char* blobNamePrefix,  
         void* context,  
         XGameSaveBlobInfoCallback* callback  
)  
```  
  
### Parameters  
  
*container* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerHandle  

  
Handle to the **XGameSaveContainer** containing the blobs to be enumerated.  


*blobNamePrefix* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  

  
prefix used to filter blobs retrieved.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Pointer to the calling object for context.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XGameSaveBlobInfoCallback*  

  
Function to be called for every blob that matches the prefix, return false to stop the enumeration.. Use this to iterate over the [XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md) and verify success of the function call.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> While this function is safe to call on a time-sensitive thread, the XGameSaveBlobInfoCallback may cause delays, depending on what the title does within the callback. As an example, copying data from the callback is fine; however, doing any non-time sensitive call can delay the callbacks return. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Blobs contain the actual retrievable data that makes up a container. Enumerating blobs will allow you to see all of the data available inside of the container. You can use [XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md) to enumerate all the blobs of a container instead of filtering by a prefix.  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md)  
[XGameSaveEnumerateBlobInfo](xgamesaveenumerateblobinfo.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)