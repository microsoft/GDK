---
title: Real-Time Activity service overview
description: Describes the Real-Time Activity (RTA) service.
kindex:
- Real-Time Activity service overview
- Real-Time Activity service
- RTA
ms.topic: article
ms.assetid: 50de262f-fc55-4301-83b5-0a8a30bc7852
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 02/04/2021
security: public
---

# Real-Time Activity service overview

This topic describes the Real-Time Activity (RTA) service. The RTA service provides  a way for an application on any device to subscribe to receive state data, player  statistics, and presence details.

The system allows subscriptions to your own data, or to someone else's data (depending on their privacy settings), in any title. This provides a flow of data without you having to constantly poll to get the latest details.

## Developer scenarios

RTA supports many scenarios. Just a few of them are as follows, but the real power of RTA lies in the many scenarios that you'll come up with that we haven't imagined. Your scenario could help define the next generation of gameplay,     where players  often have their Microsoft Surface or iPad available while they're interacting with your console title.

RTA uses WebSocket technology. The following walkthroughs include an overview of the implementation by using  the WebSockets API that's provided by Windows. You can create the following simple scenarios for your title by using RTA.

* [Achievements progress app](#achievements_progress_app)
* [Game Help    app](#game_help_app)
* [Squad viewer app](#squad_viewer_app)
* [Statistics viewer](#statistics_viewer)
* [Presence viewer](#presence_viewer)

<a id="achievements_progress_app"></a>

## Achievements progress app

Players are nearly always  curious about their progress towards certain achievements, especially those that require performing an action a number of times. Player's statistics are aggregated in the Xbox Live Player Statistics service. You get real-time access to this information  so that you can present real-time progress (achievements and milestones) to players and their friends while they're playing your game. You can do this on Xbox One family  (or later), or on a ny companion device.

<a id="game_help_app"></a>

## Game Help app

As players navigate your title, real-time access to data allows you to present game Help either next to the experience on Xbox One family (or later), or on any companion device. Players might arrive at a new map, new track, or challenging boss fight, and your Game Help companion  device could then display helpful user-generated or developer-generated videos and text to your players.

<a id="squad_viewer_app"></a>

## Squad viewer app

In co-op multiplayer games, players and their teammates  work together toward a shared goal. With so many players, though, it can be a challenge tracking all of the game details.  With access to real-time data, you can create a companion app that shows the high-level map, and heat maps of where the action is.

<a id="statistics_viewer"></a>

## Statistics viewer

While you might usually consider companion apps when thinking about RTA, you can also use RTA in your core title. For example, you can use RTA to provide a multiplayer game player with a display of everyone's current statistics with a press of the **View** button on the controller.

<a id="presence_viewer"></a>

## Presence viewer

When in a lobby, it's useful to have an up-to-date view that tells you which friends are online, and if they're playing the title that you're playing. You can subscribe to a player's friends' presence, show players which of their friends are online, and if  they start playing your title&mdash;all in real time.

## Subscription privacy and authorization

The latest version of RTA includes checks for privacy, authorization, and content isolation. As long as the privacy and authorization checks are satisfied, your title can subscribe to any statistic that's specified  as RTA-enabled.

For more information about how to make a particular statistic RTA-enabled, see [Registering for player stat change notifications](concepts/live-register-for-stat-notifications.md).

You  can RTA-enable any kind of statistic that you want&mdash;it's up to you, the developer. However, there's a limit to the number of statistics that a player can subscribe to, per app session. If players reach that limit, they receive an error with  the next subscription.

## See also

[Registering for player stat change notifications](concepts/live-register-for-stat-notifications.md)  