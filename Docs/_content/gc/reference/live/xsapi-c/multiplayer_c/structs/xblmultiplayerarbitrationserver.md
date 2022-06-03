---
author: joannaleecy
title: XblMultiplayerArbitrationServer
description: Represents the arbitration server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release.
kindex: XblMultiplayerArbitrationServer
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerArbitrationServer  

Represents the arbitration server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerArbitrationServer {  
    time_t ArbitrationStartTime;  
    XblTournamentArbitrationState ResultState;  
    XblTournamentGameResultSource ResultSource;  
    uint32_t ResultConfidenceLevel;  
    XblTournamentTeamResult* Results;  
    size_t ResultsCount;  
} XblMultiplayerArbitrationServer  
```
  
### Members  
  
*ArbitrationStartTime*  
Type: time_t  
  
The start time of the match. This time is also when arbitration starts.
  
*ResultState*  
Type: [XblTournamentArbitrationState](../enums/xbltournamentarbitrationstate.md)  
  
The state of the result.
  
*ResultSource*  
Type: [XblTournamentGameResultSource](../enums/xbltournamentgameresultsource.md)  
  
The source of the result.
  
*ResultConfidenceLevel*  
Type: uint32_t  
  
A value from 0 through 100 that indicates the confidence level of the result.
  
*Results*  
Type: [XblTournamentTeamResult*](xbltournamentteamresult.md)  
  
The results of the game.
  
*ResultsCount*  
Type: size_t  
  
The number of results.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  