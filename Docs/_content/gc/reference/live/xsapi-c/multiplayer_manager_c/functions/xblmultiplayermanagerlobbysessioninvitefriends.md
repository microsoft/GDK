---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionInviteFriends
description: Displays the standard Xbox UI, allowing the user to select friends or recent players and invite them to the game.
kindex: XblMultiplayerManagerLobbySessionInviteFriends
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionInviteFriends  

Displays the standard Xbox UI, allowing the user to select friends or recent players and invite them to the game.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionInviteFriends(  
         XblUserHandle requestingUser,  
         const char* contextStringId,  
         const char* customActivationContext  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user who is sending the invite.  
  
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
  
If this function is invoked, Multiplayer Manager sends invites to the selected players when the user confirms the player selection in the standard Xbox UI. If a selected player accepts the invite, the title is notified. For GDK-based games, the title is notified by invoking the callback function specified when the [XGameInviteRegisterForEvent](../../../../system/xgameinvite/functions/xgameinviteregisterforevent.md) function was invoked. For games based on other platforms, the title is activated. For more information, see [Receiving invites](../../../../../live/features/multiplayer/invites/how-to/live-invites-receive.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerJoinLobby](xblmultiplayermanagerjoinlobby.md)  
[XblMultiplayerManagerLobbySessionAddLocalUser](xblmultiplayermanagerlobbysessionaddlocaluser.md)  
[XblMultiplayerManagerLobbySessionInviteUsers](xblmultiplayermanagerlobbysessioninviteusers.md)
  
  