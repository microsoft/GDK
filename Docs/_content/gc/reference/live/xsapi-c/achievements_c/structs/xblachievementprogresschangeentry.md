---
author: joannaleecy
title: XblAchievementProgressChangeEntry
description: An entry for XblAchievementProgressChangeEventArgs representing a progress update for a single achievement.
kindex: XblAchievementProgressChangeEntry
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementProgressChangeEntry  

An entry for XblAchievementProgressChangeEventArgs representing a progress update for a single achievement.  

## Syntax  
  
```cpp
typedef struct XblAchievementProgressChangeEntry {  
    const char* achievementId;  
    XblAchievementProgressState progressState;  
    XblAchievementProgression progression;  
} XblAchievementProgressChangeEntry  
```
  
### Members  
  
*achievementId*  
Type: const char*  
  
The UTF-8 encoded achievement ID. Represents a uint.
  
*progressState*  
Type: [XblAchievementProgressState](../enums/xblachievementprogressstate.md)  
  
The state of a user's progress towards the earning of the achievement.
  
*progression*  
Type: [XblAchievementProgression](xblachievementprogression.md)  
  
The progression object containing progress details about the achievement, including requirements.
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  