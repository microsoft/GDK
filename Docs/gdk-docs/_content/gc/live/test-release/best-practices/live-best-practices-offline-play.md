---
title: Best practices for handling offline play
description: Best practices for handling offline or intermittent scenarios with Xbox Live-enabled titles.
kindex:
- Best practices for handling offline play
- offline play best practices
ms.topic: conceptual
author: joannaleecy
ms.author: migreen
ms.assetid: 6290dd67-1145-4fe2-8ada-c3a29a9ad29a
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Best practices for handling offline play
> [!NOTE]
> This article applies to the Xbox console only, not to other platforms, such as PC.

Xbox is designed as a connected device, and the best experiences, such as multiplayer gaming and video streaming, require connectivity.
However, the Xbox console supports many scenarios for offline play.

Games must be robust in the face of connectivity failures.
For games with offline play experiences, allow your players to enjoy those experiences to the fullest.
For games that are designed as "always online", when network connectivity is lost, gracefully return the user to an offline state.

An ever-growing number of consumers worldwide have access to the Internet.
However, there are still places in the world where connectivity is unpredictable, and there are times when routers fail, fiber is cut, servers crash, or wireless services drop.

To support the widest set of consumers and experiences, Xbox allows for common cases where Internet connectivity is lost from time to time, or is unavailable altogether.
Your game is informed of connectivity failures, and you are free to choose how to respond — such as continuing full gameplay, downgrading to an offline mode, or ending gameplay altogether.


## Normal online operation

In general, Xbox consoles operate in a fully-connected state, where the user has a steady Internet connection and full access to Xbox Live and to third-party services.
This connected state allows the Xbox Live service to periodically validate the console state, to provide updates, and to perform other background services that benefit your game and users.

We recommend that you assume that users have online connectivity the majority of the time.


## Offline play principles

There are cases where an online connection is unavailable.

For offline play, Xbox is designed with the following principles in mind:

-   Most importantly, keep users playing despite connectivity issues.

-   Keep users playing even if they have no connection at all.

-   Make offline play simple and predictable for users, while still maintaining the spirit of an always-connected experience.


## Offline modes

There are two high-level *loss of connectivity* scenarios:

-   Complete loss of Internet service

-   Loss of one or more online services

In each of these modes, there are a variety of situations that can arise.
These scenarios explained below, with examples of common offline scenarios that impact gameplay.


## Offline scenario: no Internet service upon game start

Games may declare themselves as one of three types:

-   *Xbox Live required*: all modes of gameplay require Internet connectivity.

-   *Xbox Live Gold required*: all modes of gameplay require Internet connectivity and an Xbox Live Gold membership.

-   *Xbox Live not required*: the game has at least one mode of play that doesn't require Internet connectivity. Technically, this type is not explicitly declared in the application manifest. An app that doesn't declare itself as one of the first two types is considered "Xbox Live not required," or offline supported.

When a game is started by the user and the console is offline, the system checks the game connectivity declaration in the application manifest.
If the game requires connectivity (either of the first two cases above), the system automatically displays a message to the user and does not launch the title.

If the console is offline, the system will only launch titles that have at least one mode of play that doesn't require connectivity.
In other words, the system will not launch "Xbox Live required" or "Xbox Live Gold required" titles.


## Offline scenario: connectivity lost during gameplay

If a game is already running when connectivity is lost, the title will be notified by the system.
If the game is not using online services, continue the session without interruption.
If the game is actively using online services, either switch to a mode where those services are no longer needed or inform the player that the gaming session is ending due to the offline state.

Titles that are declared "Xbox Live required" or "Xbox Live Gold required" will be automatically suspended by the system when the console loses all network connectivity for a period of time, and the system will automatically provide an error message to the user.

As with any other scenario involving gameplay suspension, you should save state so the user doesn't lose data and can quickly return to that state after regaining connectivity.


## Offline scenario: when a single Xbox Live service is down

There are other situations in which specific online services may be unavailable even though Internet connectivity is fine.

For example, a single Xbox Live service could be offline for a short period of time.
In this case, the call to the specific service will timeout or report an error to the game.
You should properly handle offline-service states just as you would handle those situations on Xbox 360 or on Windows.

At a minimum, the game must not crash or hang.
If gameplay cannot continue without the service, then report the situation to the user, and allow the user to continue in another area of the game where the service is not required.

In the best case, continue gameplay and cache data to send later (if the game was writing to the service) or make reasonable assumptions about the data (if the game was reading from the service).


## Offline scenario: when a third-party service is down

If your game relies on a third-party online service, then your game must also be resilient if that service fails.
If the service fails, then your game must not crash or hang.

You may report the service error to the user if gameplay cannot continue.
Ideally, gameplay should continue or you should allow the user to continue in an area of the game that doesn't require the online service.


## Offline scenario: when your cloud service is down

One of the Xbox showcase features is cloud power.
Some games may rely completely on an always-connected service such as Azure PlayFab Multiplayer Servers, which allows accessing additional compute capabilities or always-available game servers.
This always-connected mode is both allowed and encouraged where it enhances the experience for players.

If your game uses this mode, then we recommend that your game be resilient to service interruptions (of multiple seconds and up to one minute) that are due to either total loss of Internet connectivity or loss of a particular cloud service.
However, the game is not required to have an offline mode.
If the game truly needs connectivity and connectivity is not available, then inform the user and end the gameplay session.


## Xbox Requirements

The most important requirement when dealing with offline scenarios is game stability.Whether it's complete connectivity loss or just the loss of a specific online service, your game must not hang, crash, or cause the user to lose state.
Your game must have a robust system for handling network-timeout scenarios and for handling errors returned from any API that accesses an online service.

Games are not required to support offline play.
If your game simply cannot continue because of a loss of service connectivity, then notify the user, end the gaming session, and return to the main menu or initial interactive state.


## Best practices

Here are best practices for dealing with offline situations:

-   Design games to assume that users have online connectivity the majority of the time.

-   If it makes sense for your game design, then consider designing modes of gameplay that allow the user to have an enjoyable experience even if the console is in an offline state.

-   Services can become unavailable. Connections can fail. Build robust error handling for APIs that can timeout, or report failure conditions when an online service is down or when Internet connectivity is lost. Whenever possible, keep users playing despite these issues.

-   Obey Xbox Requirements (XRs). Don't hang or crash.

-   Upon receiving a PLM title suspension notification, save state so that the user doesn't lose data and can quickly return to that state when resuming the game.

-   Flag your title appropriately in the application manifest. Only mark your title as "Xbox Live required" if all modes of gameplay require connectivity.

-   Xbox games are allowed to use and rely on online services in all game modes. If the game simply cannot continue because of a loss of service connectivity, then notify the user, end the gaming session, and return to the main menu or initial interactive state.

-   Do not rely on the Xbox Help service for error messages and help related to offline states. The Xbox Help service requires a connection to Xbox Live.