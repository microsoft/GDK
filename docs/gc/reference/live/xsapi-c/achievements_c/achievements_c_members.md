---
author: joannaleecy
title: achievements_c (contents)
description: Achievements C API
kindex: achievements_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# achievements_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblAchievementMediaAssetType](enums/xblachievementmediaassettype.md) | Enumeration values that indicate the media asset type associated with the achievement. |  
| [XblAchievementOrderBy](enums/xblachievementorderby.md) | Enumeration values that indicate the achievement sort order. |  
| [XblAchievementParticipationType](enums/xblachievementparticipationtype.md) | Enumeration values that indicate the participation type for an achievement. |  
| [XblAchievementProgressState](enums/xblachievementprogressstate.md) | Enumeration values that indicate the state of a player's progress towards unlocking an achievement. |  
| [XblAchievementRewardType](enums/xblachievementrewardtype.md) | Enumeration values that indicate the reward type for an achievement. |  
| [XblAchievementType](enums/xblachievementtype.md) | Enumeration values that indicate the achievement type. |  
| [XblAchievementRarityCategory](enums/xblachievementraritycategory.md) | Enumeration values that indicate the rarity category for an achievement. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblAchievementsGetAchievementAsync](functions/xblachievementsgetachievementasync.md) | Gets an achievement for a player with a specific achievement ID. |  
| [XblAchievementsGetAchievementResult](functions/xblachievementsgetachievementresult.md) | Get the result handle from an XblAchievementsGetAchievementAsync call. |  
| [XblAchievementsGetAchievementsForTitleIdAsync](functions/xblachievementsgetachievementsfortitleidasync.md) | Gets the first page of achievements for a player of the specified title. |  
| [XblAchievementsGetAchievementsForTitleIdResult](functions/xblachievementsgetachievementsfortitleidresult.md) | Get XblAchievementsResultHandle from an XblAchievementsGetAchievementsForTitleIdAsync call. |  
| [XblAchievementsResultCloseHandle](functions/xblachievementsresultclosehandle.md) | Closes the XblAchievementsResultHandle. |  
| [XblAchievementsResultDuplicateHandle](functions/xblachievementsresultduplicatehandle.md) | Duplicates a XblAchievementsResultHandle. |  
| [XblAchievementsResultGetAchievements](functions/xblachievementsresultgetachievements.md) | Get a list of XblAchievement objects. |  
| [XblAchievementsResultGetNextAsync](functions/xblachievementsresultgetnextasync.md) | Gets the result of next page of achievements for a player of the specified title. |  
| [XblAchievementsResultGetNextResult](functions/xblachievementsresultgetnextresult.md) | Get XblAchievementsResultHandle from an XblAchievementsResultGetNextAsync call. |  
| [XblAchievementsResultHasNext](functions/xblachievementsresulthasnext.md) | Checks if there are more pages of achievements to retrieve from the service. |  
| [XblAchievementsUpdateAchievementAsync](functions/xblachievementsupdateachievementasync.md) | Allow achievement progress to be updated and achievements to be unlocked. |  
| [XblAchievementsUpdateAchievementForTitleIdAsync](functions/xblachievementsupdateachievementfortitleidasync.md) | Allow achievement progress to be updated and achievements to be unlocked. |  
| [XblAchievementUnlockAddNotificationHandler](functions/xblachievementunlockaddnotificationhandler.md) | Registers an event handler for achievement unlock notifications. |  
| [XblAchievementUnlockHandler](functions/xblachievementunlockhandler.md) | Handle for Function handling achievement unlock events. |  
| [XblAchievementUnlockRemoveNotificationHandler](functions/xblachievementunlockremovenotificationhandler.md) | Unregisters an event handler for achievement unlock notifications. |  
| [XblAchievementsAddAchievementProgressChangeHandler](functions/xblachievementsaddachievementprogresschangehandler.md) | Registers an event handler for achievement progress change notifications. |  
| [XblAchievementsProgressChangeHandler](functions/xblachievementsprogresschangehandler.md) | A callback invoked when a progress is made on an achievement. |  
| [XblAchievementsRemoveAchievementProgressChangeHandler](functions/xblachievementsremoveachievementprogresschangehandler.md) | Removes an event handler for achievement progress change notifications. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblAchievementsResultHandle](handles/xblachievementsresulthandle.md) | A handle to an achievement result. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblAchievement](structs/xblachievement.md) | Represents an achievement, a system-wide mechanism for directing and rewarding users' in-game actions consistently across all games. |  
| [XblAchievementMediaAsset](structs/xblachievementmediaasset.md) | Represents a media asset for an achievement. |  
| [XblAchievementProgression](structs/xblachievementprogression.md) | Represents progress details about the achievement, including requirements. |  
| [XblAchievementRequirement](structs/xblachievementrequirement.md) | Represents requirements for unlocking the achievement. |  
| [XblAchievementReward](structs/xblachievementreward.md) | Represents a reward that is associated with the achievement. |  
| [XblAchievementTimeWindow](structs/xblachievementtimewindow.md) | Represents an interval of time during which an achievement can be unlocked. |  
| [XblAchievementTitleAssociation](structs/xblachievementtitleassociation.md) | Represents the association between a title and achievements. |  
| [XblAchievementUnlockEvent](structs/xblachievementunlockevent.md) | Represents an Achievement Unlock notification received from the notification service. |  
| [XblAchievementProgressChangeEntry](structs/xblachievementprogresschangeentry.md) | An entry for XblAchievementProgressChangeEventArgs representing a progress update for a single achievement. |  
| [XblAchievementProgressChangeEventArgs](structs/xblachievementprogresschangeeventargs.md) | Event arguments for achievement progress changes. |  
