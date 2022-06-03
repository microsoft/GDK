---
title: 'Cross-network multiplayer implementation example: MMO'
description: Describes an example of cross-network functionality and flow in a massive multiplayer online game (MMO).
kindex: Cross-network Multiplayer implementation example MMO
author: joannaleecy
ms.author: mwester
ms.topic: conceptual
ms.localizationpriority: medium
edited: 02/22/2021
security: public
---

# Cross-network multiplayer implementation example: MMO

This topic describes cross-network functionality and flow in a massive multiplayer online (MMO) game. This topic is in support of Console XR-007: Cross-Network Play, Data Usage, and Companion App Interactions. For more information about this XR, see [(Xbox Developer Downloads > Partner, Publishing, and Release Management Information > XGD Partner Documentation)](https://www.microsoft.com/software-download/devcenter).

The following example scenario illustrates the recommended cross-network functionality and flow in an MMO game. It shows one possible design and implementation path. In this scenario, the title supports the following multiplayer functionality.

#### Open game world

The title supports an open game world that allows interactions between players. Players are able to group loosely in the open game world for player vs. environment (PvE) experiences. Player vs. player (PvP) experiences are 1:1 and are only permitted in selected areas.

#### Custom matchmaking for instanced game sections

The title implements a custom matchmaking service for players who enter instanced PvP or PvE gameplay sections. This service matches players and teams of players.

#### Dedicated servers

All gameplay for the title is executed on dedicated servers. All traffic is routed through these servers.

#### Chat

The title supports voice and text chat between players. All traffic is routed through servers.

#### Consumables

The title provides an in-game store with purchasable (premium) in-game currency. Players can use this currency to purchase cosmetic items.

#### Downloadable content (DLC)

Purchasable downloadable content (DLC) includes new game regions that unlock new player character classes.

## Title services

In this example, the first title service that a player interacts with after launching the game is a title sign-in service. To play the game, a player has to create a title account, and then link it to the Xbox Live account. You can create an account either from within the title or from the title's webpage.

For account linking, the player's XUID is linked to a title-specific account. To perform account linking, a player signs in once in the title with a username and password for the title account. XUID access must be approved prior to use and must be discussed with a developer account manager (DAM). On the title's webpage, a player who has signed in with the title account also must sign in to the Microsoft account for account linking. The title account has a unique ID (GUID) that allows all title services to handle players, regardless of network origin. The title account also stores all of the player state information, such as player characters, progression, inventory, and all player metadata.

## Title flow

For an MMO game, a compliant flow for cross-network functionality depends on whether the player is in the open game world or in instanced gameplay. The following steps apply in all cases.

1. Validate privileges

    After player sign-in, a title validates the multiplayer privileges (254 and 189) and cross-network privilege (185) for the active player. If any privilege is denied, a player can't enter the title, and an error dialog is displayed. At this point, a title should check the communications privilege (252) for voice and text chat to restrict functionality appropriately.

2. Cross-network notification

    On first launch, the game notifies the player that cross-network functionality is present in gameplay.

    The following steps apply for the open game world.

3. Enter the open game world.

    The player always enters the open game world when signing in to the game, and then connects to a title server.

4. Join the open game world Multiplayer Session Directory (MPSD) session.

    The title server for the open world gameplay creates MPSD sessions that reflect the game regions in the open game world. One or more of these MPSD sessions have the gameplay capability enabled. All Xbox Live players join the open game world session for their game region. The server maintains information about both Xbox Live and players who don't use Xbox Live. The open game world session allows join-in-progress and invitations for Xbox Live players and is only set to closed if the server doesn't accept new connections from clients.

5. Enable open game world gameplay.

    Gameplay features with other players are available, depending on player privileges. Global text chat is always enabled for players who have the communication privilege set. All text chat messages use the string validation service and a block list to filter offensive language and terms. The same validation is used for player names.

Direct text chat between all players (Xbox Live/Xbox Live and Xbox Live/players who don't use Xbox Live) is enabled only after validating all required privacy and permission checks. For friend relationships that don't use Xbox Live, the title uses title-specific friend relationships.

Direct interaction between Xbox Live players is tracked by the title service and is used to set an encounter ID between these players in the open game world MPSD session. This ensures that players are visible on each other's recent player lists.

### Instanced PvE or PvP gameplay

The following steps apply for instanced PvE or PvP gameplay.

1. Group MPSD session.

    For Xbox Live players, the title creates an MPSD session to track Xbox Live players. Players who don't use Xbox Live are tracked through the title service.

2. Group invites and join-in-progress.

    In this example, game design limits joins or invites to player groups. The group MPSD session is used to support join-in-progress and invites for Xbox Live players. In-game, cross-network invites are supported by the title service.

3. Group matchmaking.

    The title supports cross-network multiplayer for group PvP or PvE matchmaking flows. In this example, the player uses a matchmaking UI to select a PvP or PvE experience and is then grouped with other players into an instanced play experience.

4. Create and join game MPSD session.

    The result of group matchmaking is an MPSD lobby session that's created by the match service through service-to-service calls to Xbox Live. All Xbox Live players join this game session and remain in this session during instanced gameplay. The service uses custom properties to additionally provide hints about the players in the session that don't use Xbox Live. These hints can then be used by client logic for setting session state during the rest of the flow.

5. Instanced gameplay.

    When all players are ready, the instanced gameplay starts. In this example, chat is also enabled between Xbox Live players through the dedicated server. During instanced gameplay, a list of players is visible in the game UI. This list is a title character name list with the option to see gamertags or other network identifiers for players. Xbox Live players are uniquely highlighted. The following screenshot shows an example of this group UI.

    ![Screenshot that shows an example of an MMO group](../../../../../../resources/gamecore/secure/images/en-us/live/policies/console/xr/xr007-MMOGroup.png)

6. Completing gameplay.

    When instanced gameplay is completed, team players return to the open game world. Players leave the MPSD game session and set the open game world MPSD session as the activity session.

## Session management

To adhere to all Xbox Requirements, the title creates two MPSD sessions for Xbox Live players.

### Open game world region game session

A large MPSD session is created by the title service at startup. It's created through service-to-service calls to Xbox Live for each title server instance. All players of a title server instance join the corresponding MPSD session. In these sessions, the server sets an encounter ID for Xbox Live players who interact with each other to ensure correct representation on the recent players list.

### Instanced game session

This session is created by the matchmaking service through service-to-service calls to Xbox Live. It contains reservations for all Xbox Live players in a game session (across teams). It's used to correctly populate the recent player list of Xbox Live players.

### Group session

This session is created as soon as a player creates a group (group of 1). It's used for the activity session to support join-in-progress and invites. By game design, players aren't able to join during certain game modes. In these modes, the `closed` property is used to disable join-in-progress and invites.

Players who don't use Xbox Live aren't directly represented in the MPSD sessions as session members. For tracking purposes, the title reflects their presence in a custom session property as shown in the following code example.

```
{{"name":"kumarplayer"},{"name":"spencerplayer"},{"name":"eliseplayer"}}
```

This list, and the Xbox Live session members, can also be used to determine if a server instance is full. The large MPSD session has to enable the gameplay capability to adhere to Xbox Requirements.

## Player blocking, muting, and reporting

Player blocking and muting in the title is supported at the title level.

###  Xbox Live player blocking and muting

The title uses [XblPrivacyBatchCheckPermissionAsync](../../../../reference/live/xsapi-c/privacy_c/functions/xblprivacybatchcheckpermissionasync.md) to check privileges for multiplayer and chat with another Xbox Live player and the player classes of players who don't use Xbox Live/friends that don't use Xbox Live. Players can perform blocking and muting in their player profile UI.

### Blocking and muting of players not using Xbox Live

The title uses an in-title block list to support blocking or muting of players who don't use Xbox Live. This list is maintained on a title service and is checked for multiplayer permissions. It must be possible to mute a player who doesn't use Xbox Live in the title through a custom title UI.

### Xbox Live player reporting

The title also allows reporting of players. For Xbox Live, players file reports through the profile UI. Xbox Live enforcement handles player reports.

### Reporting of players who don't use Xbox Live

For players who don't use Xbox Live, the title provides a custom reporting UI flow. The title handles player reports accordingly, and handles player reports based on guidelines by other multiplayer networks.

## Microsoft Store

Purchases of virtual currency on Xbox Live and other multiplayer networks are tracked on a title service that depends on the following criteria.

### Virtual currency

Players have a merged wallet of virtual currency and items across all platforms.

### DLC

DLC provides a way for players to access new regions of the game. Microsoft Store is used for purchases on Xbox Live platforms. A player can only enter the corresponding DLC region and play with other characters who have the entitlement of the region from their respective store.

## Achievements

Title achievements are based on open game world and instanced gameplay actions. Achievement progress includes cross-network gameplay experiences. The title doesn't include any achievements that are only limited to cross-network gameplay.

## Player progress

Player progress is shared between all title versions. A custom title account that's linked to multiple multiplayer networks and a custom title service are used for this purpose.

## Game DVR and broadcasting

The title allows Game DVR and screenshots in the open game world and instanced gameplay but removes all text chat from the image buffer.

## Leaderboards

The title doesn't support leaderboards.