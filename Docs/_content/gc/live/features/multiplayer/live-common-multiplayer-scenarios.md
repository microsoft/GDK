---
title: Common multiplayer scenarios
description: Describes the Xbox Live functionality that supports various multiplayer scenarios, including comparative (indirect) play, online play with friends, and skill-based matchmaking.
kindex:
- Common multiplayer scenarios
- multiplayer scenarios, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 470914df-cbb5-4580-b33a-edb353873e32
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 03/05/2021
security: public
---

# Common multiplayer scenarios

This topic describes the Xbox Live functionality that supports various multiplayer scenarios, including comparative (indirect) play, online play with friends, and skill-based matchmaking. There are many different types of multiplayer scenarios. Choosing the right scenario can increase player engagement and the player base for your game, which helps extend the active life of your game for as long as possible.

Games that are mostly single-player experiences can benefit from competitive Xbox Live features such as leaderboards, stats, or social elements.

The following list describes some of the more common multiplayer scenarios that you can implement with Xbox Live. If you want to combine both Xbox Live and Azure PlayFab offerings, see [Multiplayer overview (NDA topic)](../../../multiplayer/multiplayer-intro.md).

The list is ordered by complexity and the amount of work that's required to implement and test. You should consider these factors when deciding on the scenarios that you want your game to support.


## Comparative (indirect) play

In the comparative (indirect) play scenario, players are competing with each other indirectly, without direct gameplay in the same instance of a game.
This scenario is well-suited for games that are oriented toward a single player experience. It also contains some competitive aspects so that players can compare how well they did against other players.

Example functionality for this scenario includes the following:

* **Leaderboards:** A player tries to achieve the best "score" in a category relative to other players. This can include a social *leaderboard* system for competing only with friends.
* **Achievements and stats:** A player wants to compare their progress/performance against that of their friends and possibly brag about beating a particularly challenging achievement.
* **"Ghosting" or "virtual multiplayer":** A player can compete against a recording of another player's (or their own) previous performance, such as a lap in a racing game.

This multiplayer type can be achieved by using the following Xbox Live services.

* Presence
* Stats
* Social Manager
* Achievements
* Leaderboards
* Connected storage

This multiplayer type doesn't require any of the Xbox Live Multiplayer-specific services.
Testing this scenario requires only multiple Xbox Live accounts.


## Local play (living-room play)

The local play (living-room play) scenario is based on two or more players playing a game together (either versus each other or cooperatively) on a single device.
A title can use a single screen for all players or a split-screen experience for each player.
Alternatively, in turn-based games, you can use a "hot-seat" approach where each player takes control of the game during their turn.

On the Xbox One (or later) console, multiple players can be signed in on a single console.
Each player has a controller.
Currently, Windows 10 devices only support sign-in of a single Xbox Live account. However, Microsoft is investigating changing this in a future update.

It's possible to design a local-play&ndash;only multiplayer style by using Xbox Live Multiplayer services. However, it might be better to consider this scenario as a subset of a more expansive multiplayer scenario that incorporates online experiences. The additional investment that's required is minimal compared to the potential return of expanding this multiplayer scenario.

This multiplayer type can use similar services as shown in the previous scenario.

* Presence
* Stats
* Social Manager
* Achievements
* Leaderboards
* Connected storage

Testing this scenario requires multiple Xbox Live accounts and multiple controllers on a single device.


## Online play with friends

The online play with friends scenario is the most traditional online multiplayer experience.
In this scenario, an Xbox Live member wants to play a game only with friends&mdash;not with strangers.
Friends are invited to the game. They can also join an ongoing game while it's in progress.

For parental control, a broader multiplayer title (described later in this topic) should have the ability to limit online multiplayer only to friends and use this scenario as a fallback.
Parental controls that limit interactions with strangers are also enforced through the Xbox Live service.

This multiplayer type can be achieved by using the following Xbox Live services.

* Multiplayer Activity (MPA)
* Multiplayer Session Directory (MPSD) or Multiplayer Manager (MPM)
* Presence
* Stats
* Social Manager

Testing this scenario requires multiple Xbox Live accounts and multiple devices.


## Online play through a list of game sessions

In the online play through a list of game sessions scenario, a player can browse a list of joinable gameplay sessions in a game and then select which one to join.
The player also has the ability to create new game session instances by hosting a game locally.
These game instances can allow custom preferences (such as game mode, level, or game rules).

Depending on the title design, game sessions can support restrictions such as requiring a password to join or certain player/skill levels.
These game session instances can also be fully public or hidden, depending on how your game implements the session browsing and joining.


This scenario allows players to self-select a game session.
This gives control to the player. However, there's no guarantee that a session will provide a good experience.

A session can't be filled with the correct player set at an interesting skill level.
A session list is most effective when games have a small, active multiplayer community.

This multiplayer type can use similar services as shown in the previous scenario.

* MPSD
* [Multiplayer session browse](concepts/live-session-browse.md)
* Presence
* Stats
* Social Manager

Testing this scenario accurately requires a large set of Xbox Live accounts and devices. Note that true player dynamics for session lists can only be tested with large player bases.


## Online play through Looking for Group

The online play through Looking for Group scenario is similar to the session list scenario. However, this scenario diverges from the session list scenario in several important ways.
Instead of a game list in the title, the platform provides functionality to list game sessions outside the game.

These "Looking For Group" advertisements are intended to provide a more social experience and include gameplay, skill, and social relationship restrictions.
This allows a game to provide an improved experience over session lists and gives the creator of the session more control.

The player who created the "Looking for Group" session can approve or deny requests from other players to join the group.
This allows players to find other players who share their play-style preferences.

You can't implement this inside your game today; you enable its functionality out-of-game by advertising joinable activities 
through other means. That implementation is done via other similar services that were explained in previous scenarios.

* MPA
* MPSD
* Presence


## Simple matchmaking

In the simple matchmaking scenario, a player (or a group of players) is looking for other players (who might or might not be known to the player) for an online game.
Instead of selecting friends, the game provides a simple matchmaking flow so that players can join game sessions with other players.

The matchmaking flow in this scenario is simple: players search for and find other players without any significant matchmaking configuration.
This scenario works best with larger online audiences.

#### Block lists

To appropriately match players, any matchmaking should try to honor block lists on Xbox Live.
The Xbox Live SmartMatch service automatically handles these restrictions and allows for opt-out in ranked matchmaking where it isn't wanted.
Honoring restrictions like these helps ensure a safer and better experience for players.

#### Quality of Service (QoS) networking checks

Quality of Service (QoS) networking checks are an important part of matchmaking.
These checks ensure that the network connectivity between two players is sufficient for a good gameplay experience.
This is different than in the online play with friends scenario because it's possible to repeat matchmaking and find other players in case of a bad network connection.

This multiplayer type can use similar services as shown in the previous scenario.
* MPSD
* Presence
* Stats
* Social Manager
* SmartMatch matchmaking

Testing this scenario accurately requires a large set of Xbox Live accounts and devices.
Note that true player dynamics for session lists can only be tested with large player bases.
Tools are available to simplify network condition and SmartMatch testing.


## Skill-based matchmaking

The skill-based matchmaking scenario is a refinement of the simple matchmaking scenario.
In this scenario, the matchmaking service includes more advanced rule sets like skill, player level, and other game-specific properties.

The matchmaking service uses rules that use these match parameters to find a more high-quality session for the player.
Depending on game design, match parameters are configured directly by the player or are automatically set by the title.


Xbox Live SmartMatch provides a set of rules that can be used for skill-based matchmaking. The SmartMatch service doesn't directly integrate any skill algorithm. Use your own skill algorithm to calculate and provide those values into a SmartMatch rule that it uses in evaluating players.

This multiplayer type can use similar services as shown in the previous scenario.

* MPSD
* Presence
* Stats
* Social Manager
* SmartMatch matchmaking

Testing this scenario requires a large set of Xbox Live accounts and devices.
Note that true player dynamics for session lists can be tested only with large player bases.
Tools are available to simplify network condition, TrueSkill, and SmartMatch testing.