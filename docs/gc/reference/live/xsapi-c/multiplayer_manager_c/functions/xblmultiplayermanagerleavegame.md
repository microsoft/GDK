---
author: joannaleecy
title: XblMultiplayerManagerLeaveGame
description: Leaves the game session, returning the Xbox user and all other local users to the lobby session.
kindex: XblMultiplayerManagerLeaveGame
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLeaveGame  

Leaves the game session, returning the Xbox user and all other local users to the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLeaveGame(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function removes the Xbox user from the game session and returns the user back to the lobby session. The game session is set to null, and all local users are also removed from the game session and returned to the lobby session. Any matchmaking request in progress is canceled when this function is called. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::LeaveGameCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />After leaving, you can join a different game by calling either [XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md) or [XblMultiplayerManagerJoinGameFromLobby](xblmultiplayermanagerjoingamefromlobby.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md)  
[XblMultiplayerManagerJoinLobby](xblmultiplayermanagerjoinlobby.md)
  
  