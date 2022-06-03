---
author: joannaleecy
title: XblTournamentTeamResult
description: Represents a team result for a multiplayer game. DEPRECATED. This structure will be removed in a future release.
kindex: XblTournamentTeamResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentTeamResult  

Represents a team result for a multiplayer game. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblTournamentTeamResult {  
    const char* Team;  
    XblTournamentGameResultWithRank GameResult;  
} XblTournamentTeamResult  
```
  
### Members  
  
*Team*  
Type: const char*  
  
Name of the team.
  
*GameResult*  
Type: [XblTournamentGameResultWithRank](xbltournamentgameresultwithrank.md)  
  
The game result.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  