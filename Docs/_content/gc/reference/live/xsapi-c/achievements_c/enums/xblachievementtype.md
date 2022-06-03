---
author: joannaleecy
title: XblAchievementType
description: Enumeration values that indicate the achievement type.
kindex: XblAchievementType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementType  

Enumeration values that indicate the achievement type.    

## Syntax  
  
```cpp
enum class XblAchievementType  : uint32_t  
{  
    Unknown,  
    All,  
    Persistent,  
    Challenge  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The achievement type is unknown. |  
| All | Gets all achievements regardless of type. |  
| Persistent | A persistent achievement that may be unlocked at any time. Persistent achievements can give Gamerscore as a reward. |  
| Challenge | A challenge achievement that may only be unlocked within a certain time period. Challenge achievements can't give Gamerscore as a reward. |  
  
## Member of
  
[XblAchievement](../structs/xblachievement.md)
  
## Argument of
  
[XblAchievementsGetAchievementsForTitleIdAsync](../functions/xblachievementsgetachievementsfortitleidasync.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  