---
title: Best practices for Rich Presence
description: Describes the best practices for using Xbox Live Rich Presence.
kindex:
- Best practices for Rich Presence
- Rich Presence
- Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 51a84137-37e4-4f98-b3d3-5ae70e27753d
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Best practices for Rich Presence

The best-practice tips in this topic help you get the most from Xbox Live Rich Presence in your game.
The more Rich Presence strings you define, the better the experience is for players who discover people playing your game.

## Use your stats in your strings

Use your stats in your strings so that you can set them just once. Stats help reduce the need to rewrite your strings.

If your string has a map name in it, and you're using the `CurrentMap` stat to fill in the blank, the service updates your string appropriately as your players travel from map to map in the game.
This approach automatically keeps the string up to date&mdash;as long as your title is sending the proper events to Xbox Live Player Data.

Your title should periodically set the Rich Presence base string with the presence service to ensure that the Rich Presence information for a player is accurate and the service is using the correct base string.

## Use Rich Presence to open up new conversation opportunities

Create strings that are likely to generate interest in a game for new players and casual players who might have missed a special feature.

## Create Rich Presence strings that motivate players to take action

For example, instead of using "Playing on mausoleum," use "Requests assistance; defending mausoleum." Use the Rich Presence state to enable scenarios that players will enjoy, like joining a game in progress. For this example, another player can then join the game and help.

## Create Rich Presence strings that empower players to show off their achievements

Rich Presence strings empower players to show off their achievements, like completing levels or discovering secret areas.

## Localize your Rich Presence strings

Localize your Rich Presence strings and their associated parameters. Players around the world can become a part of the community that you're fostering.

## It can take time for new Rich Presence data to appear

Some parameters change rapidly, but it can take time for new Rich Presence data to appear for a friend.

If your string contains "current weapon" and the player can switch between their pistol and rifle, their Rich Presence string might not be completely accurate at any given time.

In some cases, however, inaccuracy isn't a problem.
If your Rich Presence string contains the value for total enemies defeated, and the value is off by one or two for a few seconds, that might be OK for your scenario.
