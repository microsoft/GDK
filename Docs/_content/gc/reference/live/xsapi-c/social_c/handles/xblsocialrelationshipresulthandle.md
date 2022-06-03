---
author: joannaleecy
title: XblSocialRelationshipResultHandle
description: A handle to a social relationship result.
kindex: XblSocialRelationshipResultHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialRelationshipResultHandle  

A handle to a social relationship result.    

## Syntax  
  
```cpp
typedef struct XblSocialRelationshipResult * XblSocialRelationshipResultHandle;  
```  

## Remarks  
  
This handle is used by other APIs to get the social relationship objects and to get the next page of results from the service if there is one. The handle must be closed using [XblSocialRelationshipResultCloseHandle](../functions/xblsocialrelationshipresultclosehandle.md) when the result is no longer needed.
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  