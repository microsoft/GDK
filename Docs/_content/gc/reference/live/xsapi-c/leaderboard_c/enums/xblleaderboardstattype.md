---
author: joannaleecy
title: XblLeaderboardStatType
description: Enumerates the data type of a leaderboard statistic.
kindex: XblLeaderboardStatType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardStatType  

Enumerates the data type of a leaderboard statistic.    

## Syntax  
  
```cpp
enum class XblLeaderboardStatType  : uint32_t  
{  
    Uint64,  
    Boolean,  
    Double,  
    String,  
    Other  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Uint64 | Unsigned 64 bit integer. |  
| Boolean | Boolean. |  
| Double | Double. |  
| String | String. |  
| Other | Unknown. |  
  
## Member of
  
[XblLeaderboardColumn](../structs/xblleaderboardcolumn.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  