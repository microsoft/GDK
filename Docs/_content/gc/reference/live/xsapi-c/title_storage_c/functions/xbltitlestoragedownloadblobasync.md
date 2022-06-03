---
author: joannaleecy
title: XblTitleStorageDownloadBlobAsync
description: Downloads blob data from title storage.
kindex: XblTitleStorageDownloadBlobAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageDownloadBlobAsync  

Downloads blob data from title storage.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageDownloadBlobAsync(  
         XblContextHandle xboxLiveContext,  
         XblTitleStorageBlobMetadata blobMetadata,  
         uint8_t* blobBuffer,  
         size_t blobBufferCount,  
         XblTitleStorageETagMatchCondition etagMatchCondition,  
         const char* selectQuery,  
         size_t preferredDownloadBlockSize,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*blobMetadata* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadata](../structs/xbltitlestorageblobmetadata.md)  
  
The blob metadata for the title storage blob to download.  
  
*blobBuffer* &nbsp;&nbsp;\_Out\_writes\_(blobBufferCount)  
Type: uint8_t*  
  
A caller allocated buffer that passes back the downloaded blob data. This buffer needs to be large enough to store the blob being downloaded. If necessary, the length required for the buffer can be retrieved by getting the blob metadata.  
  
*blobBufferCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The length of blobBuffer.  
  
*etagMatchCondition* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageETagMatchCondition](../enums/xbltitlestorageetagmatchcondition.md)  
  
The ETag match condition used to determine if the blob should be downloaded.  
  
*selectQuery* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
ConfigStorage filter string or JSONStorage json property name string to filter. (Optional)  
  
*preferredDownloadBlockSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The preferred download block size in bytes for binary blobs. Pass 0 to use the default size. (Optional)  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblTitleStorageDownloadBlobResult](xbltitlestoragedownloadblobresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete. This method will return E_NOT_SUFFICIENT_BUFFER (0x8007007A) if the blobBuffer doesn't have enough capacity to hold the blob data.
  
## REST Call  
  
V1 GET trustedplatform/users/xuid({xuid})/scids/{scid}/data/{path},{type}  
V1 GET json/users/xuid({xuid})/scids/{scid}/data/{path},{type}  
V1 GET global/scids/{scid}/data/{path},{type}  
V1 GET sessions/{sessionId}/scids/{scid}/data/{path},{type}
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  