---
title: Enable finding a multiplayer game by using SmartMatch using Multiplayer Manager
description: Describes how to use Multiplayer Manager so that a player can find a multiplayer game by using SmartMatch matchmaking.
kindex:
- Finding a multiplayer game by using SmartMatch using Multiplayer Manager
- multiplayer
- multiplayer manager, flowchart
- SmartMatch
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: f9001364-214f-4ba0-a0a6-0f3be0b2f523
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>
# Enable finding a multiplayer game by using SmartMatch using Multiplayer Manager

This topic describes the basic steps that you need to implement SmartMatch matchmaking by using Multiplayer Manager.

A player might not have enough friends online when they want to play a game, or they just want to play against random players online.
You can use the Xbox Live SmartMatch service to find other Xbox Live players.


## Find a match

The following steps use Multiplayer Manager to send an invite to a player's friend so that friend can join the game in progress.

1. [Initialize Multiplayer Manager](#initialize-multiplayer-manager)
2. [Create the lobby session by adding local users](#create-lobby)
3. [Send invites to friends (optional)](#send-invites)
4. [Accept invites (optional)](#accept-invites)
5. [Find a match](#find-match)

Steps 1, 2, 3, and 5 are done on the device that's performing the invite.
Step 4 is typically initiated on the invitee's device, following app launch via protocol activation.

For more information, see [Playing a game by using SmartMatch matchmaking (flowchart)](../concepts/flowcharts/live-mpm-play-with-smartmatch-matchmaking.md).

## Initialize Multiplayer Manager <a id="initialize-multiplayer-manager"></a>

The lobby session object is automatically created when Multiplayer Manager is initialized with a valid session template name. Session templates are defined in the service configuration.
> [!NOTE]
> The lobby session instance on the service isn't created until a user has been added.

### Flat C API

```cpp
HRESULT hr = XblMultiplayerManagerInitialize(lobbySessionTemplateName, queueUsedByMultiplayerManager);
```

For more information, see [XblMultiplayerManagerInitialize](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerinitialize.md).



 [Return to the top of this topic.](#top)
## Create the lobby session by adding local users<a id="create-lobby"></a>

Add the locally signed-in Xbox Live users to the lobby session.
A new lobby is hosted when the first user is added.
All other users are added to the existing lobby as secondary users.

Multiplayer Manager advertises the lobby in the shell for friends to join.
You can send invites, set lobby properties, and access lobby members only after you've added the local user.

When a local user joins the lobby, we recommend setting their connection address and any custom properties.

You must repeat this process for all locally signed-in users.

### Add a single local user

#### Flat C API


```cpp
HRESULT hr = XblMultiplayerManagerLobbySessionAddLocalUser(xblUserHandle);

if (!SUCCEEDED(hr))
{
    // Handle failure.
}

// Set member connection address.
const char* connectionAddress = "1.1.1.1";
hr = XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress(
    xblUserHandle, connectionAddress, context);

if (!SUCCEEDED(hr))
{
    // Handle failure.
}

// Set custom member properties.
const char* propName = "Name";
const char* propValueJson = "{}";
hr = XblMultiplayerManagerLobbySessionSetProperties(propName, propValueJson, context);

if (!SUCCEEDED(hr))
{
    // Handle failure.
}
...
```

For more information, see the following:
* [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md)
* [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md)
* [XblMultiplayerManagerLobbySessionSetProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetproperties.md)



 [Return to the top of this topic.](#top)
### Add multiple local users

#### Flat C API


```cpp
std::vector<XblUserHandle> xblUsers;
for (XblUserHandle xblUserHandle : xblUsers)
{
    HRESULT hr = XblMultiplayerManagerLobbySessionAddLocalUser(xblUserHandle);

    if (!SUCCEEDED(hr))
    {
        // Handle failure.
    }

    // Set member connection address.
    const char* connectionAddress = "1.1.1.1";
    hr = XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress(
        xblUserHandle, connectionAddress, context);

    if (!SUCCEEDED(hr))
    {
        // Handle failure.
    }

    // Set custom member properties.
    const char* propName = "Name";
    const char* propValueJson = "{}";
    hr = XblMultiplayerManagerLobbySessionSetProperties(propName, propValueJson, context);
    ...
}
```

For more information, see the following:
* [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md)
* [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md)
* [XblMultiplayerManagerLobbySessionSetProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetproperties.md)




The changes are batched on the next [XblMultiplayerManagerDoWork](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerdowork.md) call.
Multiplayer Manager fires an [XblMultiplayerEventType](../../../../../reference/live/xsapi-c/multiplayer_manager_c/enums/xblmultiplayereventtype.md)`::UserAdded` event each time a local user is added to the lobby session.

We recommend that you check the error code of the event to see if that user was successfully added.
In case of a failure, an error message provides details of the reasons for the failure.

Multiplayer Manager performs the following functions to create the lobby session by adding local users.

* Register Real Time-Activity and multiplayer subscriptions with the Xbox Live multiplayer service.
* Create the lobby session.
* Join all local players as active.
* Upload secure device address (SDA).
* Set member properties.
* Register for session change events.
* Set the lobby session as an active session.

 [Return to the top of this topic.](#top)
## Send invites to friends (optional) <a id="send-invites"></a>

Display the standard Xbox UI where the player can select friends or recent players to invite to the game.
When the player confirms their selection, Multiplayer Manager sends the invites to the selected players.

Games can also use the [XblMultiplayerManagerLobbySessionInviteUsers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninviteusers.md) method to send invites to a set of players who are defined by their Xbox Live User IDs.
This method is useful if you use your own in-game UI instead of the standard Xbox UI.

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

For more information, see [XblMultiplayerManagerLobbySessionInviteUsers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninviteusers.md).



Multiplayer Manager performs the following functions to send invites to friends.
* Displays the Xbox standard title-callable UI (TCUI)
* Sends an invite directly to the selected players

 [Return to the top of this topic.](#top)

## Accept invites (optional) <a id="accept-invites"></a>

When an invited player accepts a game invite or joins a friend's game via a shell UI, the game is launched on their device by using protocol activation.
After the game starts, Multiplayer Manager can use the protocol-activated event arguments to join the lobby.

If the invited user isn't added via [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md), [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md) fails and provides the xuid for which the invite was sent by calling [XblMultiplayerEventArgsXuid](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayereventargsxuid.md) with the `JoinLobbyCompleted` event.

After joining the lobby, we recommend setting the local member's connection address and any custom properties for the member.
You can also set the host via [XblMultiplayerManagerLobbySessionSetSynchronizedHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetsynchronizedhost.md) if one doesn't exist.

Finally, Multiplayer Manager will auto-join the user into the game session if a game is already in progress and has room for the invitee.
The title is notified through the `JoinGameCompleted` event, providing an appropriate error code and message.

Error or success results are handled via the `JoinLobbyCompleted` event.

#### Flat C API


```cpp
HRESULT hr = XblMultiplayerManagerJoinLobby(inviteHandleId, xblUserHandle);
if (!SUCCEEDED(hr))
{
    // Handle failure.
}

// Set member connection address.
const char* connectionAddress = "1.1.1.1";
hr = XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress(
    xblUserHandle, connectionAddress, context);
```

For more information, see the following:
* [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md)
* [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md)




 Multiplayer Manager performs the following functions to accept invites.
* Register Real-Time Activity and multiplayer subscriptions.
* Join lobby session.
* Existing lobby state cleanup.
* Join all local players as active.
* Upload SDA.
* Set member properties.
* Register for session change events.
* Set lobby session as active session.
* Join game session (if one exists).
* Use transfer handle.

### Find match <a id="find-match"></a>

After invites have been accepted and the host is ready to start playing the game, you can use SmartMatch to do one of the following:
* Find an existing game that has enough open player slots for all the members in the lobby session by calling [XblMultiplayerManagerFindMatch](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerfindmatch.md).
* Create a new game session that includes all the members in the lobby session, and fill open slots with other players who are looking for a match of the same game type, by calling [XblMultiplayerManagerJoinGameFromLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoingamefromlobby.md) followed with [XblMultiplayerManagerAutoFillMembersDuringMatchmaking](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerautofillmembersduringmatchmaking.md).

Before you can call [XblMultiplayerManagerFindMatch](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerfindmatch.md), you must first configure hoppers in your service configuration.
A hopper defines the rules that SmartMatch uses to match players.

#### Flat C API


```cpp
uint32_t timeoutInSeconds = 30;
HRESULT hr = XblMultiplayerManagerFindMatch(hopperName, attributesJson, timeoutInSeconds);
if (!SUCCEEDED(hr))
{
    // Handle failure.
}
```

For more information, see [XblMultiplayerManagerFindMatch](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerfindmatch.md).



Multiplayer Manager performs the following functions to find a match.
* Create a match ticket.
* Handle all the Quality of Service (QoS) stages.
* Handle roster changes.
* Resubmit (if needed).
* Join target game session.
* Advertise game via lobby session.



 [Return to the top of this topic.](#top)