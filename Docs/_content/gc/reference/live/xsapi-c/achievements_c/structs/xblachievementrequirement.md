---
author: joannaleecy
title: XblAchievementRequirement
description: Represents requirements for unlocking the achievement.
kindex: XblAchievementRequirement
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementRequirement  

Represents requirements for unlocking the achievement.  

## Syntax  
  
```cpp
typedef struct XblAchievementRequirement {  
    const char* id;  
    const char* currentProgressValue;  
    const char* targetProgressValue;  
} XblAchievementRequirement  
```
  
### Members  
  
*id*  
Type: const char*  
  
The UTF-8 encoded achievement requirement ID.
  
*currentProgressValue*  
Type: const char*  
  
A UTF-8 encoded value that indicates the current progress of the player towards meeting the requirement.
  
*targetProgressValue*  
Type: const char*  
  
The UTF-8 encoded target progress value that the player must reach in order to meet the requirement.
  
## Member of
  
[XblAchievementProgression](xblachievementprogression.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  