---
author: joannaleecy
title: XblTournamentGameResultSource
description: Defines values that indicate the source for a tournament game state. DEPRECATED. This enumeration will be removed in a future release.
kindex: XblTournamentGameResultSource
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTournamentGameResultSource  

Defines values that indicate the source for a tournament game state. DEPRECATED. This enumeration will be removed in a future release.    

## Syntax  
  
```cpp
enum class XblTournamentGameResultSource  : uint32_t  
{  
    None,  
    Arbitration,  
    Server,  
    Adjusted,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No game result source. |  
| Arbitration | Game result is determined by client arbitration. |  
| Server | Game result is determined by game servers. |  
| Adjusted | Game result is adjusted by tournament administrator. |  
  
## Member of
  
[XblMultiplayerArbitrationServer](../structs/xblmultiplayerarbitrationserver.md)  
[XblMultiplayerTournamentsServer](../structs/xblmultiplayertournamentsserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  