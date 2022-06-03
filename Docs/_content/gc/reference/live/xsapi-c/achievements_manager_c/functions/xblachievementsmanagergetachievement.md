---
author: joannaleecy
title: XblAchievementsManagerGetAchievement
description: Gets the current local state of an achievement for a local player with a specific achievement ID.
kindex: XblAchievementsManagerGetAchievement
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerGetAchievement  

Gets the current local state of an achievement for a local player with a specific achievement ID.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerGetAchievement(  
         uint64_t xboxUserId,  
         const char* achievementId,  
         XblAchievementsManagerResultHandle* achievementResult  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player.  
  
*achievementId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The UTF-8 encoded unique identifier of the Achievement as defined by Dev Center.  
  
*achievementResult* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblAchievementsManagerResultHandle*](../handles/xblachievementsmanagerresulthandle.md)  
  
The handle to the result of AchievementsManager API calls. This handle is used by other APIs to get the achievement objects matching the API that was called. The handle must be closed using [XblAchievementsManagerResultCloseHandle](xblachievementsmanagerresultclosehandle.md) when the result is no longer needed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  