---
author: joannaleecy
title: XblTournamentGameResultWithRank
description: Represents the result of a multiplayer game. DEPRECATED. This structure will be removed in a future release.
kindex: XblTournamentGameResultWithRank
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentGameResultWithRank  

Represents the result of a multiplayer game. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblTournamentGameResultWithRank {  
    XblTournamentGameResult Result;  
    uint64_t Ranking;  
} XblTournamentGameResultWithRank  
```
  
### Members  
  
*Result*  
Type: [XblTournamentGameResult](../enums/xbltournamentgameresult.md)  
  
The result for the team.
  
*Ranking*  
Type: uint64_t  
  
The ranking of the result. Applies only when `Result` is `XblTournamentGameResult::Rank`.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  