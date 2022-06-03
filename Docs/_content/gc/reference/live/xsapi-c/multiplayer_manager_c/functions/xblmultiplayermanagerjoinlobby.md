---
author: joannaleecy
title: XblMultiplayerManagerJoinLobby
description: Joins an Xbox user to a lobby session.
kindex: XblMultiplayerManagerJoinLobby
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerJoinLobby  

Joins an Xbox user to a lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerJoinLobby(  
         const char* handleId,  
         XblUserHandle user  
)  
```  
  
### Parameters  
  
*handleId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The activity handle for the lobby session.  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user handle of the user joining the lobby session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function joins the Xbox user specified in *user* to the lobby session specified in *handleId*. The activity handle for the lobby session is typically retrieved either from a game invite or from the `HandleId` value of another user's [XblMultiplayerActivityDetails](../../multiplayer_c/structs/xblmultiplayeractivitydetails.md), by calling [XblMultiplayerGetActivitiesForUsersAsync](../../multiplayer_c/functions/xblmultiplayergetactivitiesforusersasync.md). For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md). <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::JoinLobbyCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />When attempting to join a lobby session, the service returns `HTTP_E_STATUS_BAD_REQUEST` if the server is full.  <br />After joining, you can set the properties for the lobby session by calling [XblMultiplayerManagerLobbySessionSetSynchronizedProperties](xblmultiplayermanagerlobbysessionsetsynchronizedproperties.md), or you can set the host for the lobby session by calling [XblMultiplayerManagerLobbySessionSetSynchronizedHost](xblmultiplayermanagerlobbysessionsetsynchronizedhost.md) if the lobby session doesn't already have a host.  <br />You can also send an invite to another user by calling either [XblMultiplayerManagerLobbySessionInviteUsers](xblmultiplayermanagerlobbysessioninviteusers.md) or [XblMultiplayerManagerLobbySessionInviteFriends](xblmultiplayermanagerlobbysessioninvitefriends.md). If you don't need a lobby session, and if you haven't added local users by calling [XblMultiplayerManagerLobbySessionAddLocalUser](xblmultiplayermanagerlobbysessionaddlocaluser.md), you can instead call [XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md) and specify the list of users to join the game.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinability](xblmultiplayermanagerjoinability.md)  
[XblMultiplayerManagerJoinGameFromLobby](xblmultiplayermanagerjoingamefromlobby.md)
  
  