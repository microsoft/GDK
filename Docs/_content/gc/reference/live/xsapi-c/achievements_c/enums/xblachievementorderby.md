---
author: joannaleecy
title: XblAchievementOrderBy
description: Enumeration values that indicate the achievement sort order.
kindex: XblAchievementOrderBy
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementOrderBy  

Enumeration values that indicate the achievement sort order.    

## Syntax  
  
```cpp
enum class XblAchievementOrderBy  : uint32_t  
{  
    DefaultOrder,  
    TitleId,  
    UnlockTime  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DefaultOrder | Default order does not guarantee sort order. |  
| TitleId | Sort by title id. |  
| UnlockTime | Sort by achievement unlock time. |  
  
## Argument of
  
[XblAchievementsGetAchievementsForTitleIdAsync](../functions/xblachievementsgetachievementsfortitleidasync.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  