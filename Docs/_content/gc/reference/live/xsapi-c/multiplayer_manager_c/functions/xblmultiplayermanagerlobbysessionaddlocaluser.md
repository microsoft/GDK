---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionAddLocalUser
description: Joins an Xbox user to the lobby session.
kindex: XblMultiplayerManagerLobbySessionAddLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionAddLocalUser  

Joins an Xbox user to the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionAddLocalUser(  
         XblUserHandle user  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user handle of the user joining the lobby session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function creates a new lobby session and adds the Xbox user specified in *user* to the session. Subsequent users are added to the newly-hosted lobby session as secondary users. You can send invites, set session properties, and access members of the lobby session only after the first local user is added to the lobby session. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::JoinLobbyCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />When attempting to join a lobby session, the service returns `HTTP_E_STATUS_BAD_REQUEST` if the server is full.  <br />After joining, you can set the properties for the lobby session by calling [XblMultiplayerManagerLobbySessionSetSynchronizedProperties](xblmultiplayermanagerlobbysessionsetsynchronizedproperties.md), or you can set the host for the lobby session by calling [XblMultiplayerManagerLobbySessionSetSynchronizedHost](xblmultiplayermanagerlobbysessionsetsynchronizedhost.md) if the lobby session doesn't already have a host.  <br />You can also send an invite to another user by calling either [XblMultiplayerManagerLobbySessionInviteUsers](xblmultiplayermanagerlobbysessioninviteusers.md) or [XblMultiplayerManagerLobbySessionInviteFriends](xblmultiplayermanagerlobbysessioninvitefriends.md). If you don't need a lobby session, and if you haven't added local users by calling this function, you can instead call [XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md) and specify the list of users to join the game.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinability](xblmultiplayermanagerjoinability.md)  
[XblMultiplayerManagerJoinGameFromLobby](xblmultiplayermanagerjoingamefromlobby.md)
  
  