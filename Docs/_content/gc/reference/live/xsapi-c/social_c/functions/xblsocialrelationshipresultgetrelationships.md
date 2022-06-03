---
author: joannaleecy
title: XblSocialRelationshipResultGetRelationships
description: Get a list of the XblSocialRelationship objects from an XblSocialRelationshipResultHandle.
kindex: XblSocialRelationshipResultGetRelationships
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipResultGetRelationships  

Get a list of the XblSocialRelationship objects from an XblSocialRelationshipResultHandle.  

## Syntax  
  
```cpp
HRESULT XblSocialRelationshipResultGetRelationships(  
         XblSocialRelationshipResultHandle resultHandle,  
         const XblSocialRelationship** relationships,  
         size_t* relationshipsCount  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipResultHandle](../handles/xblsocialrelationshipresulthandle.md)  
  
Social relationship result handle.  
  
*relationships* &nbsp;&nbsp;\_Out\_  
Type: [XblSocialRelationship**](../structs/xblsocialrelationship.md)  
  
Passes back a pointer to an array of XblSocialRelationship objects. The memory for the returned pointer remains valid for the life of the XblSocialRelationshipResultHandle object until it is closed.  
  
*relationshipsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of items in the relationships array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
When no longer using the XblSocialRelationshipResultHandle, make sure to call [XblSocialRelationshipResultCloseHandle](xblsocialrelationshipresultclosehandle.md). When all outstanding handles have been closed, the memory associated with the social relationship's results list will be freed.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  