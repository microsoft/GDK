---
author: joannaleecy
title: XblLeaderboardQueryType
description: Enum used to specify the type of leaderboard in a Leaderboard query.
kindex: XblLeaderboardQueryType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardQueryType  

Enum used to specify the type of leaderboard in a Leaderboard query.    

## Syntax  
  
```cpp
enum class XblLeaderboardQueryType  : uint32_t  
{  
    UserStatBacked = 0,  
    TitleManagedStatBackedGlobal = 1,  
    TitleManagedStatBackedSocial = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| UserStatBacked | A leaderboard based an event based user stat. |  
| TitleManagedStatBackedGlobal | A global leaderboard backed by a title managed stat. |  
| TitleManagedStatBackedSocial | A social leaderboard backed by a title managed stat. |  
  
## Member of
  
[XblLeaderboardQuery](../structs/xblleaderboardquery.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  