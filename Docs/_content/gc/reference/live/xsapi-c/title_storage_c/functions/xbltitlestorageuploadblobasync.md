---
author: joannaleecy
title: XblTitleStorageUploadBlobAsync
description: Uploads blob data to title storage.
kindex: XblTitleStorageUploadBlobAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageUploadBlobAsync  

Uploads blob data to title storage.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageUploadBlobAsync(  
         XblContextHandle xboxLiveContext,  
         XblTitleStorageBlobMetadata blobMetadata,  
         const uint8_t* blobBuffer,  
         size_t blobBufferCount,  
         XblTitleStorageETagMatchCondition etagMatchCondition,  
         size_t preferredUploadBlockSize,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*blobMetadata* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadata](../structs/xbltitlestorageblobmetadata.md)  
  
Contains properties required to upload the buffer to title storage. Uploads require a service configuration Id, blob path, blob type and storage type at a minimum.  
  
*blobBuffer* &nbsp;&nbsp;\_In\_  
Type: uint8_t*  
  
The buffer containing the blob data to upload. This buffer must be available for the duration of the async operation. Clients should not modify the buffer while an upload is in progress.  
  
*blobBufferCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The length of blobBuffer.  
  
*etagMatchCondition* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageETagMatchCondition](../enums/xbltitlestorageetagmatchcondition.md)  
  
The ETag match condition used to determine if the blob data should be uploaded.  
  
*preferredUploadBlockSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The preferred upload block size in bytes for binary blobs. Binary blobs will be uploaded in multiple chunks of this size if they exceed it. Larger sizes are preferred by the service. If timeouts occur, the app should retry with a smaller size. Block size must be within the 1K to 4MB range. This method will use a default size if this parameter is not within the acceptable range. The current minimum size is 1024 bytes, maximum size is 4194304 bytes and the default size is 262144 bytes. (Optional)  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## REST Call  
  
V1 PUT json/users/xuid({xuid})/scids/{scid}/data/{path},{type}  
V1 PUT global/scids/{scid}/data/{path},{type}  
V1 PUT sessions/{sessionId}/scids/{scid}/data/{path},{type}
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  