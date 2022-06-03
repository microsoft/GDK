---
author: joannaleecy
title: XblAchievementsManagerGetAchievements
description: Gets a list of all achievements for a player.
kindex: XblAchievementsManagerGetAchievements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerGetAchievements  

Gets a list of all achievements for a player.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerGetAchievements(  
         uint64_t xboxUserId,  
         XblAchievementOrderBy sortField,  
         XblAchievementsManagerSortOrder sortOrder,  
         XblAchievementsManagerResultHandle* achievementsResult  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player.  
  
*sortField* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementOrderBy](../../achievements_c/enums/xblachievementorderby.md)  
  
The field to sort the list of achievements on.  
  
*sortOrder* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsManagerSortOrder](../enums/xblachievementsmanagersortorder.md)  
  
The direction by which to sort the list of achievements.  
  
*achievementsResult* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblAchievementsManagerResultHandle*](../handles/xblachievementsmanagerresulthandle.md)  
  
The handle to the result of AchievementsManager API calls. This handle is used by other APIs to get the achievement objects matching the API that was called. The handle must be closed using [XblAchievementsManagerResultCloseHandle](xblachievementsmanagerresultclosehandle.md) when the result is no longer needed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Passing in XblAchievementOrderBy::TitleId for sortField yields the same results as passing in XblAchievementOrderBy::DefaultOrder since all achievements tracked by achievement manager will have the same TitleId.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  