---
author: joannaleecy
title: XblAchievementRewardType
description: Enumeration values that indicate the reward type for an achievement.
kindex: XblAchievementRewardType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementRewardType  

Enumeration values that indicate the reward type for an achievement.    

## Syntax  
  
```cpp
enum class XblAchievementRewardType  : uint32_t  
{  
    Unknown,  
    Gamerscore,  
    InApp,  
    Art  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The reward type is unknown. |  
| Gamerscore | A Gamerscore reward. |  
| InApp | An in-app reward, defined and delivered by the title. |  
| Art | A digital art reward. |  
  
## Member of
  
[XblAchievementReward](../structs/xblachievementreward.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  