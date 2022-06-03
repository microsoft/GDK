---
author: joannaleecy
title: XblMultiplayerActivityJoinRestriction
description: Enumerates who can join a player's current activity.
kindex: XblMultiplayerActivityJoinRestriction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityJoinRestriction  

Enumerates who can join a player's current activity.    

## Syntax  
  
```cpp
enum class XblMultiplayerActivityJoinRestriction  : uint32_t  
{  
    Public = 0,  
    InviteOnly = 1,  
    Followed = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Public | Everyone. |  
| InviteOnly | Only invited players. |  
| Followed | Only followed players. |  
  
## Remarks  
  
To see how this enumeration is used, see "Setting an activity" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Member of
  
[XblMultiplayerActivityInfo](../structs/xblmultiplayeractivityinfo.md)
  
## Argument of
  
[XblMultiplayerActivitySetActivityAsync](../functions/xblmultiplayeractivitysetactivityasync.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  