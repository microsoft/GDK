---
title: Handling protocol activation to start a game by using Multiplayer Manager
description: Describes using Multiplayer Manager to handle protocol activation so that the game automatically starts in response to another action, such as when a player accepts a game invite from another player.
kindex:
- Handling activation to start a game by using Multiplayer Manager
- multiplayer manager
- protocol activation
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: e514bcb8-4302-4eeb-8c5b-176e23f3929f
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Handling protocol activation to start a game by using Multiplayer Manager

This topic describes using Multiplayer Manager to handle protocol activation.  

*Activation* is when the system automatically starts a game in response to another action. This is typically done when a player accepts a game invite from another player.

Your title can get protocol-activated in the following ways.

* A user accepts a game invite
* A user selects "Join Game" from a player's gamercard

This scenario covers how to handle the protocol activation when your title is launched, a player joins the lobby, and a game is in progress (if one exists).

For a flowchart of the protocol activation process, see [Handling protocol activation (flowchart)](../concepts/flowcharts/live-mpm-on-protocol-activation.md).

When a player accepts a game invite or joins a friend's game through the player's gamercard, the game is launched on their device by using protocol activation.
After the game starts, get the invite handle by using [XGameInviteRegisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md). With the invite handle, call [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md).

If the invited user isn't added via [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md), [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md) fails and provides the xuid that the invite was sent for by calling [XblMultiplayerEventArgsXuid](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayereventargsxuid.md) with the `JoinLobbyCompleted` event.

After joining the lobby, we recommend setting the local member's connection address and any custom properties for the member.
You can also set the host via [XblMultiplayerManagerLobbySessionSetSynchronizedHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetsynchronizedhost.md) if one doesn't exist.

Finally, the Multiplayer Manager auto-joins the user into the game session if a game is already in progress and has room for the invitee.
The title is notified through the `JoinGameCompleted` event, providing an appropriate error code and message.

#### Flat C API

```cpp
#include <XTaskQueue.h>
#include <XGameInvite.h>  
  
XTaskQueueHandle g_taskQueue;  
XTaskQueueRegistrationToken g_gameInviteEventToken;  
  
void OnGameInvite(void* context, const char* inviteUri)  
{  
    if (inviteUri != nullptr)
    {
        std::string inviteString(inviteUri);
        auto pos = inviteString.find("handle=");
        auto inviteHandeId = inviteString.substr(pos + 7, 36);
        // Now, call XblMultiplayerManagerJoinLobby.
    }
}  
  
void InitializeGame()  
{  
    XGameInviteRegisterForEvent(g_taskQueue, nullptr, OnGameInvite, &g_gameInviteEventToken);  
}  
  
void ShutdownGame()  
{  
    XGameInviteUnregisterForEvent(g_gameInviteEventToken);  
}  
```


```cpp
HRESULT hr = XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress(
    xblUserHandle, connectionAddress, context);
```

For more information, see [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md).





Multiplayer Manager performs the following functions.

* Register Real-Time Activity and multiplayer subscriptions.
* Join lobby session.
* Existing lobby state cleanup.
* Join all local players as active.
* Upload secure device address (SDA).
* Set member properties.
* Register for session change events.
* Set lobby session as active session.
* Join game session (if one exists).
* Use a transfer handle.