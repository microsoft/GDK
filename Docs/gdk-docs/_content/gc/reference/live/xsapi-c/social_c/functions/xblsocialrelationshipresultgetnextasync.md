---
author: joannaleecy
title: XblSocialRelationshipResultGetNextAsync
description: Gets the next page of a list of people that the caller is socially connected to.
kindex: XblSocialRelationshipResultGetNextAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipResultGetNextAsync  

Gets the next page of a list of people that the caller is socially connected to.  

## Syntax  
  
```cpp
HRESULT XblSocialRelationshipResultGetNextAsync(  
         XblContextHandle xboxLiveContext,  
         XblSocialRelationshipResultHandle resultHandle,  
         size_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipResultHandle](../handles/xblsocialrelationshipresulthandle.md)  
  
Social relationship result handle from a previous call to XblSocialGetSocialRelationshipsAsync.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Controls the number of XblSocialRelationship objects to get. 0 will return as many as possible.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this API after finding more results from [XblSocialRelationshipResultHasNext](xblsocialrelationshipresulthasnext.md). After calling this API, make sure to call [XblSocialRelationshipResultGetNextResult](xblsocialrelationshipresultgetnextresult.md) to get the result.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  