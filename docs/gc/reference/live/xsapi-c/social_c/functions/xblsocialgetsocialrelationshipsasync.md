---
author: joannaleecy
title: XblSocialGetSocialRelationshipsAsync
description: Gets a list of people that the caller is socially connected to.
kindex: XblSocialGetSocialRelationshipsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialGetSocialRelationshipsAsync  

Gets a list of people that the caller is socially connected to.  

## Syntax  
  
```cpp
HRESULT XblSocialGetSocialRelationshipsAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         XblSocialRelationshipFilter socialRelationshipFilter,  
         size_t startIndex,  
         size_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User Id to get the social relationships for.  
  
*socialRelationshipFilter* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipFilter](../enums/xblsocialrelationshipfilter.md)  
  
Controls how the list is filtered.  
  
*startIndex* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Controls the starting index of the results list.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The maximum number of items that the results list can contain. Pass 0 to attempt to retrieve all items.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated [XAsyncBlock](../../../../system/xasync/structs/xasyncblock.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblSocialGetSocialRelationshipsResult](xblsocialgetsocialrelationshipsresult.md) to get the result.
  
## REST Call  
  
V1 GET /users/{ownerId}/people?view={view}&amp;startIndex={startIndex}&amp;maxItems={maxItems}
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  