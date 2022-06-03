---
title: Connected Storage vs. Title Storage
description: Describes Xbox Live Cloud Storage, which includes Connected Storage to store game state, and Title Storage to store player statistics and assets.
kindex:
- Connected Storage vs. Title Storage
- Title Storage
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 3c92549c-65fd-4d26-a693-3aded8bae498
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 01/23/2021
security: public
---

# Connected Storage vs. Title Storage

This topic describes Xbox Live Cloud Storage and compares Connected Storage to Title Storage. Xbox Live provides a way for game developers to store both global title data and player-specific data in the cloud. Xbox Live Cloud Storage includes Connected Storage for storing game state, and Title Storage for storing player statistics and assets.

## Connected Storage

Data stored by using the per-user Connected Storage API automatically roams for users across PC and multiple Xbox One family (or later) consoles. This data is also available for use offline. Use this service to provide smooth gameplay when restarting a title after switching devices.

You should use the Connected Storage service to frequently save progress data like inventory, game state, and in-game current location. The Connected Storage service is a fault-tolerant cloud storage service that's less susceptible to network and power failures.

For more information, see [Connected Storage](connected-storage/live-connected-storage-nav.md).

## Title Storage

The Xbox Live Title Storage service provides a way to store and share game data and title assets in the cloud. Games running on all platforms can use the Title Storage service. This service gives you more control over data visibility for the user, as well as global per-title data, and per-user data.> [!NOTE]
> Title Storage is especially well-suited for storing user   statistics, user rankings, title assets such as unlockable artwork, and new maps.
