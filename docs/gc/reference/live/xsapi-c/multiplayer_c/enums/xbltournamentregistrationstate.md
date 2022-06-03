---
author: joannaleecy
title: XblTournamentRegistrationState
description: Defines values that indicate the team session registration state for a tournament. DEPRECATED. This enumeration will be removed in a future release.
kindex: XblTournamentRegistrationState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentRegistrationState  

Defines values that indicate the team session registration state for a tournament. DEPRECATED. This enumeration will be removed in a future release.    

## Syntax  
  
```cpp
enum class XblTournamentRegistrationState  : uint32_t  
{  
    Unknown,  
    Pending,  
    Withdrawn,  
    Rejected,  
    Registered,  
    Completed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The team registration state is unknown. |  
| Pending | Registration was successfully received by the Tournament service and will be eventually processed. |  
| Withdrawn | Registration for the team was withdrawn. |  
| Rejected | Registration could not be performed for the team. |  
| Registered | Registration has been confirmed by the Tournament service. |  
| Completed | The team completed its participation in the tournament. |  
  
## Member of
  
[XblMultiplayerTournamentsServer](../structs/xblmultiplayertournamentsserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  