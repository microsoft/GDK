---
title: Migrating an arbiter
description: Describes selecting a new arbiter for 2015 Multiplayer by using either graceful or failover migration.
kindex:
- migrating an arbiter
- arbiter
- Multiplayer 2015
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 9fb5d2c0-d548-4a22-b64e-6b215f78d22e
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 02/17/2021
security: public
---

# Migrating an arbiter

During a 2015 Multiplayer session, you might need to select a new arbiter by using arbiter migration. The following flow chart illustrates how to migrate an arbiter.

![Flow chart that shows the process of arbiter migration](../../../../../../resources/gamecore/secure/images/en-us/live/multiplayer/Multiplayer_2015_HostMigration.png)

There are two types of migration.

- Graceful arbiter migration
- Failover arbiter migration

## Graceful arbiter migration

In graceful arbiter migration, the outgoing arbiter can assist with the migration task and determine a new arbiter. This type of migration uses the setting of an arbiter as described in the section [Set an arbiter for an MPSD session](../mpsd/how-to/live-mpsd-how-tos.md#set-an-arbiter-for-an-mpsd-session) in the topic "Multiplayer tasks."

## Failover arbiter migration

In a failover arbiter migration, connection to the previous arbiter is lost and the remaining peers must determine a new arbiter for the session. Failover arbiter migration also sets the host device token and handles HTTP 412 status codes just as graceful arbiter migration does. However, there are multiple approaches for selecting a new arbiter during a failover arbiter migration.

### Select arbiter by using the host candidate list

You can configure Multiplayer Session Directory (MPSD) to provide an ordered host candidate list based on matchmaking Quality-of-Service (QoS) metrics that are measured during certain operations. The client can use this list to determine a new arbiter.

To take advantage of this list during arbiter migration, each peer can perform the following steps.

1. Identify the list position of the previous arbiter.
1. Evaluate the next console in the list.
1. If the console is the local console, use it as the new arbiter.
1. If the console is no longer present in the multiplayer session or has disconnected from its peers, evaluate the next candidate in the list as in the previous steps.
1. If the end of the list is reached with no new arbiter selected, use a greedy approach to arbiter selection, which can break connectivity. For more information, see [Select arbiter by using greedy arbiter selection](#greedy-arbiter-selection) later in this topic.
> [!NOTE]
> We don't recommend creating a host candidate list in-game after matchmaking through explicit in-title QoS probes. If this mechanism is absolutely necessary, have your client use the host device token instead of user information (such as Xbox user ID) to determine arbiter candidates.

### Select arbiter by using peer voting

If full connectivity exists among all peers, they can use peer messages to vote and select a new arbiter. The new arbiter then updates the host device token for the session by using a synchronized update.

For more information, see the section [Update an MPSD session](../mpsd/how-to/live-mpsd-how-tos.md#update-an-mpsd-session) in the topic "Multiplayer tasks."

<a id="greedy-arbiter-selection"></a>
### Select arbiter by using greedy arbiter selection

Sometimes no host candidate list is available or connectivity QoS isn't needed; for example, for pure arbiter responsibilities. In that case, a peer should set the new arbiter as soon as it detects that the original arbiter has left the game session, as reported by the [XblMultiplayerSessionChangedHandler](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionchangedhandler.md) event. All other peers see an HTTP 412 status code when trying to set the host device token, assuming no other changes to the session are made at this point.

Only one peer succeeds in selecting the new arbiter.

## See also

[Multiplayer Session advanced topics](../mpsd/concepts/live-mpsd-details.md)  