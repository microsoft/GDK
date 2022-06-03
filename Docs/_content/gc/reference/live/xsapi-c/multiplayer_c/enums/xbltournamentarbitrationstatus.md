---
author: joannaleecy
title: XblTournamentArbitrationStatus
description: Defines values that indicate the status of a tournament game result. DEPRECATED. This enumeration will be removed in a future release.
kindex: XblTournamentArbitrationStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentArbitrationStatus  

Defines values that indicate the status of a tournament game result. DEPRECATED. This enumeration will be removed in a future release.    

## Syntax  
  
```cpp
enum class XblTournamentArbitrationStatus  : uint32_t  
{  
    Waiting,  
    InProgress,  
    Complete,  
    Playing,  
    Incomplete,  
    Joining  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Waiting | The system time is before the arbitration start time (`ArbitrationStartTime`), which is also the start time for the match. |  
| InProgress | The system time is after the arbitration start time (`ArbitrationStartTime`), and at least one player has become active. |  
| Complete | The player reported results, so the player's role in the arbitration process is now done. Occurs when arbitration succeeds, after the arbitration forfeit time (`ArbitrationStartTime` plus the `ForfeitTimeout` delta) if no players have joined, or after arbitration time-out (`ArbitrationStartTime` plus the `ArbitrationTimeout` delta). |  
| Playing | The player has become active at least once and is now participating in the match. |  
| Incomplete | The player was not able to upload results before arbitration time-out (`ArbitrationStartTime` plus the `ArbitrationTimeout` delta). |  
| Joining | The system time is after the arbitration start time (`ArbitrationStartTime`), but the player is not yet active. |  
  
## Member of
  
[XblMultiplayerSessionMember](../structs/xblmultiplayersessionmember.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
[XblMultiplayerSessionConstants](../structs/xblmultiplayersessionconstants.md)
  
  