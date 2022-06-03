---
author: joannaleecy
title: XblAchievementsManagerRemoveLocalUser
description: Immediately remove the local cache of achievements for a user.
kindex: XblAchievementsManagerRemoveLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerRemoveLocalUser  

Immediately remove the local cache of achievements for a user.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerRemoveLocalUser(  
         XblUserHandle user  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User to clear the cache for.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  