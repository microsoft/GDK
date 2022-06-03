---
title: Multiplayer Manager API overview
description: Describes the most important methods in the Multiplayer Manager API.
kindex: Multiplayer Manager API overview
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 658babf5-d43e-4f5d-a5c5-18c08fe69a66
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Multiplayer Manager API overview

This topic describes the most important methods in the Multiplayer Manager API.

For detailed API information, see the [reference documentation](../../../../../reference/live/gc-reference-live-toc.md).

For examples of how to use these APIs in an application, see the [NetRumble sample (NDA topic)](../../../../../samples/gdk-console-samples.md).

## Namespace

Multiplayer Manager is included the following namespace.

| Language | Namespace |
| --- | --- |
| C | `XblMultiplayerManager*` prefix |
| C++ | `xbox::services::multiplayer::manager` |

You should understand the following major classes.

* [Multiplayer Manager class](#multiplayer-manager-class)
* [Multiplayer Event class](#multiplayer-event-class)
* [Multiplayer Member class](#multiplayer-member-class)
* [Multiplayer Lobby Session class](#multiplayer-lobby-session-class)
* [Multiplayer Game Session class](#multiplayer-game-session-class)


## Multiplayer Manager class <a name="multiplayer-manager-class"></a>

Multiplayer Manager is a singleton class that contains a single lobby session object and a single game session object.

At a minimum, you must call the [XblMultiplayerManagerInitialize](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerinitialize.md) and [XblMultiplayerManagerDoWork](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerdowork.md) methods on this class for Multiplayer Manager to function.

The following table describes some, but not all, of the more commonly used methods and properties.
For a complete, descriptive list of members, see the [reference documentation](../../../../../reference/live/gc-reference-live-toc.md).

| C | C++ | Description |
| --- | --- | --- |
| **Methods** | | |
| [XblMultiplayerManagerInitialize](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerinitialize.md) | `initialize()` | Initializes Multiplayer Manager. You must call this method before using Multiplayer Manager. |
| [XblMultiplayerManagerDoWork](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerdowork.md) | `do_work()` | Updates the app-visible session states. You should call this method at least once per frame. Your game should handle the multiplayer events that are returned by the method. |
| [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md) | `join_lobby()` | Provides a way to join a friend's lobby session through a `handleId` that uniquely identifies the lobby that the user wants to join or when the user accepts an invite that causes the title to get protocol-activated. |
| [XblMultiplayerManagerJoinGameFromLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoingamefromlobby.md) | `join_game_from_lobby()` | Join the lobby's game session if one exists and if there's room. If the session doesn't exist, it creates a new game session with the existing lobby members. This doesn't migrate existing lobby session properties over to the game session. After joining, you can set the properties or the host via the `*SetSynchronizedProperties` APIs. The title is required to call this API on all clients that want to join the game session.|
| [XblMultiplayerManagerJoinGame](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoingame.md) | `join_game()` | Joins an existing game session given a globally unique session name, typically found through third-party matchmaking services. You can pass in the list of Xbox user IDs that you want to be part of the game.|
| [XblMultiplayerManagerFindMatch](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerfindmatch.md) | `find_match()` | Use Xbox Live matchmaking to find and join a game. |
| [XblMultiplayerManagerLeaveGame](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerleavegame.md) | `leave_game()` | Leaves a game and returns the member and all local members to the lobby. |
| **Properties** | | |
| `LobbySession` | `lobby_session()` | A handle to an object that represents the lobby session. |
| `GameSession` | `game_session()` | A handle to an object that represents the game session. |

## Multiplayer Event class <a name="multiplayer-event-class"></a>

| Language | Class |
| --- | --- |
| C | [XblMultiplayerEvent](../../../../../reference/live/xsapi-c/multiplayer_manager_c/structs/xblmultiplayerevent.md) |
| C++ | `multiplayer_event` |

When you call [XblMultiplayerManagerDoWork](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerdowork.md), Multiplayer Manager returns a list of events that represent the changes to the sessions since you last called `XblMultiplayerManagerDoWork`.
These events include changes such as a member has joined a session, a member has left a session, member properties have changed, or the host client has changed.

For a list of all possible event types, see the [XblMultiplayerEventType](../../../../../reference/live/xsapi-c/multiplayer_manager_c/enums/xblmultiplayereventtype.md) enumeration.

Each returned [XblMultiplayerEvent](../../../../../reference/live/xsapi-c/multiplayer_manager_c/structs/xblmultiplayerevent.md) includes an `EventArgsHandle`. You must use it to get the appropriate `args` for the event type.
For example, if the [XblMultiplayerEventType](../../../../../reference/live/xsapi-c/multiplayer_manager_c/enums/xblmultiplayereventtype.md) is `MemberJoined`, you would call [XblMultiplayerEventArgsMembersCount](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayereventargsmemberscount.md) and [XblMultiplayerEventArgsMembers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayereventargsmembers.md).

Your game should handle each of the events as necessary after calling [XblMultiplayerManagerDoWork](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerdowork.md).


## Multiplayer Member class <a name="multiplayer-member-class"></a>

| Language | Class |
| --- | --- |
| C | [XblMultiplayerManagerMember](../../../../../reference/live/xsapi-c/multiplayer_manager_c/structs/xblmultiplayermanagermember.md) |
| C++ | `multiplayer_member` |

This class represents a player in a lobby or game session.
It contains properties about the member, such as the Xbox user ID for the player, the network connection address for the player, and custom properties for each player.

## Multiplayer Lobby Session class <a name="multiplayer-lobby-session-class"></a>

| Language | Class |
| --- | --- |
| C | `XblMultiplayerManagerLobbySession*` prefix |
| C++ | `multiplayer_lobby_session` |

This class creates a persistent session that's used for managing users that are local to this device and the invited friends who want to play together.
A lobby session must contain at least one member for Multiplayer Manager to take any multiplayer actions.
You can initially create a new lobby session by calling the [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md) method.

The following table describes some, but not all, of the more commonly used methods and properties for this class.
For a complete, descriptive list of class members, see the [reference documentation](../../../../../reference/live/gc-reference-live-toc.md).

| C | C++ | Description |
| --- | --- | --- |
| **Methods** | | |
| [XblMultiplayerManagerLobbySessionAddLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionaddlocaluser.md) | `add_local_user()` | Adds a local user (a player who has signed in on the local device) to the lobby session. If this is the first member added to a lobby session, this method creates a new lobby session. |
| [XblMultiplayerManagerLobbySessionRemoveLocalUser](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionremovelocaluser.md) | `remove_local_user()` | Removes a specified member from the lobby and game session. |
| [XblMultiplayerManagerLobbySessionInviteFriends](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninvitefriends.md) | `invite_friends()` | Opens a standard Xbox Live UI that allows the player to select friends from their friends list, and then invites those players to the game. |
| [XblMultiplayerManagerLobbySessionInviteUsers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessioninviteusers.md) | `invite_users()` | Invites the specified Xbox Live users to the game. |
| [XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md) | `set_local_member_connection_address()` | Sets the network address for the local member. Games can use this network address to establish network communications between members. |
| [XblMultiplayerManagerLobbySessionSetLocalMemberProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetlocalmemberproperties.md) | `set_local_member_properties()` | Sets a custom property for a local member. The property is stored in a JSON string. |
| [XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessiondeletelocalmemberproperties.md) | `delete_local_member_properties()` | Removes a custom property for a local member. |
| [XblMultiplayerManagerLobbySessionSetProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetproperties.md) / [XblMultiplayerManagerLobbySessionSetSynchronizedProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetsynchronizedproperties.md) | `set_properties()` / `set_synchronized_properties()` | Sets a custom property for the lobby session. The property is stored in a JSON string. If the property is shared between devices, and can be updated by several devices at the same time, use the synchronized version of the method. |
| [XblMultiplayerManagerGameSessionIsHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionishost.md) | `is_host()` | Indicates if the current device is acting as the lobby host. |
| [XblMultiplayerManagerGameSessionSetSynchronizedHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionsetsynchronizedhost.md) | `set_synchronized_host()` | Sets the host of the lobby. |
| **Properties** | | |
| [XblMultiplayerManagerLobbySessionLocalMembers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionlocalmembers.md) | `local_members()` | The collection of members that are signed in on the local device. |
| [XblMultiplayerManagerLobbySessionMembers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionmembers.md) | `members()` | The collection of members that are in the lobby session. |
| [XblMultiplayerManagerLobbySessionSetProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionsetproperties.md) | `properties()` | A JSON object that represents a collection of properties for the lobby session. |
| [XblMultiplayerManagerLobbySessionHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerlobbysessionhost.md) | `host()` | The host member for the lobby. |


## Multiplayer Game Session class <a name="multiplayer-game-session-class"></a>

| Language | Class |
| --- | --- |
| C | `XblMultiplayerManagerGameSession*` prefix |
| C++ | `multiplayer_game_session` |

The game session represents the group of Xbox Live members that are participating in an instance of actual game play.
This can include players who have been matched up via matchmaking services.

To start a new game session that includes members from the lobby session, call [XblMultiplayerManagerJoinGameFromLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoingamefromlobby.md).
If you want to use Xbox Live matchmaking, call [XblMultiplayerManagerFindMatch](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerfindmatch.md).
If you're using a third-party matchmaking service, call [XblMultiplayerManagerJoinGame](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoingame.md).

The following table describes some, but not all, of the more commonly used methods and properties for Multiplayer Manager.
For a complete, descriptive list of class members, see the API reference for this class.

| C | C++ | Description |
| --- | --- | --- |
| **Methods** | | |
| [XblMultiplayerManagerGameSessionSetProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionsetproperties.md) / [XblMultiplayerManagerGameSessionSetSynchronizedProperties](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionsetsynchronizedproperties.md) | `set_properties()` / `set_synchronized_properties()` | Sets a custom property for the game session. The property is stored in a JSON string. If the property is shared between devices, and can be updated by several devices at the same time, use the synchronized version of the method. |
| [XblMultiplayerManagerGameSessionIsHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionishost.md) | `is_host()` | Indicates if the current device is acting as the game host. |
| [XblMultiplayerManagerGameSessionSetSynchronizedHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionsetsynchronizedhost.md) | `set_synchronized_host()` | Sets the host of the game. |
| **Properties** | | |
| [XblMultiplayerManagerGameSessionMembers](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionmembers.md) | `members()` | The collection of members that are in the game session. |
| [XblMultiplayerManagerGameSessionPropertiesJson](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionpropertiesjson.md) | `properties()` | A JSON object that represents a collection of properties for the game session. |
| [XblMultiplayerManagerGameSessionHost](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagergamesessionhost.md) | `host()` | The host member for the game. |