---
title: Invites
description: Describes how to send a request for another player to join a multiplayer experience.
kindex:
- Invites
- MPA
ms.topic: conceptual
ms.localizationpriority: high
security: public
author: joannaleecy
ms.author: jeffng
ms.date: 05/12/2020
edited: 03/17/2021
---

# Invites

This topic describes how to send a request for another player to join a multiplayer experience. A title can use Multiplayer Activity (MPA) for this invite.  

Invites can be sent directly by the title or by an external server. Titles send an invite by using the information in the following table.  

Field | Purpose | Notes
------|---------|--------------
`xuids` | The `XboxUserIds` of one or more players to invite. |
`allowCrossPlatformJoin` | Indicates whether players on other platforms receive the invite. | For more information, see the following Supporting crossplay invites section.  
`connectionString` | A title-defined string that's opaque to MPA. Contains information that a title can use to connect to another player. | Must be less than 256 characters.

## Supporting crossplay invites

When creating an activity or sending an invite in the Microsoft Game Development Kit (GDK), titles can specify an 
`allowCrossPlatformJoin` flag. If `false`, the Microsoft Game Development Kit (GDK) automatically fills the platform field with the
current platform. The invite is only received by players on that platform. If `true`, the
Microsoft Game Development Kit (GDK) leaves the platform field `null`, indicating that the invite is cross platform.

## Sending invites from a server

External servers can also send an invite on behalf of a player. Its contents are
identical to the previous client fields, with the addition of one field as shown in the following table.

Server-only field | Purpose | Notes
------|---------|--------------
`sender` | Indicates the player who the server is sending an invite for. | Must be a valid player.