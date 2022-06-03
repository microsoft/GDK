---
author: joannaleecy
title: XblTitleStorageDeleteBlobAsync
description: Deletes a blob from title storage.
kindex: XblTitleStorageDeleteBlobAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageDeleteBlobAsync  

Deletes a blob from title storage.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageDeleteBlobAsync(  
         XblContextHandle xboxLiveContext,  
         XblTitleStorageBlobMetadata blobMetadata,  
         bool deleteOnlyIfEtagMatches,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*blobMetadata* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadata](../structs/xbltitlestorageblobmetadata.md)  
  
The blob metadata for the title storage blob to delete.  
  
*deleteOnlyIfEtagMatches* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Specifies whether or not to have the delete operation check that the ETag matches before deleting the blob.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The result of the asynchronous operation can be obtained by calling [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V1 DELETE trustedplatform/users/xuid({xuid})/scids/{scid}/data/{path},{type}  
V1 DELETE json/users/xuid({xuid})/scids/{scid}/data/{path},{type}  
V1 DELETE sessions/{sessionId}/scids/{scid}/data/{path},{type}
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  