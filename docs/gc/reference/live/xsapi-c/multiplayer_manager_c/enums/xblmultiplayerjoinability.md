---
author: joannaleecy
title: XblMultiplayerJoinability
description: Defines values used to indicate who can join your lobby.
kindex: XblMultiplayerJoinability
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerJoinability  

Defines values used to indicate who can join your lobby.    

## Syntax  
  
```cpp
enum class XblMultiplayerJoinability  : uint32_t  
{  
    None,  
    JoinableByFriends,  
    InviteOnly,  
    DisableWhileGameInProgress,  
    Closed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | Joinability not set or no lobby exists yet. |  
| JoinableByFriends | Default value. The lobby is joinable by users who are followed by an existing member of the session. |  
| InviteOnly | The lobby is joinable only via an invite. |  
| DisableWhileGameInProgress | This option will close the lobby only when a game is in progress. All other times, it will keep the lobby open for InviteOnly so invitees can join when no game is in progress. |  
| Closed | This option will close the lobby immediately. |  
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  