---
author: joannaleecy
title: XblAchievementsManagerGetAchievementsByState
description: Gets a list of achievements in a specific progress state for a player.
kindex: XblAchievementsManagerGetAchievementsByState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerGetAchievementsByState  

Gets a list of achievements in a specific progress state for a player.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerGetAchievementsByState(  
         uint64_t xboxUserId,  
         XblAchievementOrderBy sortField,  
         XblAchievementsManagerSortOrder sortOrder,  
         XblAchievementProgressState achievementState,  
         XblAchievementsManagerResultHandle* achievementsResult  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player.  
  
*sortField* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementOrderBy](../../achievements_c/enums/xblachievementorderby.md)  
  
The field to sort the list of achievements on. TitleId will behave the same as DefaultOrder, as AchievementsManager only handles one title at a time.  
  
*sortOrder* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsManagerSortOrder](../enums/xblachievementsmanagersortorder.md)  
  
The direction by which to sort the list of achievements.  
  
*achievementState* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementProgressState](../../achievements_c/enums/xblachievementprogressstate.md)  
  
The achievement state to include in the results.  
  
*achievementsResult* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
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
  
  