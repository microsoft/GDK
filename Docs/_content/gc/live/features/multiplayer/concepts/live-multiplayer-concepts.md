---
title: Multiplayer concepts overview
description: Describes the concepts that are used by Multiplayer systems, including a multiplayer session, Multiplayer Session Directory (MPSD), SmartMatch matchmaking, and Quality of Service (QoS).
kindex: Multiplayer concepts overview
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 1e765f19-1530-4464-b5cf-b00259807fd3
ms.localizationpriority: medium
ms.date: '08/25/2017'
edited: 03/04/2021
security: public
---

# Multiplayer concepts overview

The Multiplayer system includes a multiplayer session, Multiplayer Session Directory (MPSD), SmartMatch matchmaking, and Quality of Service (QoS).

This topic describes a number of important multiplayer terms and concepts that are used frequently in the Xbox Live documentation.
Having a good grasp of them helps you understand how Xbox Live multiplayer works.


## Multiplayer session

A *multiplayer session* represents a group of Xbox Live players and the properties that are associated with them.
The session is created and maintained by titles. It's represented as a secure JSON document that resides in the Xbox Live cloud.

The session document itself contains information about the Xbox Live players who are connected to the session, how many spots are available, custom metadata (for the session as well as for each session member), and other information that's related to the game session.

Each session is based on a *session template*. It's defined by the game developer and is configured in the Xbox Live service configuration for a title instance.

A title can create and update a session, but it can't directly delete a session.
Instead, after all players are removed from a session, the Xbox Live Multiplayer service automatically deletes the session after a specified time-out.

Titles can choose to use multiple sessions, but a typical multiplayer implementation uses the following two sessions.

* **Lobby session:** Represents a group of friends who want to remain together across a game; for example, multiple rounds, levels, and maps.

* **Game session:** Represents the people who are playing in a specific session instance of a game, such as a round, match, and level. This session can include members from multiple lobby sessions who have joined the session instance together, typically through a matchmaking service.

For detailed information about multiplayer sessions, see [Multiplayer session advanced topics](../mpsd/concepts/live-mpsd-details.md).


### Example scenario

In this example scenario, Tereza wants to play a multiplayer game with her friends, Sergio and Alejandra.

1. Tereza starts up a game, and then invites Sergio and Alejandra into her game.
1. After they join, Tereza, Sergio, and Alejandra are all in a lobby session.
1. In this session, they decide to play in an online match with other people.
   1. The game creates a game session. It uses the Xbox Live matchmaking service to fill the remaining player slots with other Xbox Live players.
   1. Suppose that Ermal and Miguel are matched up with them, and the five of them play the round together.
1. After the round ends, Tereza, Sergio, and Alejandra leave the game session but are still together in the lobby session (without Ermal and Miguel). The three friends can choose to play another round or switch to different game mode.


### Session member

A *session member* is an Xbox Live player that's part of a session.


### Arbiter

An *arbiter* is a console or device that manages the state of the session for a game.
For example, the arbiter would be responsible for advertising a game session to matchmaking to find more players.

The arbiter is set by the title.
The arbiter and the host of the game can be the same, but it's not essential.


### Session host

The *session host* is the console or device that runs the game play simulation for titles that are built on a host-based, peer-to-peer network architecture.
This console or device is typically the same as the arbiter, but it's not essential.


## Multiplayer Session Directory (MPSD)

The Xbox Live Multiplayer service operates in the Xbox Live cloud. The service centralizes a game's multiplayer system metadata across multiple clients.
The system that tracks this metadata is known as the *Multiplayer Session Directory (MPSD)*.

You can think of MPSD as a library of active game sessions.
Your game can add, search, modify, or remove active sessions that relate to your title.
MPSD also manages session state and updates sessions when necessary.

MPSD allows titles to share the basic information that's needed to connect a group of players.
It ensures that session functionality is synchronized and consistent.
MPSD coordinates with the shell and the Xbox One (or later) console OS in sending/accepting invites and in being joined via the gamercard.


<a id="session-handles"></a>

### Session handles

A *session* is uniquely identified in MPSD by combining pieces of data. They are as follows.

* The service configuration identifier (SCID) of the title
* The name of the session template that was used to create the session
* The name of the session

A *session handle* is a JSON object that contains a reference to a specific session that exists in MPSD.
Session handles allow Xbox Live members to join existing sessions.

Each session handle includes a GUID that uniquely identifies the handle, which allows titles to reference the session by using a single GUID.

Session handles are as follows.

#### Invite handle

An *invite handle* is passed to a member when they're invited to join a game.
The invite handle contains information that allows the invited member's game to join the correct session.

#### Search handle

A *search handle* includes additional metadata about the session and allows titles to search for sessions that meet the selected criteria.

#### Activity handle

An *activity handle* allows members to see what other members on their social network are playing. This handle can be used to join a friend's game.

#### Correlation handle

A *correlation handle* effectively works as an alias for a session, allowing a game to refer to a session by using only the ID of the correlation handle.

#### Transfer handle

A *transfer handle* is used to move players from one session to another session.


<a id="invites"></a>

### Invites

Xbox Live provides an invite system that's supported by the Multiplayer service.
This service makes it possible for players to invite other players to their game sessions.
Invited players receive a game invite. A title uses this information to join an existing session and multiplayer experience.

Titles control invite flow and when invites can be sent.
Invites can be sent through the shell by the player or directly from the title.

The notification text for an invite can be dynamically set by a title to provide more information to the invited player.
Invites can also include additional data for the title that isn't visible to the player and can be used to carry additional information.


### Join-in-progress

In addition to invites, Xbox Live also provides a shell option for players to join an active gameplay session of friends or other known players.
This enables another path into an active game session and is also driven by MPSD.

Titles control when sessions are joinable and which session to expose for join-in-progress.


### Protocol activation

If Tereza sends an invite to Alejandra to join her game, Alejandra receives a notification on her device that she can choose to accept or decline.

If Alejandra accepts the invitation, the OS attempts to launch the game, if the game isn't already running. The OS triggers an activation event that contains information about why the game was activated and any additional details. (In the case of an invite, for example, the details include the ID of the player who invited the member and the session that the member has been invited to.)

The process of handling this event is known as *protocol activation*. It indicates that the game should automatically go into a specific state, which is detailed in the activation event arguments.
If the member is joining a multiplayer game, the session handle ID is specified as one of the arguments.

In Alejandra's case, accepting the invite should automatically start the game (if needed), and join her to the same game session that Tereza is in. This is done without Alejandra needing to take any further actions.

Protocol activation can be triggered by accepting an invite, joining another member's game via their profile card, or selecting a deep-linked achievement.


## SmartMatch matchmaking

*SmartMatch* is the name of the Xbox Live service for anonymous matchmaking.
This service matches players of the same game based on a configurable match rule set.

The matchmaking service works closely with MPSD and uses sessions for matchmaking input and output.
Matchmaking is performed on the service, which allows titles to easily provide other experiences during the matchmaking flow; for example, single-player within the title.

Individuals or groups that want to enter matchmaking create a match ticket session, and then request the matchmaking service to find other players with whom to set up a match.
This results in the creation of a temporary "match ticket" that resides within the matchmaking service (on a match hopper) for a period of time.

The matchmaking service chooses sessions to play together based on rule configuration, statistics stored for each player, and any additional information given at the time of the match request.
The service then creates a match target session that contains all players who have been matched and notifies the players' titles of the match.

When the target session is ready, titles can perform QoS checks to confirm that the group can play together or join players to the session to begin gameplay.
During the QoS process and matchmade gameplay, titles keep the session state up to date within MPSD, and they receive notifications from MPSD about changes to the session.
Such changes include players joining or leaving and changes to the session arbiter.


### Match ticket session

A match ticket session represents the clients for the players who want to make a match.
It's typically created based on a group of players who are in a lobby together or on other title-specific groupings of players.
In some cases, the ticket session might be a game session already in progress that's looking for more players.


### Match ticket

Submitting a ticket session to matchmaking results in the creation of a match ticket that tracks the matchmaking attempt.
Attributes can be added to the ticket; for example, game map or player level.
These attributes, along with attributes of the players in the ticket session, are used to determine the match.


### Hoppers

*Hoppers* are logical places where match tickets are collected and specified at the start of matchmaking.
Only tickets within the same hopper can be matched.

A title can have multiple hoppers. However, it can only start matchmaking on one hopper at a time.
For example, a title might create one hopper for which player skill is the most important item for matching.
The title might use another hopper in which players are only matched if they have purchased the same downloadable content.

You configure hoppers for matchmaking in the service configuration.


## Quality of Service (QoS)

When gamers play a multiplayer game online, the quality of the game is affected by the quality of the network communication between the devices that are hosting the games.
A poor network can result in undesirable game experiences like lag or connection drops because of latency or insufficient bandwidth.

QoS refers to measuring the strength of an online connection (latency and bandwidth) between players to ensure that all players have a sufficient network connection quality.
This is specifically important for players who are matched during matchmaking to guarantee a good experience because of network connections.
QoS is less applicable for invites where friends play together and are usually willing to accept the consequences of a poor connection.

You can configure the session to handle QoS automatically based on specific criteria. Your game can also handle measuring the QoS whenever anyone joins the session.