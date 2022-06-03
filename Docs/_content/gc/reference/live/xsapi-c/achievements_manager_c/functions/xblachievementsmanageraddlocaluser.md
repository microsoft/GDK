---
author: joannaleecy
title: XblAchievementsManagerAddLocalUser
description: Generate a local cache of achievements for a user.
kindex: XblAchievementsManagerAddLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementsManagerAddLocalUser  

Generate a local cache of achievements for a user.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerAddLocalUser(  
         XblUserHandle user,  
         XTaskQueueHandle queue  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User to fetch achievements for.  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  
  
Queue to be used for background operation for this user (Optional).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  