---
author: joannaleecy
title: XblTitleStorageDownloadBlobResult
description: Get the result for a completed XblTitleStorageDownloadBlobAsync operation.
kindex: XblTitleStorageDownloadBlobResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageDownloadBlobResult  

Get the result for a completed XblTitleStorageDownloadBlobAsync operation.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageDownloadBlobResult(  
         XAsyncBlock* async,  
         XblTitleStorageBlobMetadata* blobMetadata  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that passed to XblTitleStorageDownloadBlobAsync.  
  
*blobMetadata* &nbsp;&nbsp;\_Out\_  
Type: [XblTitleStorageBlobMetadata*](../structs/xbltitlestorageblobmetadata.md)  
  
A caller allocated XblTitleStorageBlobMetadata that passes back the downloaded blob metadata.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  