---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionInviteUsers
description: Invites the specified users to the game without displaying additional UI.
kindex: XblMultiplayerManagerLobbySessionInviteUsers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionInviteUsers  

Invites the specified users to the game without displaying additional UI.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionInviteUsers(  
         XblUserHandle user,  
         const uint64_t* xuids,  
         size_t xuidsCount,  
         const char* contextStringId,  
         const char* customActivationContext  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user who is sending the invite.  
  
*xuids* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
The array of Xbox User IDs (XUIDs) to be invited.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `xuids` array.  
  
*contextStringId* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Optional. The custom context string ID, a string that is defined during Xbox Live ingestion, to identify the custom invitation text that is added to the standard invitation text. The ID string must be prefixed with three slash characters (" /// ").  
  
*customActivationContext* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Optional. The activation context string, a game-defined string that is passed to the invited game client and interpreted as desired by the game.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Multiplayer Manager sends invites to the selected players when this function is invoked. If a selected player accepts the invite, the title is notified. For GDK-based games, the title is notified by invoking the callback function specified when the [XGameInviteRegisterForEvent](../../../../system/xgameinvite/functions/xgameinviteregisterforevent.md) function was invoked. For games based on other platforms, the title is activated. For more information, see [Receiving invites](../../../../../live/features/multiplayer/invites/how-to/live-invites-receive.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinLobby](xblmultiplayermanagerjoinlobby.md)  
[XblMultiplayerManagerLobbySessionAddLocalUser](xblmultiplayermanagerlobbysessionaddlocaluser.md)  
[XblMultiplayerManagerLobbySessionInviteFriends](xblmultiplayermanagerlobbysessioninvitefriends.md)
  
  