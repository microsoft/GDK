---
title: Matchmaking overview
description: Describes how the SmartMatch matchmaking service selects compatible players in a multiplayer game.
kindex:
- Matchmaking overview
- SmartMatch
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: ba0c1ecb-e928-4e86-9162-8cb456b697ff
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 03/16/2021
security: public
---

# Matchmaking overview

This topic describes how the SmartMatch matchmaking service selects compatible players in a multiplayer game.

## Introduction to SmartMatch

Xbox Live provides a matchmaking service called *SmartMatch*.
It groups players based on player information and the matchmaking request for the players who want to play together.
Matchmaking is server based. This means that players provide a request to the service, and then they're notified when a match is found.

You can use the following API approaches for SmartMatch matchmaking.  

* SmartMatch is wrapped by [Multiplayer Manager](../mpm/live-multiplayer-manager-nav.md).  

* For advanced API usage, you can call the `XblMatchmaking*` methods.

If you have a matchmaking scenario that isn't supported by Multiplayer Manager (MPM), please provide feedback to us via your Microsoft representative.
Regardless of which API you use, the conceptual information in this topic is valid.

When you build a title, you can use SmartMatch as described in this topic.
Alternatively, you can your own matchmaking service as described in [Using Your Own Matchmaking Service](https://developer.microsoft.com/games/xbox/docs/xboxlive/xbox-live-partners/multiplayer-and-networking/using-your-own-matchmaking-service).

### About SmartMatch

To simplify matchmaking, the SmartMatch matchmaking service works closely with Multiplayer Session Directory (MPSD).
SmartMatch allows titles to easily do matchmaking in the background; for example, while the player is playing single-player within the title.

Individuals or groups that want to enter matchmaking create a match ticket session, and then request that the matchmaking service find other players with whom to set up a match.
This results in the creation of a temporary match ticket that resides within the matchmaking service for a period of time.

The matchmaking service chooses sessions to play together based on configuration, statistics stored for each player, and any additional information given at the time of the match request.
The service then creates a match target session that contains all the players who have been matched and notifies the players' titles of the match.

When the target session is ready, titles perform Quality of Service (QoS) checks to confirm that the group can play together. The group can begin play when the checks have been confirmed.
During the QoS process and matchmade game play, titles keep the session state up to date within MPSD. Titles receive notifications from MPSD about changes to the session.
Such changes include users coming and going and changes to the session arbiter.


### Match ticket session

A *match ticket session* represents the clients for the players who want to make a match.
The session is created based on a game, on a group of strangers who are in a lobby together, or on other title-specific groupings of players.
In some cases, the ticket session might be a game session already in progress that's looking for more players.


### Match ticket

Submitting a ticket session to matchmaking results in the creation of a *match ticket*. It tracks the matchmaking attempt.
Attributes in the ticket, for example, game map or player level, along with attributes of the players in the ticket session, are used to determine the match.


## Hoppers

*Hoppers* are logical places where match tickets are collected.
Only tickets within the same hopper can be matched.

A title can have multiple hoppers.
For example, a title might create one hopper for which player skill is the most important item for matching.
A title might use another hopper in which players are only matched if they have purchased the same downloadable content.


### Hopper rules

*Hopper rules* provide definitions of the criteria that the matchmaking service uses for deciding on the players to group together.

There are two types of hopper rules.

* **MUST rules**: Must be satisfied for match tickets to be considered compatible.

* **SHOULD rules** : A match ticket that matches a rule is favored over one that doesn't.

Within each of these categories, there are several specific types of rules.
For more information, see [Configuring matchmaking in Partner Center](config/live-matchmaking-config.md).


### Hopper configuration

For more information, see the [Basic hopper configuration for matchmaking](config/live-matchmaking-config.md#hop) section in the Configuring matchmaking in Partner Center topic.


### Match target session

When a matched group has been found, the service creates a *match target session*. The service reserves places for all the players from the ticket sessions that are matched together.
For more information, see [Target session initialization and QoS](concepts/live-matchmaking-target-session.md).


## See also  

[Multiplayer session templates](../mpsd/concepts/live-session-templates.md)  

[Multiplayer Session Directory overview](../mpsd/live-mpsd-overview.md)  