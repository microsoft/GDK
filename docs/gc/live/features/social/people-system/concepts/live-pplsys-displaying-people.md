---
title: Displaying people from the People System
description: Describes the code flow to display people by using the People System.
kindex: Displaying people from the People System
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.assetid: c97b699f-ebc2-4f65-8043-e99cca8cbe0c
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Displaying people from the People System

This topic describes the code flow to display people by using the People System. Here are some example call flow scenarios that show how titles get data from services that are related to People.

* [List of users currently in the game](#loucig)
* [List of the current user's People who are online](#lotcupwao)
* [Global leaderboard that contains random users](#glcru)
* [Leaderboard of user's People](#loup)

Services across Xbox Live return only data owned by that service and return only XUID references to users.
Here are some examples.

* The *People service* only owns and returns the XUIDs that are on a user's People List and some very basic information about each of those XUIDs (like favorite status).
* The *Presence service* owns data about the online status information of XUIDs.
* The *Leaderboards service* owns ranking information on lists of XUIDs.

To render lists of people in experiences, you must call multiple services. This is because display name and gamertag information is never returned from any service other than the *Profile service*.

The general calling pattern for the service APIs is to make one round trip to first get a list of XUIDs from the service that can best filter or sort the list, and then make simultaneous round-trip calls to other services as needed to get any additional metadata that's required for each XIUD.
For images, a third round trip of calls might be required to get images from the image URLs.

To reduce the number of round trips that are required to get data about a user's People List, a People *moniker* has been introduced to relevant services.
This feature allows callers to abstractly express to the primary service that it should get the list of the user's People from the People service, and then use that set of XUIDs to scope the return.

 [Return to the top of this topic.](#top)

<a id="loucig"></a>

## List of users currently in the game

**Title has:**

List of random XUIDs of other users in the game.

**Goal:**

To render minimal information for each of the other users.

**Field to render [owning service]:**

`GameDisplayName` \[Profile\]

**Call flow:**

Call `Profile` with the list of XUIDs.

 [Return to the top of this topic.](#top)

<a id="lotcupwao"></a>

## List of the current user's People who are online

**Title has:**

The current user's XUID.

**Goal:**

To render a rich list of online users that are in the current user's People List.

**Field to render [owning service]:**

* Favorite indicator [People]
* Display picture [Profile]
* `GameDisplayName` [Profile]
* Basic online status (green circle) [Presence]

**Call flow:**

1. Call `Presence`, passing in the `People` moniker to get the XUIDs and online status for each of the user's People.
1. In parallel:
    1. Call `Profile`, passing in the entire list of XUIDs to get the display name and picture URL for each. Then, get images for each picture URL.
    1. Call `People`, passing in the list of XUIDs to find out if any are favorites of the user.

 [Return to the top of this topic.](#top)

<a id="glcru"></a>

## Global leaderboard that contains random users

**Title has:**

The ID/name of the leaderboard.

**Goal:**

To render basic information for each user on the leaderboard.

**Field to render [owning service]:**

* Favorite indicator [People]
* `GameDisplayName` [Profile]
* Rank [Leaderboards]
* Score [Leaderboards]

**Call flow:**

1. Call `Leaderboards` to get the XUIDs, rank, and scores for the particular leaderboard.
1. In parallel:
    * Call `Profile`, passing in the list of XUIDs to get the display name and picture URL for each.
    * Call `People`, passing in the list of XUIDs to find out if any are favorites of the user.

 [Return to the top of this topic.](#top)

<a id="loup"></a>

## Leaderboard of user's People

**Title has:**

* The ID/name of the leaderboard
* The current user's XUID

**Goal:**

To render basic information for each user on the leaderboard.

**Field to render [owning service]:**

* Favorite indicator [People]
* `GameDisplayName` [Profile]
* Rank [Leaderboards]
* Score [Leaderboards]

**Call flow:**

1. Call `Leaderboards`, passing in the `People` moniker to get the XUIDs, rank, and scores for the particular leaderboard that's limited to the user's People List.
1. In parallel:
    * Call `Profile`, passing in the list of XUIDs to get the display name and picture URL for each.
    * Call `People`, passing in the list of XUIDs to find out if any are favorites of the user.

 [Return to the top of this topic.](#top)
