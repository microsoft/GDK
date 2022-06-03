---
author: joannaleecy
title: XblTournamentRegistrationReason
description: Defines values that indicate reasons why the team is under selected tournament registration state. DEPRECATED. It will be removed in a future release
kindex: XblTournamentRegistrationReason
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentRegistrationReason  

Defines values that indicate reasons why the team is under selected tournament registration state. DEPRECATED. It will be removed in a future release    

## Syntax  
  
```cpp
enum class XblTournamentRegistrationReason  : uint32_t  
{  
    Unknown,  
    RegistrationClosed,  
    MemberAlreadyRegistered,  
    TournamentFull,  
    TeamEliminated,  
    TournamentCompleted  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The reason is unknown. |  
| RegistrationClosed | The registration for this tournament is closed. |  
| MemberAlreadyRegistered | One of the team members is already registered for this tournament. |  
| TournamentFull | The tournament has reached its team registration limit. |  
| TeamEliminated | The team has been eliminated from the tournament. |  
| TournamentCompleted | The tournament is completed. |  
  
## Member of
  
[XblMultiplayerTournamentsServer](../structs/xblmultiplayertournamentsserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  