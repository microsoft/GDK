---
author: joannaleecy
title: XblTitleStorageGetBlobMetadataAsync
description: Gets a list of blob metadata objects under a given path for the specified service configuration, storage type and storage ID.
kindex: XblTitleStorageGetBlobMetadataAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageGetBlobMetadataAsync  

Gets a list of blob metadata objects under a given path for the specified service configuration, storage type and storage ID.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageGetBlobMetadataAsync(  
         XblContextHandle xboxLiveContext,  
         const char* serviceConfigurationId,  
         XblTitleStorageType storageType,  
         const char* blobPath,  
         uint64_t xboxUserId,  
         uint32_t skipItems,  
         uint32_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*storageType* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageType](../enums/xbltitlestoragetype.md)  
  
The storage type to get blob metadata objects for.  
  
*blobPath* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The root path to enumerate. Results will be for blobs contained in this path and all subpaths. (Optional)  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the title storage to enumerate. Ignored when enumerating GlobalStorage, so passing 0 is acceptable. (Optional)  
  
*skipItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of items to skip before returning results. (Optional)  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of items to return. Pass 0 to attempt to retrieve all items. (Optional)  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call XblTitleStorageGetBlobMetadataResult inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V1 GET trustedplatform/users/xuid({xuid})/scids/{scid}/data/{path}?maxItems={maxItems}[skipItems={skipItems}]  
V1 GET json/users/xuid({xuid})/scids/{scid}/data/{path}?maxItems={maxItems}[skipItems={skipItems}]  
V1 GET global/scids/{scid}/data/{path}?maxItems={maxItems}[skipItems={skipItems}]
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  