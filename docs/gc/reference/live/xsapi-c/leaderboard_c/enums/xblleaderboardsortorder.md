---
author: joannaleecy
title: XblLeaderboardSortOrder
description: The order to sort the leaderboard in.
kindex: XblLeaderboardSortOrder
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardSortOrder  

The order to sort the leaderboard in.    

## Syntax  
  
```cpp
enum class XblLeaderboardSortOrder  : uint32_t  
{  
    Descending,  
    Ascending  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Descending | Sorting the leaderboard highest to lowest. |  
| Ascending | Sorting the leaderboard lowest to highest. |  
  
## Member of
  
[XblLeaderboardQuery](../structs/xblleaderboardquery.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  