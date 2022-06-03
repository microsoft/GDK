---
author: joannaleecy
title: XblAchievementProgressState
description: Enumeration values that indicate the state of a player's progress towards unlocking an achievement.
kindex: XblAchievementProgressState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementProgressState  

Enumeration values that indicate the state of a player's progress towards unlocking an achievement.    

## Syntax  
  
```cpp
enum class XblAchievementProgressState  : uint32_t  
{  
    Unknown,  
    Achieved,  
    NotStarted,  
    InProgress  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Achievement progress is unknown. |  
| Achieved | Achievement has been earned. |  
| NotStarted | Achievement progress has not been started. |  
| InProgress | Achievement progress has started. |  
  
## Member of
  
[XblAchievement](../structs/xblachievement.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  