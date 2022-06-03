---
author: joannaleecy
title: XblSocialGroupType
description: Predefined Xbox Live social groups.
kindex: XblSocialGroupType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialGroupType  

Predefined Xbox Live social groups.    

## Syntax  
  
```cpp
enum class XblSocialGroupType  : uint32_t  
{  
    None,  
    People,  
    Favorites  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No social group. |  
| People | Social group for the people followed. |  
| Favorites | Social group for the people tagged as favorites. |  
  
## Member of
  
[XblLeaderboardQuery](../structs/xblleaderboardquery.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  