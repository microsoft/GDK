---
title: Multiplayer Activity feature overview
description: Describes how the Multiplayer Activity (MPA) feature simplifies platform integration for player activities (joins), invites, and recent players, and enables players to launch into your game from their social graph.
kindex:
- Multiplayer Activity feature overview
- MPA
- activity
- invites
- recent players
ms.topic: conceptual
ms.localizationpriority: high
security: public
author: joannaleecy
ms.author: thboard
ms.date: 05/08/2020
edited: 04/22/2021
---

# Multiplayer Activity (MPA) feature overview

This topic describes how the Multiplayer Activity (MPA) feature simplifies Xbox Live integration for
player activities (joins), invites, and recent players. MPA also enables
players to launch into your game from their social graph, even if the title
itself isn't running.  

## Terminology

The following four terms are frequently used in the context of MPA.

* **Connection string:** A string that's created and understood only by the title,
 which contains information that's required for one player to connect to another.
 This often contains a server IP address but is left freeform to allow titles
 flexibility. This string is opaque to MPA&mdash;it simply passes this string from one player
 to another to enable players to join each other.

* **Activity:** Represents an advertisement that the player is in a multiplayer
 experience. This contains a connection string and a small set of
 properties to restrict who can join the experience. Activities enable the
 shell to display this information, including its joinability. An activity
 should always be present when a player is in a multiplayer experience.

* **Invite:** Represents a request for a player to join a multiplayer
 experience. This also contains a connection string. In general, a player
 should have created an activity before sending invites to other players.

* **Recent player:** Someone who has had a meaningful interaction with a
 player. Recent players are stored by MPA in a list. A player can use them
 to form friend relationships, send messages and invites, or report feedback
 after a game is played.

## Using MPA

### Client flow
A title should have the following flow for handling multiplayer experiences.

1. When player A starts or joins a multiplayer experience, the title should [set an
   activity](how-to/live-mpa-client-how-to.md#setting-an-activity) to represent
   this.
   *  Other players in the title and Xbox Live can [retrieve this
     activity](how-to/live-mpa-client-how-to.md#getting-an-activity). Depending
     on their relationship to player A, the activity they receive can also
     include a connection string. They can use it to join the game in
     progress.
2. Player A can [send invites](how-to/live-mpa-client-how-to.md#sending-invites)
   to other players, actively requesting that they join the game.
3. As players join and leave, the title should update the number of players in
   the activity by [setting it
   again](how-to/live-mpa-client-how-to.md#setting-an-activity) with updated
   information.
4. The title should [update the player's recent players
   list](how-to/live-mpa-client-how-to.md#updating-recent-players) with any
   players with whom they've had meaningful interactions.
5. When player A ends or leaves the multiplayer experience, the title should [delete the
   activity](how-to/live-mpa-client-how-to.md#deleting-an-activity).

### External server flow

A server can act on behalf of clients for any of the previously mentioned items. In addition, a
server can:

* Record [bidirectional
  lists](concepts/live-mpa-recent-players.md#Unidirectional-players-vs-Bidirectional-groups)
  of recent players.
* Send an invite on behalf of a player.
* Retrieve activities for multiple players at the same time, as opposed to one at a time.

For more information, see [Xbox Live Services RESTful
Reference](/gaming/xbox-live/api-ref/xbox-live-rest/atoc-xboxlivews-reference).

## See also

[Activities](concepts/live-mpa-activities.md)  

[Invites](concepts/live-mpa-invites.md)  

[Recent players](concepts/live-mpa-recent-players.md)  