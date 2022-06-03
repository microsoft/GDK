---
author: joannaleecy
title: XblMultiplayerManagerGameSessionMembersCount
description: Retrieves the number of members in the game session.
kindex: XblMultiplayerManagerGameSessionMembersCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionMembersCount  

Retrieves the number of members in the game session.  

## Syntax  
  
```cpp
size_t XblMultiplayerManagerGameSessionMembersCount(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: size_t
  
The number of members that are in the game session.
  
## Remarks  
  
When a friend accepts a game invite, the corresponding member is added to the lobby and the game session members list.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionMembersCount](xblmultiplayermanagerlobbysessionmemberscount.md)  
[XblMultiplayerManagerGameSessionMembers](xblmultiplayermanagergamesessionmembers.md)
  
  