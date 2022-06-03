---
author: joannaleecy
title: achievements_manager_c (contents)
description: Achievements Manager C API
kindex: achievements_manager_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# achievements_manager_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblAchievementsManagerEventType](enums/xblachievementsmanagereventtype.md) | Defines values used to indicate event types for an achievement. |  
| [XblAchievementsManagerSortOrder](enums/xblachievementsmanagersortorder.md) | Enumeration values that specify the order we display the results in. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblAchievementsManagerResultHandle](handles/xblachievementsmanagerresulthandle.md) | A handle to an achievement manager result. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblAchievementsManagerAddLocalUser](functions/xblachievementsmanageraddlocaluser.md) | Generate a local cache of achievements for a user. |  
| [XblAchievementsManagerDoWork](functions/xblachievementsmanagerdowork.md) | Called whenever the title wants to update the state of achievements and get list of change events. |  
| [XblAchievementsManagerGetAchievement](functions/xblachievementsmanagergetachievement.md) | Gets the current local state of an achievement for a local player with a specific achievement ID. |  
| [XblAchievementsManagerGetAchievements](functions/xblachievementsmanagergetachievements.md) | Gets a list of all achievements for a player. |  
| [XblAchievementsManagerGetAchievementsByState](functions/xblachievementsmanagergetachievementsbystate.md) | Gets a list of achievements in a specific progress state for a player. |  
| [XblAchievementsManagerIsUserInitialized](functions/xblachievementsmanagerisuserinitialized.md) | Checks whether a specific user has had its initial state synced. |  
| [XblAchievementsManagerRemoveLocalUser](functions/xblachievementsmanagerremovelocaluser.md) | Immediately remove the local cache of achievements for a user. |  
| [XblAchievementsManagerResultCloseHandle](functions/xblachievementsmanagerresultclosehandle.md) | Closes the XblAchievementsManagerResultHandle. |  
| [XblAchievementsManagerResultDuplicateHandle](functions/xblachievementsmanagerresultduplicatehandle.md) | Duplicates a XblAchievementsManagerResultHandle. |  
| [XblAchievementsManagerResultGetAchievements](functions/xblachievementsmanagerresultgetachievements.md) | Get a list of XblAchievement objects. |  
| [XblAchievementsManagerUpdateAchievement](functions/xblachievementsmanagerupdateachievement.md) | Allow achievement progress to be updated and achievements to be unlocked. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblAchievementsManagerEvent](structs/xblachievementsmanagerevent.md) | An achievement event that will be returned from [XblAchievementsManagerDoWork](functions/xblachievementsmanagerdowork.md). |  
