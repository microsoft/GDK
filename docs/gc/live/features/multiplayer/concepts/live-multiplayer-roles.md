---
title: Multiplayer roles
description: Describes how to define player roles in Xbox Live multiplayer.
kindex:
- Multiplayer roles
- roles, multiplayer
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 06/29/2017
edited: 02/20/2021
security: public
---

# Multiplayer roles

This topic describes how to define player roles in Xbox Live multiplayer. For some game sessions, you might want to assign gameplay roles&mdash;such as support, medic, or assault&mdash;to specific players. You might also want to reserve game slots for players who can fill specific gameplay roles.

By using the Xbox Live roles feature, the service can track which players are assigned each gameplay role and enforce a maximum number of players who can select a specific gameplay role.

The most common use of roles is to determine game-specific roles for a game session. For example, you can have a game mode that requires one or two support classes, at least one tank/heavy class, and no more than five assault classes.

In another possible scenario, you might want to specify that a game session can have exactly four game players, up to eight spectators, and exactly one announcer.

You can also use roles to reserve slots for friends while filling the remaining slots through other means, such as session browse.

## Role types

A *role type* represents a group of role definitions. Each role must be defined as part of a role type. Role types are defined in the multiplayer session document.

A player can be assigned only one role from a role type. For example, if a "class" role type includes healers, tanks, and damage, a player can be assigned to only one of those roles.

You can define multiple role types, and a player can be assigned one role from each role type. In the previous scenario, a player who chooses the healer role can also be assigned a squad leader role if the squad leader role is defined in a separate role type.

## Role type properties

When you define a role type, you must specify the following information.

* The name of the role type. The name must be lowercase alphanumeric and contain no more than 100 characters.
* The definitions of the roles.
* Whether the roles are owner managed.
* Whether the properties of the roles can be changed during the life of the session.

If a role type is owner managed, only players who are owners of the session can assign roles of that type. If the role type isn't owner managed, players can assign roles to themselves.

You can specify that a role type is owner managed only for sessions that have the `hasOwners` capability set.
> [!NOTE]
> The Xbox Services API (XSAPI) doesn't currently support owners assigning roles to other players.

## Role properties

When you define a role, you must specify the following information.

* The name of the role. The name must be lowercase alphanumeric and contain no more than 100 characters.
* The maximum number of players that can fill the role. The value must be greater than zero.
* The target number of players that should fill the role. The value must be greater than zero and less than or equal to the maximum number of players who can fill the role.

When a player is assigned a role in a session, the preceding information is recorded in the multiplayer session document.

The service enforces the maximum number of players that can be assigned to a role, but it doesn't enforce the target number.

## Create roles

Roles and role types are typically defined in session templates; for more information, see [Multiplayer session templates](../mpsd/concepts/live-session-templates.md). The service supports definition of role types and roles during session creation, but XSAPI doesn't.

### Define role types and roles in a session template

You can define role types and roles when you create a session template during Xbox Live configuration.

Information about role types and roles is specified as a base-level `roleTypes` element in the session template by using the following format.

```json
"roleTypes": {
  "myroletype1": { // Must be lowercase alphanumeric.
    "ownerManaged": true, // Can be true only on sessions that have the "hasOwners" capability set.
                          // If true, only the owner of the session can assign this role to players.
    "mutableRoleSettings": ["max", "target"], // Only these role settings can be modified during the
                                              // session. Exclude role settings to lock them.
    "roles": {
      "role1": { // Must be lowercase alphanumeric.
        "max": 3, // Maximum number of players assigned to this role. Enforced by MPSD.
        "target": 2 // Target number of players to assign this role to. Not enforced by MPSD.
      },
      "role2": {
        ...
      }
  },
  "myroletype2": {
    ...
  }
},
```

## Retrieve role information for a multiplayer session

You can get information about role types, roles, and number of players assigned to each role from a multiplayer session or from a multiplayer search handle.

In XSAPI, information about role types and roles is stored in an array structure.

In the `XblMultiplayerSearchHandle` object returned from a search request, you can get information about role types by indexing the [XblMultiplayerSessionRoleTypes](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionroletypes.md) data with the name of a role type.

The call returns an [XblMultiplayerRoleType](../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayerroletype.md) object. To get information about roles, index the `Roles` array.

The [XblMultiplayerRole](../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayerrole.md) object contains information about the role, including `MaxMemberCount`, `MemberXuids`, `MemberCount`, and `TargetCount`.

## Assign a role to a player

Currently, a player can assign only their own role in XSAPI. To specify the role type and role for the current player, pass the `XblMultiplayerSessionHandle` object to the [XblMultiplayerSessionCurrentUserSetRoles](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessioncurrentusersetroles.md) method.

If the role is already full when you try to write the session to the service, MPSD rejects the write.