---
author: joannaleecy
title: XblAchievementsManagerEvent
description: An achievement event that will be returned from [XblAchievementsManagerDoWork](../functions/xblachievementsmanagerdowork.md).
kindex: XblAchievementsManagerEvent
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementsManagerEvent  

An achievement event that will be returned from [XblAchievementsManagerDoWork](../functions/xblachievementsmanagerdowork.md).  

## Syntax  
  
```cpp
typedef struct XblAchievementsManagerEvent {  
    XblAchievementProgressChangeEntry progressInfo;  
    uint64_t xboxUserId;  
    XblAchievementsManagerEventType eventType;  
} XblAchievementsManagerEvent  
```
  
### Members  
  
*progressInfo*  
Type: [XblAchievementProgressChangeEntry](../../achievements_c/structs/xblachievementprogresschangeentry.md)  
  
Current state of progress for an achievement for AchievementUnlocked and AchievementProgressUpdated events. The values of this struct are not populated for LocalUserInitialStateSynced events.
  
*xboxUserId*  
Type: uint64_t  
  
The ID for the user that has made progress on an achievement.
  
*eventType*  
Type: [XblAchievementsManagerEventType](../enums/xblachievementsmanagereventtype.md)  
  
Type of the event triggered.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  