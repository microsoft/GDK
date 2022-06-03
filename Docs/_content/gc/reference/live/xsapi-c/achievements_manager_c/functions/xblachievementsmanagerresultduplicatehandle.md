---
author: joannaleecy
title: XblAchievementsManagerResultDuplicateHandle
description: Duplicates a XblAchievementsManagerResultHandle.
kindex: XblAchievementsManagerResultDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerResultDuplicateHandle  

Duplicates a XblAchievementsManagerResultHandle.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerResultDuplicateHandle(  
         XblAchievementsManagerResultHandle handle,  
         XblAchievementsManagerResultHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsManagerResultHandle](../handles/xblachievementsmanagerresulthandle.md)  
  
The XblAchievementsManagerResultHandle to duplicate.  
  
*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievementsManagerResultHandle*](../handles/xblachievementsmanagerresulthandle.md)  
  
The duplicated handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  