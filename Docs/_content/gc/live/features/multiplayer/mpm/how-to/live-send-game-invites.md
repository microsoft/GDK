---
title: Send game invites by using Multiplayer Manager
description: Describes how to use Multiplayer Manager so a player can send game invites to other players to join a game.
kindex:
- Sending game invites using Multiplayer Manager
- multiplayer
- multiplayer manager
- flowchart
- game invite
ms.topic: conceptual
ms.assetid: 8b9a98af-fb78-431b-9a2a-876168e2fd76
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Sending game invites using Multiplayer Manager

In a simple multiplayer scenario, a player of your game can play it online with friends. This topic describes the steps for sending invites to another player to join your game.

Initialize Multiplayer Manager and create a lobby session by adding local users. For more information, see [Enable playing a multiplayer game with friends by using Multiplayer Manager](live-play-multiplayer-with-friends.md).
After you receive the [XblMultiplayerEventType](../../../../../reference/live/xsapi-c/multiplayer_manager_c/enums/xblmultiplayereventtype.md)`::UserAdded` event, you can start sending invites.

An invite can be sent in two ways.
* [Xbox platform invite title-callable UI (TCUI)](#xbox-platform-invite-tcui)
* [Title-implemented custom UI](#title-implemented-custom-ui)

For more information about the process, see [Sending invites to another player (flowchart)](../concepts/flowcharts/live-mpm-send-invites.md).

### Xbox platform invite TCUI <a id="xbox-platform-invite-tcui"></a>

Call [XblMultiplayerManagerLobbySessionInviteFriends](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninvitefriends.md) to display the standard Xbox UI where the player can select friends or recent players to invite to the game.
When the player confirms their selection, Multiplayer Manager sends the invites to the selected players.

#### Flat C API
```cpp
std::string customActivationContext = "{ \"customGameData\": 1 }"; // This string can be anything your game sends across to the invited player's game.

HRESULT hr = XblMultiplayerManagerLobbySessionInviteFriends(xuserHandle, nullptr, customActivationContext.c_str());
```




Multiplayer Manager performs the following functions to invite players by using the Xbox platform invite TCUI.

* Displays the Xbox standard TCUI.
* Sends invite directly to the selected players.

### Title-implemented custom UI<a id="title-implemented-custom-ui"></a>

Your title can implement a custom TCUI for viewing online friends and inviting them.
Games can use the [XblMultiplayerManagerLobbySessionInviteUsers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninviteusers.md) method to send invites to a set of people defined by their Xbox Live User IDs.
This is useful if you use your own in-game UI instead of the standard Xbox UI.

#### Flat C API

```cpp
size_t xuidsCount = 1;
uint64_t xuids[1] = {};
xuids[0] = 1234567891234567;
HRESULT hr = XblMultiplayerManagerLobbySessionInviteUsers(
    xblUserHandle, 
    xuids, 
    xuidsCount, 
    nullptr,    // ContextStringId 
    nullptr     // CustomActivationContext
);
```




When using a title-implemented custom UI, Multiplayer Manager sends an invite directly to selected players.