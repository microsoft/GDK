---
author: joannaleecy
title: XblTitleStorageGetQuotaAsync
description: Gets title storage quota information for the specified service configuration and storage type.
kindex: XblTitleStorageGetQuotaAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageGetQuotaAsync  

Gets title storage quota information for the specified service configuration and storage type.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageGetQuotaAsync(  
         XblContextHandle xboxLiveContext,  
         const char* serviceConfigurationId,  
         XblTitleStorageType storageType,  
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
  
The storage type to get quota information for.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
For TrustedPlatform storage types, the request will be made for the calling user's Xbox user Id. To get the result, call XblTitleStorageGetQuotaResult inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V1 GET trustedplatform/users/xuid({xuid})/scids/{scid}  
V1 GET trustedplatform/users/xuid({xuid})/scids/{scid}  
V1 GET json/users/xuid({xuid})/scids/{scid}  
V1 GET global/scids/{scid}
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  