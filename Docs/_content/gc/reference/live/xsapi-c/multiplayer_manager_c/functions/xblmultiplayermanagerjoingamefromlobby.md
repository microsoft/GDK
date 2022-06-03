---
author: joannaleecy
title: XblMultiplayerManagerJoinGameFromLobby
description: Creates a new game session for the lobby session, or joins an existing game session if one exists for the lobby session.
kindex: XblMultiplayerManagerJoinGameFromLobby
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerJoinGameFromLobby  

Creates a new game session for the lobby session, or joins an existing game session if one exists for the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerJoinGameFromLobby(  
         const char* sessionTemplateName  
)  
```  
  
### Parameters  
  
*sessionTemplateName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the session template for the game session to be based on.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function creates a new game session and adds the current members of the lobby session to the game session, if a game session doesn't already exist. If a new user joins the lobby session after a game session is already created, this function finds the existing game session in Multiplayer Session Directory (MPSD) by using a transfer handle in the lobby session, and then adds the new user to the game session using that transfer handle. For more information, see [Multiplayer concepts overview](../../../../../live/features/multiplayer/concepts/live-multiplayer-concepts.md). If a lobby session doesn't exist, likely because [XblMultiplayerManagerInitialize](xblmultiplayermanagerinitialize.md) wasn't called before calling this function, an error occurs. An error also occurs if matchmaking is in progress. This function does not migrate existing lobby session properties to the game session. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::JoinGameCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />When attempting to join a lobby session, the service returns `HTTP_E_STATUS_BAD_REQUEST` if the server is full.  <br />After joining, you can set the properties for the game session by calling [XblMultiplayerManagerGameSessionSetProperties](xblmultiplayermanagergamesessionsetproperties.md) or [XblMultiplayerManagerGameSessionSetSynchronizedProperties](xblmultiplayermanagergamesessionsetsynchronizedproperties.md), or you can set the host for the game session by calling [XblMultiplayerManagerGameSessionSetSynchronizedHost](xblmultiplayermanagergamesessionsetsynchronizedhost.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinability](xblmultiplayermanagerjoinability.md)  
[XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md)  
[XblMultiplayerManagerJoinLobby](xblmultiplayermanagerjoinlobby.md)
  
  