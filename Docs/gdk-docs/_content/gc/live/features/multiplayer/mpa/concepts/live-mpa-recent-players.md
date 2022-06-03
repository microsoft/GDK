---
title: Recent players
description: Describes how interactions with other players are recorded to build player relationships or report feedback.
kindex:
- Recent Players
- MPA
ms.topic: conceptual
ms.localizationpriority: high
security: public
author: joannaleecy
ms.author: jeffng
ms.date: 05/12/2020
edited: 03/18/2021
---

# Recent players

This topic describes how interactions with other players are recorded to build player relationships or report feedback. When players interact with each other in a multiplayer activity, titles should
record their interaction by using Multiplayer Activity (MPA). If the interaction was
positive, players can send friend invites, game invites, and messages. If the interaction was negative, players can report feedback.  

Titles should be careful to post only meaningful interactions with players to
prevent flooding the recent players list with extraneous players. For instance, a
"battle royale"&ndash;style game might have 100 players in it. However, the title should only
record players who have actually interacted with each other, as opposed to
submitting that all 100 players have played with each other.  

<a id="Unidirectional-players-vs-Bidirectional-groups"></a>

## Unidirectional players vs. bidirectional groups  

MPA accepts two concepts of player interaction. In the unidirectional players concept, the
title reports that player A has played with one or more players. This should
occur for every player who has affected player A. As a result, each of
these players appears on player A's recent players list. All players should
individually report their own interactions.  

Servers are also allowed to report batches of recent players in this way.  

In the bidirectional groups concept, all players are known to have interacted with
each other. For example, in a four-versus-four shooter game or an eight-player race, the game
can detect in advance that all players should appear in each others' players list.
They can call an API that has a list of players. MPA ensures that every player has
every other player added to their recent players list. Only servers are allowed
to submit bidirectional groups.  

## Encounter types

MPA supports recording the type of encounter that has occurred. Titles can specify
an `encounterType` field. It has the allowed values of `Default`, `Teammate`,
and `Opponent`. If unspecified, the field defaults to `Default`. Specifying this field gives
players the opportunity to more easily differentiate between various types
of encounters.  