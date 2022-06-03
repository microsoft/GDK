---
author: joannaleecy
title: XblMultiplayerTournamentsServer
description: Represents the tournament server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release.
kindex: XblMultiplayerTournamentsServer
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerTournamentsServer  

Represents the tournament server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerTournamentsServer {  
    XblTournamentReference TournamentReference;  
    XblMultiplayerTournamentTeam* Teams;  
    size_t TeamsCount;  
    XblTournamentRegistrationState RegistrationState;  
    XblTournamentRegistrationReason RegistrationReason;  
    time_t NextGameStartTime;  
    XblMultiplayerSessionReference NextGameSessionReference;  
    time_t LastGameEndTime;  
    XblTournamentTeamResult LastTeamResult;  
    XblTournamentGameResultSource LastGameResultSource;  
} XblMultiplayerTournamentsServer  
```
  
### Members  
  
*TournamentReference*  
Type: [XblTournamentReference](xbltournamentreference.md)  
  
The tournament reference.
  
*Teams*  
Type: [XblMultiplayerTournamentTeam*](xblmultiplayertournamentteam.md)  
  
The teams in the tournament.
  
*TeamsCount*  
Type: size_t  
  
The number of teams in the tournament.
  
*RegistrationState*  
Type: [XblTournamentRegistrationState](../enums/xbltournamentregistrationstate.md)  
  
The registration state of the team.
  
*RegistrationReason*  
Type: [XblTournamentRegistrationReason](../enums/xbltournamentregistrationreason.md)  
  
The reason for the registration state.
  
*NextGameStartTime*  
Type: time_t  
  
The start time of the next game in the tournament.
  
*NextGameSessionReference*  
Type: [XblMultiplayerSessionReference](xblmultiplayersessionreference.md)  
  
The session reference of the next game in the tournament.
  
*LastGameEndTime*  
Type: time_t  
  
The end time of the last game in the tournament.
  
*LastTeamResult*  
Type: [XblTournamentTeamResult](xbltournamentteamresult.md)  
  
The result of the last game in the tournament.
  
*LastGameResultSource*  
Type: [XblTournamentGameResultSource](../enums/xbltournamentgameresultsource.md)  
  
The source of the result of the last game in the tournament.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  