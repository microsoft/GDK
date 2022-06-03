---
author: joannaleecy
title: XblSocialRelationshipResultCloseHandle
description: Closes the XblSocialRelationshipResultHandle.
kindex: XblSocialRelationshipResultCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipResultCloseHandle  

Closes the XblSocialRelationshipResultHandle.  

## Syntax  
  
```cpp
void XblSocialRelationshipResultCloseHandle(  
         XblSocialRelationshipResultHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblSocialRelationshipResultHandle](../handles/xblsocialrelationshipresulthandle.md)  
  
The XblSocialRelationshipResultHandle to close.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When all outstanding handles have been closed, the memory associated with the social relationship's results list will be freed.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  