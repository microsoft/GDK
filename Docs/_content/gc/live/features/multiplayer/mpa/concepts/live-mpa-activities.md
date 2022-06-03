---
title: Activities
description: Describes advertising joinable, multiplayer experiences to other players. They can then join the experiences.
kindex:
- Activities
- MPA
- activity
ms.topic: conceptual
ms.localizationpriority: high
security: public
author: joannaleecy
ms.author: jeffng
ms.date: 05/12/2020
edited: 03/15/2021
---

# Activities

This topic describes advertising joinable, multiplayer experiences to other players. They can then join the experiences.

## Using activities

When a player starts or joins a multiplayer experience, a title should advertise
this in Multiplayer Activity (MPA) by creating an activity. Unlike a
session-based model, activities are per player. Each player should create their
own activity, even if they're playing together.

A title should create this activity as soon as a player is in a multiplayer
experience. During the experience, a title should modify the activity if the player
count increases or decreases. A title should delete the activity if the player
ends or leaves the multiplayer experience. If a title crashes or otherwise
fails to remove an activity, MPA attempts to remove the activity if it
detects that the player has stopped playing the title. Activities are automatically
removed after 24 hours if they haven't had an update.

## Activity contents

Activities contain the information that's shown in the following table.

Field | Purpose | Notes
------|---------|--------------
`xuid` | The `XboxUserId` of the user who created the activity. | Used only when querying activities. Players can only set activity for themselves.
`connectionString` | A title-defined string that's opaque to MPA. Contains information that a title can use to connect to another player. | Must be less than 256 characters.
`joinRestriction` | Represents who can see the connection string in this activity. For more details, see the Privacy section later in this topic. | Must be `Public`, `Followed`, `InviteOnly`.
`maxPlayers` | The maximum allowed players in this activity. | Optional. If specified, it must be greater than 1 and less than or equal to 100.
`currentPlayers` | The current number of players in this activity. | Optional. If specified, it must be greater than 0 and less than or equal to 100.
`groupId` | A title-defined ID. Players with the same `groupId` are recognized in MPA to be playing together. | Must be less than 128 characters.
`platform` | When set to a specific platform, limits crossplay via invites and joins to only that platform. Not being set enables crossplay with all defined platforms.  |  For more information, see the Supporting crossplay activities section later in this topic.

## Privacy

A title might want to allow only a subset of the players on its social graph to join
the player. The `joinRestriction` field determines whether other players receive
the connection string when they're viewing this activity. Values and their meanings are shown in the following table.

Value | Meaning
------|--------
`Public` | All players can join this activity.
`Followed` | If the activity creator follows another player, that player can join.
`InviteOnly` | No players can join this activity unless they're responding to an invite.

## Supporting crossplay activities

When creating an activity in the Microsoft Game Development Kit (GDK), titles can specify an `allowCrossplay` flag.
If `false`, the Microsoft Game Development Kit (GDK) automatically fills the platform field of an invite with the
current platform. If `true`, the Microsoft Game Development Kit (GDK) leaves the platform field `null`, indicating that
the invite is cross platform. The list of platforms allowed via crossplay is defined by title 
configuration. Console generations are considered crossplay in this scenario.

## Retrieving activities

When retrieving activities for other players, sometimes the connection string is
hidden. This indicates that the player isn't allowed to join this activity. For
example, the connection string might be hidden because of the activity's
`joinRestriction`&mdash;the activity is full.