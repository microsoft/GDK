---
author: joannaleecy
title: XblSocialRelationshipResultDuplicateHandle
description: Duplicates the XblSocialRelationshipResultHandle.
kindex: XblSocialRelationshipResultDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipResultDuplicateHandle  

Duplicates the XblSocialRelationshipResultHandle.  

## Syntax  
  
```cpp
HRESULT XblSocialRelationshipResultDuplicateHandle(  
         XblSocialRelationshipResultHandle handle,  
         XblSocialRelationshipResultHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipResultHandle](../handles/xblsocialrelationshipresulthandle.md)  
  
The XblSocialRelationshipResultHandle to duplicate.  
  
*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblSocialRelationshipResultHandle*](../handles/xblsocialrelationshipresulthandle.md)  
  
Passes back the duplicated handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
When no longer using the XblSocialRelationshipResultHandle, make sure to call [XblSocialRelationshipResultCloseHandle](xblsocialrelationshipresultclosehandle.md).
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  