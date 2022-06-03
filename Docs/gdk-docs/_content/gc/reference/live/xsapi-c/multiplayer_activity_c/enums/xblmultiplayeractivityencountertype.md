---
author: joannaleecy
title: XblMultiplayerActivityEncounterType
description: Enumerates types of recent player encounters.
kindex: XblMultiplayerActivityEncounterType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityEncounterType  

Enumerates types of recent player encounters.    

## Syntax  
  
```cpp
enum class XblMultiplayerActivityEncounterType  : uint32_t  
{  
    Default = 0,  
    Teammate = 1,  
    Opponent = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Default | No inherent meaning. The title interprets this value as appropriate. |  
| Teammate | Teammate. |  
| Opponent | Opponent. |  
  
## Remarks  
  
To see how this enumeration is used, see "Setting an activity" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Member of
  
[XblMultiplayerActivityRecentPlayerUpdate](../structs/xblmultiplayeractivityrecentplayerupdate.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  