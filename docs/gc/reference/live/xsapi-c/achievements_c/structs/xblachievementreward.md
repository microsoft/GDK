---
author: joannaleecy
title: XblAchievementReward
description: Represents a reward that is associated with the achievement.
kindex: XblAchievementReward
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementReward  

Represents a reward that is associated with the achievement.  

## Syntax  
  
```cpp
typedef struct XblAchievementReward {  
    const char* name;  
    const char* description;  
    const char* value;  
    XblAchievementRewardType rewardType;  
    const char* valueType;  
    XblAchievementMediaAsset* mediaAsset;  
} XblAchievementReward  
```
  
### Members  
  
*name*  
Type: const char*  
  
The UTF-8 encoded localized reward name.
  
*description*  
Type: const char*  
  
The UTF-8 encoded description of the reward.
  
*value*  
Type: const char*  
  
The UTF-8 encoded title-defined reward value (data type and content varies by reward type).
  
*rewardType*  
Type: [XblAchievementRewardType](../enums/xblachievementrewardtype.md)  
  
The reward type.
  
*valueType*  
Type: const char*  
  
The UTF-8 encoded property type of the reward value string.
  
*mediaAsset*  
Type: [XblAchievementMediaAsset*](xblachievementmediaasset.md)  
  
The media asset associated with the reward. If the reward type is gamerscore, this will be nullptr. If the reward type is in_app, this will be a media asset. If the reward type is art, this may be a media asset or nullptr.
  
## Member of
  
[XblAchievement](xblachievement.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  