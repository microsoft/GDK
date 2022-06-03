---
author: joannaleecy
title: XblAchievementsManagerIsUserInitialized
description: Checks whether a specific user has had its initial state synced.
kindex: XblAchievementsManagerIsUserInitialized
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerIsUserInitialized  

Checks whether a specific user has had its initial state synced.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerIsUserInitialized(  
         uint64_t xboxUserId  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
Xbox Live User to check.
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation. If the user is not initialized, this function will return E_FAIL.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  