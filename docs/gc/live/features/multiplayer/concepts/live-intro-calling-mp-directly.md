---
title: Introduction to calling the Multiplayer service directly
description: Provides an introduction to calling the 2015 Multiplayer API directly instead of using Multiplayer Manager.
kindex: Intro to calling the Multiplayer service directly
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: d025bd2b-2ca4-4ba9-9394-4950d96ad264
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 02/17/2021
security: public
---

# Introduction to calling the Multiplayer service directly
> [!NOTE]
> This topic covers direct usage of multiplayer APIs. For an overview of multiplayer features when developing titles by using the Microsoft Game Development Kit (GDK), see the following topics.
> - [Multiplayer overview (NDA topic)](../../../../multiplayer/multiplayer-intro.md)
> - [Xbox and PC multiplayer design guidance (NDA topic)](../../../../multiplayer/multiplayer-design-guidance-xbox-pc-gdk.md)
> - [Cross-platform multiplayer design guidance (NDA topic)](../../../../multiplayer/multiplayer-design-guidance-cross-platform.md)

## About the Multiplayer system

2015 Multiplayer optimizes the direct use of Multiplayer Session Directory (MPSD) and game sessions. It provides better support for multiple concurrent sessions for a single title or player, and it updates the Xbox Services API (XSAPI) to enable titles to:

- Advertise a player's current activity and availability for joins.
- Send invites to sessions, along with player-visible (title-specified) context strings.
- Discover and join sessions via title code.
- Maintain web socket connections to MPSD so that they can receive brief notifications (shoulder taps) on session changes; for example, updates that reflect subscriptions to change events and connection state changes. MPSD also uses web socket connections to rapidly detect and act on client disconnection.
- Use SmartMatch matchmaking.

## Multiplayer components, interfaces, and architectures

### Components of 2015 Multiplayer

Multiplayer is a system that consists of multiple components. 2015 Multiplayer is flexible enough to work with other components, such as dedicated servers and external matchmaking systems.

#### Multiplayer Session Directory

MPSD is a service that holds a collection of sessions. A _session_ is defined as a secure document residing in the cloud and representing a group of people who are playing a game.

For more information, see [Multiplayer Session Directory (MPSD)](../mpsd/live-mpsd-nav.md).

#### Multiplayer client API

The REST functionality can be used in direct calls from your titles, but we recommend that you access MPSD via XSAPI. For more information, see [Calling MPSD](../mpsd/live-mpsd-overview.md#calling-mpsd).



#### Xbox party system

In 2015 Multiplayer, the Xbox party system supports only chat parties as external entities. Titles can interact with the party system to discover the membership of chat parties. For more information, see [Parties supported by 2015 Multiplayer](#parties-supported-by-2015-multiplayer) later in this topic.

The party system now supports gaming directly through the MPSD session instead of using a game party. It's up to the title to use sessions to enable operations such as member interaction, pulling of players into a game as space becomes available, and player engagement during wait periods.

### 2015 Multiplayer interfaces

2015 Multiplayer uses several interfaces to other Xbox components.

#### Xbox secure sockets

2015 Multiplayer supports low-level network communication among devices by using Xbox secure sockets and Winsock. The networking functionality uses Internet Protocol Security (IPSec) so that titles can provide secure device association.

#### Xbox Live Real-Time Activity service

2015 Multiplayer uses the Real-Time Activity (RTA) service so that titles can subscribe to MPSD session changes and automatically detect client disconnections. For more information, see [Real-Time Activity (RTA) service](/gaming/xbox-live/features/rta/live-rta-nav).

#### Xbox Live SmartMatch matchmaking service

The SmartMatch matchmaking service forms groups of players based on player preferences and data and information supplied during matchmaking. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md).

#### Xbox Live Reputation service

The Reputation service manages player statistics about reputation and enables reputation-filtered matchmaking. 2015 Multiplayer uses the Reputation service through SmartMatch matchmaking. For more information, see [Reputation](../../social/reputation/live-reputation-nav.md).



### Typical 2015 Multiplayer architectures

This section presents the most typical 2015 Multiplayer architectures.

#### Peer-to-peer architecture

In peer-to-peer architecture, the title uses MPSD and SmartMatch matchmaking to discover peer addresses. The title then uses the addresses to connect peers by using Xbox secure sockets, as shown in the following diagram. For more information, see [Introduction to Windows sockets](../../../../networking/overviews/game-mesh/winsock-intro-networking.md).

![Diagram that shows peer-to-peer architecture](../../../../../../resources/gamecore/secure/images/en-us/live/multiplayer/Mult2015ArchPeer.png)

#### Client/server architecture

In client/server architecture, the title uses MPSD and SmartMatch matchmaking to discover dedicated server addresses. The title then uses the addresses to connect to the dedicated server by using Xbox secure sockets, as shown in the following diagram. For more information, see [Introduction to Windows sockets](../../../../networking/overviews/game-mesh/winsock-intro-networking.md).

![Diagram that shows client/server architecture](../../../../../../resources/gamecore/secure/images/en-us/live/multiplayer/Mult2015ArchClientServer.png)
> [!NOTE]
> Instances of Azure PlayFab servers can be the servers in client/server architecture. For more information, see [Multiplayer Servers](/gaming/playfab/features/multiplayer/servers/).

<a id="parties-supported-by-2015-multiplayer"></a>
## Parties supported by 2015 Multiplayer

2015 Multiplayer for Xbox One (or later) doesn't expose the "game party" as a system-level construct. However, it does support the "chat party" at a system level, as did 2014 Multiplayer. And by using MPSD sessions, your titles can still provide player experiences that are similar to those that used the game party.

### Chat party

A *chat party* is a group of people who are chatting with each other, managed by the player through the Xbox One Party app. Players can be in a chat party while playing in a game session or while performing another console activity. However, there are no ties between the players in the chat party and other activities for those players.

The chat party is exposed by the `PartyChat` class, which allows the title to examine the state of the chat party. For example, a title can enumerate the members of the chat party by using the `PartyChat.GetPartyChatViewAsync` method.

### Implementing features similar to game party

In 2014 Multiplayer, the game party served several purposes. It allowed a title to:

- Advertise a player's current activity and availability for joins.
- Send invitations (invites) to sessions.
- Discover and join sessions.
- Receive notifications on certain changes to the sessions that are registered to the party.
- Use SmartMatch matchmaking.
- Keep a group of people together across multiple game sessions.

2015 Multiplayer supports all these features directly through MPSD sessions.

## Multiplayer terminology

| Term | Description|
| --- | --- |
| Active player | A player set to the Active state within the session. The title sets a player to this state when the player is participating in a game. For more information, see the section [Session user states](../mpsd/concepts/live-mpsd-details.md#session-user-states) in the topic "Multiplayer Session advanced topics." |
| Arbiter | The single console in a game session that manages the state of the MPSD session for a game, such as advertising the game session to matchmaking to find more players. The arbiter is set by the title. The arbiter isn't always the host of the game. For more information, see the section [Session arbiter](../mpsd/concepts/live-mpsd-details.md#session-arbiter) in the topic "Multiplayer Session advanced topics." |
| Arranged game | A type of game that's created only through one player inviting other players to join, without any involvement from matchmaking. |
| Chat party | A group of people who are chatting together. The people might be engaged in the same activity, or they might be engaged in different activities, such as games, music, or apps. For more information, see [Parties supported by 2015 Multiplayer](#parties-supported-by-2015-multiplayer) earlier in this topic. |
| Game invite | An invitation to join a game session. |
| Game session | A session in which players are actually playing together. All multiplayer scenarios, such as matchmaking or joining a lobby, ultimately end up in a game session. The session is often advertised as the players' current activities to enable joins. It's also used to build the recent players list. For more information, see [Multiplayer Session advanced topics](../mpsd/concepts/live-mpsd-details.md). |
| Game session host | The console that's running the gameplay simulation for titles built on a host-based, peer-to-peer network architecture. This console is typically the same as the arbiter, but it doesn't have to be the same. |
| Handle (or session handle) | A reference to an MPSD session that has additional state and behavior associated with it. For more information, see the section [MPSD handles to sessions](../mpsd/live-mpsd-overview.md#mpsd-handles-to-sessions) in the topic "Multiplayer Session Directory overview." |
| Inactive player | A player set to the Inactive state within the session. The title sets a player to this state when a game is suspended or is otherwise inactive, as defined by the title. In some instances, MPSD might also set a player as inactive, but it's primarily the responsibility of the title to do so. For more information, see the section [Session user states](../mpsd/concepts/live-mpsd-details.md#session-user-states) in the topic "Multiplayer Session advanced topics." |
| Hopper | A logic-driven collection of match tickets. A title can have multiple hoppers, but only tickets within the same hopper can be matched. For example, a title might create one hopper for which player skill is the most important item for matching. It might use another hopper in which players are matched only if they have purchased the same downloadable content. For more information about where hoppers fit into the SmartMatch workflow, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md) |
| Join in progress | The concept of joining another player's game after game play has begun. Players can join a friend's game through the friend's gamercard. The title can then move those players into the game session at the appropriate time. |
| Lobby session | A helper session for invited players who are waiting to join a game session. For more information, see [Multiplayer Session advanced topics](../mpsd/concepts/live-mpsd-details.md). |
| Match target session | A match session set up during SmartMatch matchmaking to represent the match. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md). |
| Match ticket session | A preliminary match session set up during SmartMatch matchmaking. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md). |
| MPSD session | A secure document that resides in the MPSD within the Xbox Live cloud. It contains a group of players who might be connected while running a title on Xbox One (or later), along with metadata about the players and their game. For more information, see [Multiplayer Session advanced topics](../mpsd/concepts/live-mpsd-details.md). |
| Multiplayer Session Directory (MPSD) | The service operating in the cloud that the Multiplayer system uses to store and retrieve sessions. For more information, see [Multiplayer Session Directory (MPSD)](../mpsd/live-mpsd-nav.md). |
| Party app | An Xbox One (or later) system snap app that allows players to view and manage their parties. |
| Server session | A game session created by servers such as PlayFab multiplayer servers. See [Multiplayer Session advanced topics](../mpsd/concepts/live-mpsd-details.md). |
| Shoulder tap | A notification from MPSD to a title that a potentially interesting change has occurred on the service. The shoulder tap is a quick reminder, often less informational than a regular notification. For more information, see the section [MPSD change notification handling and disconnect detection](../mpsd/live-mpsd-overview.md#mpsd-change-notification-handling-and-disconnect-detection) in the topic "Multiplayer Session Directory overview." |
| SmartMatch matchmaking | An Xbox Live matchmaking capability available to Xbox One (or later) titles, implemented by the matchmaking service. Using MPSD and matchmaking, the title makes a request to be matched and is notified later that a matched group has been found. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md). |

## What's new in 2015 Multiplayer

>![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **CAUTION:** If your title uses 2015 Multiplayer, don't use the party-related classes in 2014 Multiplayer. Mixing 2015 Multiplayer functionality with the party-related classes causes incoherent behavior and should never be attempted.

### New concepts in 2015 Multiplayer

#### Web socket connections to MPSD

MPSD now enables titles to maintain web socket connections. These connections enable clients to receive notifications when sessions change.

For more information, see the section [MPSD change notification handling and disconnect detection](../mpsd/live-mpsd-overview.md#mpsd-change-notification-handling-and-disconnect-detection) in the topic "Multiplayer Session Directory overview."

#### MPSD session handles

2015 Multiplayer adds support for MPSD session handles, which are references to sessions that can include typed data. For more information, see:

* The section [Session handles](live-multiplayer-concepts.md#session-handles) in the topic "Multiplayer concepts overview."
* The section [MPSD handles to sessions](../mpsd/live-mpsd-overview.md#mpsd-handles-to-sessions) in the topic "Multiplayer Session Directory overview."



## Differences between Xbox&nbsp;360 and Xbox One MPSD session functions

| Function | Xbox&nbsp;360 | Xbox One |
|---|---|---|
| **Get game session information** | `XSessionGetDetails`, `XSessionSearchByID`, or title does tracking. | Title requests session information from MPSD. |
|**Migrate the host** | When needed, title calls `XSessionMigrateHost`. | Depending on the cause of the migration, title might assign a new host for the session or create a new MPSD session. |
| **Multiple player sessions** | Tricky to handle more than one session at a time; for example, `XNetReplaceKey` versus `XNetUnregisterKey`. | Service-based session makes management of one session cleaner and simplifies handling of multiple sessions. |
| **Sign-outs and disconnections** | Title must handle disconnection and sign-out differently with `XCloseHandle` or `XSessionDelete`. | MPSD simplifies sign-out and disconnection handling. Time-outs are set in game configuration. |
| **Matchmaking** | Matchmaking queries are client-based. | Matchmaking is service-based, which enables better match quality and easier background matchmaking within the title. |

### Sessions

On Xbox&nbsp;360, a session represented an instance of gameplay. Players searched for sessions in the matchmaking service and reported statistics at the end of a session.

For all target platforms after Xbox&nbsp;360 (including Windows PC), a session is more generic and represents a group of players.

A session is required for any network connectivity between Xbox Live clients and holds information that should be shared among all players in the session. Some examples of this information include the number of players allowed in the session, the secure address of each console in the session, and custom game data.

### Xbox matchmaking

On Xbox&nbsp;360, titles performed matchmaking by specifying a schema of attributes and a set of queries to search through those attributes. At runtime, the title chose to either host a session or search for one.

For all newer Xbox Live clients, such as Xbox One (and later) and Windows PC, matchmaking is server-based. Players and titles no longer decide whether to host or search. Instead, each preformed group of players creates a "ticket" session and submits that session to the matchmaking service.

The service then finds other sessions and combines the groups to form a new "target" session. The clients are notified of the match and perform quality of service (QoS) measurements to validate connectivity with other session members before starting gameplay.



## See also

[Multiplayer Session Directory (MPSD)](../mpsd/live-mpsd-nav.md)  
[Matchmaking overview](../matchmaking/live-matchmaking-overview.md)  
[Real-Time Activity (RTA) service](/gaming/xbox-live/features/rta/live-rta-nav)  
[Reputation](../../social/reputation/live-reputation-nav.md)  