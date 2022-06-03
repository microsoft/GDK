---
title: Rich Presence overview
description: Provides an overview of Rich Presence, which shows what a player is doing and where they are in the game.
kindex: Rich Presence overview
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.localizationpriority: medium
ms.assetid: '00042359-f877-4b26-9067-58834590b1dd'
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Rich Presence overview

This topic provides an overview of Rich Presence. It shows what a player is doing and where they are in the game.

By default, games have *Basic Presence*. This indicates to other players which game a player is playing.
If you write code to use *Rich Presence*, the Rich Presence string ideally also indicates what a player is doing and where they are in the game. Rich Presence information is visible to players who are connected to Xbox Live.

By using Rich Presence, your game can advertise the activity and location of a player.
For example, your game can use these strings to show all players the status (like Away) of your game's players.

The topics in this section describe how to do the following:

- Configure your Rich Presence strings.
- Set the string for a player who is playing your game.

## Definitions

Here are some terms that are used in this section.

- **Enumeration:**
An enumeration is a list of some in-game dimension.
For example, weapons, character classes, and maps.
For these examples, you can show a list of the possible weapons in your game and a list of all the possible character classes or maps.

- **Locale-string pair:**
A locale-string pair specifies the locales in which the string can or should be used. Every possible Rich Presence string must have a locale associated with it.
Each enumeration also has a set of locale-string pairs.

- **String-set:**
A string-set is made up of a group of locale-string pairs.
This set defines the possible values of a Rich Presence string for all possible locales or the possible values for an enumeration for all possible locales.

- **Friendly name:**
There are two types of friendly names.

  - **Rich Presence string:** The friendly name for a string-set is a unique identifier in the form of a string that's used to reference a string-set.
  - **Enumeration:** These friendly names are used to uniquely identify a particular enumeration like the weapons enumeration or the character class enumeration.
