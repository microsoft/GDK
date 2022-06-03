---
author: joannaleecy
title: XblMultiplayerActivityRecentPlayerUpdate
description: Describes a recent player encounter.
kindex: XblMultiplayerActivityRecentPlayerUpdate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityRecentPlayerUpdate  

Describes a recent player encounter.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerActivityRecentPlayerUpdate {  
    uint64_t xuid;  
    XblMultiplayerActivityEncounterType encounterType;  
} XblMultiplayerActivityRecentPlayerUpdate  
```
  
### Members  
  
*xuid*  
Type: uint64_t  
  
Xbox user ID of the encountered user.
  
*encounterType*  
Type: [XblMultiplayerActivityEncounterType](../enums/xblmultiplayeractivityencountertype.md)  
  
The type of encounter.
  
## Remarks  
  
To see how this enumeration is used, see "Updating recent players" in the [Recent players](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#recent-players) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Argument of
  
[XblMultiplayerActivityUpdateRecentPlayers](../functions/xblmultiplayeractivityupdaterecentplayers.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  