---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionRemoveLocalUser
description: Removes the local user from both the lobby session and game session.
kindex: XblMultiplayerManagerLobbySessionRemoveLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionRemoveLocalUser  

Removes the local user from both the lobby session and game session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionRemoveLocalUser(  
         XblUserHandle user  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The local user to be removed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
If there are no local users remaining after this function is called, the title cannot perform any further multiplayer operations. Changes are batched and written to the service when [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::UserRemoved`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  <br />After leaving, you can join a different game by calling either [XblMultiplayerManagerJoinGame](xblmultiplayermanagerjoingame.md) or [XblMultiplayerManagerJoinGameFromLobby](xblmultiplayermanagerjoingamefromlobby.md), or you can re-add the local user by calling [XblMultiplayerManagerLobbySessionAddLocalUser](xblmultiplayermanagerlobbysessionaddlocaluser.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinLobby](xblmultiplayermanagerjoinlobby.md)  
[XblMultiplayerManagerLobbySessionInviteFriends](xblmultiplayermanagerlobbysessioninvitefriends.md)  
[XblMultiplayerManagerLobbySessionInviteUsers](xblmultiplayermanagerlobbysessioninviteusers.md)
  
  