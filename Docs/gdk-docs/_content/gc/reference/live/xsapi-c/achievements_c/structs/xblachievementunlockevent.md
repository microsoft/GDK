---
author: joannaleecy
title: XblAchievementUnlockEvent
description: Represents an Achievement Unlock notification received from the notification service.
kindex: XblAchievementUnlockEvent
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementUnlockEvent  

Represents an Achievement Unlock notification received from the notification service.  

## Syntax  
  
```cpp
typedef struct XblAchievementUnlockEvent {  
    const char* achievementName;  
    const char* achievementDescription;  
    const char* achievementIcon;  
    const char* achievementId;  
    uint64_t gamerscore;  
    uint32_t titleId;  
    uint64_t xboxUserId;  
    const char* deepLink;  
    float rarityPercentage;  
    XblAchievementRarityCategory rarityCategory;  
    time_t timeUnlocked;  
} XblAchievementUnlockEvent  
```
  
### Members  
  
*achievementName*  
Type: const char*  
  
The name of the achievement in the locale of the DeviceEndpoint to which it's being sent (current char limit: 44).
  
*achievementDescription*  
Type: const char*  
  
The description of the achievement in the locale of the DeviceEndpoint to which it's being sent.
  
*achievementIcon*  
Type: const char*  
  
The URL to the image associated to the achievement (max length: 2048).
  
*achievementId*  
Type: const char*  
  
The base 10 ID of the title the achievement is defined for.
  
*gamerscore*  
Type: uint64_t  
  
The amount of gamerscore earned for unlocking the achievement (can be 0 - challenges cannot have gamerscore).
  
*titleId*  
Type: uint32_t  
  
The base 10 ID of the title the achievement is defined for.
  
*xboxUserId*  
Type: uint64_t  
  
The person's Xbox user identifier.
  
*deepLink*  
Type: const char*  
  
The deep link set on the achievement.
  
*rarityPercentage*  
Type: float  
  
The ratio of the count of users who have unlocked the achievement / the total number unique users of that title expressed as a fractional value &gt;= 0.0 and &lt;= 1.0 rounded to 2 decimal places.
  
*rarityCategory*  
Type: [XblAchievementRarityCategory](../enums/xblachievementraritycategory.md)  
  
"Rare" or "Common" - where Rare achievements are those with a rarityPercentage &lt;= 9% (or 0.9) and "Common" is everything else. (This string is not localized).
  
*timeUnlocked*  
Type: time_t  
  
The timestamp when the achievement was first unlocked for this user.
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  