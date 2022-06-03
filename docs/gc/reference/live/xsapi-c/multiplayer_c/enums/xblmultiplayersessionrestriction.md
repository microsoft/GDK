---
author: joannaleecy
title: XblMultiplayerSessionRestriction
description: Defines values that indicate restrictions on the users who can join a session.
kindex: XblMultiplayerSessionRestriction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionRestriction  

Defines values that indicate restrictions on the users who can join a session.    

## Syntax  
  
```cpp
enum class XblMultiplayerSessionRestriction  : uint32_t  
{  
    Unknown,  
    None,  
    Local,  
    Followed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown restriction type. |  
| None | No restrictions. |  
| Local | Only players whose token `DeviceId` values match the `DeviceId` of a player who is already in the session and active. |  
| Followed | Only local players (as defined for `Local`) and players who are followed by an existing (not reserved) member of the session can join without a reservation. |  
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  