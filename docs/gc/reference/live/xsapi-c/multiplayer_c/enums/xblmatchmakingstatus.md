---
author: joannaleecy
title: XblMatchmakingStatus
description: Defines values that indicate the status of a matchmaking request for a session.
kindex: XblMatchmakingStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMatchmakingStatus  

Defines values that indicate the status of a matchmaking request for a session.    

## Syntax  
  
```cpp
enum class XblMatchmakingStatus  : uint32_t  
{  
    Unknown,  
    None,  
    Searching,  
    Expired,  
    Found,  
    Canceled  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The server returned an unrecognized response. |  
| None | The matchmaking search is not specified. This status is optional and requires the `clientMatchmaking` capability. |  
| Searching | The matchmaking search is still searching. |  
| Expired | The matchmaking search has expired. |  
| Found | The matchmaking search found a session. |  
| Canceled | The matchmaking search was canceled. |  
  
## Member of
  
[XblMultiplayerMatchmakingServer](../structs/xblmultiplayermatchmakingserver.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  