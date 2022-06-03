---
title: Enable large sessions for Multiplayer
description: Describes support for large sessions (more than 100 members) with Multiplayer features.
kindex:
- Using large sessions for Multiplayer
- multiplayer
- large session
- recent players
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 07/11/2017
edited: 00/00/0000
security: public
---

# Enable large sessions for Multiplayer

This topic describes how to create a multiplayer *large session* that can handle more than 100 members.
This scenario is most common to massively multiplayer online (MMO) games and broadcasts (where most of the members are spectators). Large session support might also apply to other styles of games.

In some circumstances, you might find large sessions useful, even when dealing with smaller groups of players.
If you want multiple players to be in the same session, but not necessarily be aware of each other if they don't encounter each other in the game, you can use the `encounters` property of large sessions.



Large sessions aren't currently supported by [Multiplayer Manager](../../mpm/live-multiplayer-manager-nav.md). You must use the 2015 Multiplayer APIs to use direct calls to Multiplayer Service Directory (MPSD).

Large sessions are treated slightly differently than regular sessions.

* Large sessions contain less information than regular sessions but are more efficient.
* Large sessions support up to 10,000 members.
* You can't subscribe to a large session.
* There's no automatic inclusion into the recent player lists for members of a large session.

## Recent players

When Xbox Live players play multiplayer games with new players, after the game, they can see those players on their dashboard in the recent players list.
* If a player had a great experience with a new player in a game, they might want to play with them again or add them as a friend.
* If a player had a poor experience with a player, they might want to avoid them in the future, or report the bad behavior after the game is over.

During regular sessions, Xbox Live automatically adds players in the same session to the recent players list.
If you use large sessions, however, you must take some extra steps to ensure that the recent player lists are properly populated.

## Set up a large session

To set sessions up as large, add `"large": true` to the capabilities section in the session template.
You can set the `maxMembersCount` value up to 10,000.

The following template creates a large session that supports up to 2,000 players.

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 2000,
            "visibility": "open",
            "capabilities": {
                "gameplay": true,
                "large": true
            },
            "timeouts": {
                "inactive": 0,
                "ready": 180000,
                "sessionEmpty": 0
            }
        },
        "custom": { }
    }
}
```

## Work with large sessions

When writing large sessions to MPSD, we recommend that you don't exceed 10 writes per second.
A typical 1,000 player session might write every two minutes per player on average with updates such as members joining or leaving.

Other properties shouldn't be maintained in a large session.

### Associate players from the same large session

When you retrieve a large session from MPSD, the response doesn't contain a list of members. There isn't a way to get the full list.
If the caller is in the session, their member record is the only one in the `members` collection, labelled as `me` (just like in the request).

This means that client members can only update their own entry in the session. They rely on the server to provide them with a common identifier that you specify. Xbox Live uses this identifier to associate players who played together so it can update reputation and recent players status.  

There are two ways to indicate that players in a session played together: persistent groups and brief encounters.

#### Persistent groups

A *persistent group* is a named group of players who play together on an ongoing basis, potentially with some players joining or leaving the group. The group name should follow the same naming rules that apply to regular sessions, such as a GUID.

As each member joins or leaves the group, they should add or remove the group name from their own `groups` property, which is an array of strings.

```json
{
    "members": {
        "me": {
            "properties": {
                "system": {
                    "groups": [ "example-group-name" ]
                }
            }
        }
    }
}
```

#### Brief encounters

If two players have a brief, one-time encounter (a *brief encounter*), the game can indicate it by using the `encounters` property instead of the `group` property.  

Give each encounter a name. After the encounter, both (or all) participants write the encounter name to their own `encounters` property.

```json
{
    "members": {
        "me": {
            "properties": {
                "system": {
                    "encounters": [ "trade.0c7bbbbf-1e49-40a1-a354-0a9a9e23d26a" ]
                }
            }
        }
    }
}
```

You can use the same name for both `groups` and `encounters`. For example, if one player "trades with" a group whose name has been added to `groups`, the player who had the encounter uploads the group name in their "encounters" list. This causes the individual to see all the members of the group as recent players and vice versa. The players in the group don't need to take any action to update the group membership.

When a player is member of a group for 30 seconds, it's counted as an encounter.
Because the encounters are considered one-off events, the `encounters` property is always processed immediately and then cleared from the session.

The `encounters` array never appears in a response.
In contrast, the `groups` property remains until altered or removed, or the member leaves the session.