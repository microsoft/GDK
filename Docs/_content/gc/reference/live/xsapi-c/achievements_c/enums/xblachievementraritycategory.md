---
author: joannaleecy
title: XblAchievementRarityCategory
description: Enumeration values that indicate the rarity category for an achievement.
kindex: XblAchievementRarityCategory
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementRarityCategory  

Enumeration values that indicate the rarity category for an achievement.    

## Syntax  
  
```cpp
enum class XblAchievementRarityCategory  : uint32_t  
{  
    Unset = 0,  
    Rare = 1,  
    Common = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unset | The rarity is incalculable (e.g. no one has played the title yet, demoninator is 0). |  
| Rare | The number of global users that have unlocked this achievement is between 0 - 10.9. |  
| Common | The number of global users that have unlocked this achievement is between 11.0 - 100.0. |  
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  