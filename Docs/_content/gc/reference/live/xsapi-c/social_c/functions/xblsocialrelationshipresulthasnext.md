---
author: joannaleecy
title: XblSocialRelationshipResultHasNext
description: Checks if there are more pages of social relationships to retrieve from the service.
kindex: XblSocialRelationshipResultHasNext
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipResultHasNext  

Checks if there are more pages of social relationships to retrieve from the service.  

## Syntax  
  
```cpp
HRESULT XblSocialRelationshipResultHasNext(  
         XblSocialRelationshipResultHandle resultHandle,  
         bool* hasNext  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipResultHandle](../handles/xblsocialrelationshipresulthandle.md)  
  
The XblSocialRelationshipResultHandle from XblSocialGetSocialRelationshipsResult.  
  
*hasNext* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Passes back true if there are more results to retrieve, false otherwise.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
If the result has a next page, then call [XblSocialRelationshipResultGetNextAsync](xblsocialrelationshipresultgetnextasync.md) to retrieve the next page of items.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  