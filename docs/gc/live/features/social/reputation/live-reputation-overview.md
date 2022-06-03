---
title: Reputation overview
description: Encourages positive gameplay using Reputation.
kindex:
- Overview of the Reputation service
- Reputation
author: joannaleecy
ms.author: joanlee
ms.topic: conceptual
ms.localizationpriority: medium
ms.assetid: f8966184-5db7-4cab-93ca-9a0250a6077d
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Reputation overview

Reputation is a user statistic, just like any other, and is included in calls to retrieve all of a user's statistics and use them in reporting and tracking.

* The **Reputation** class represents the reputation.
* The **ReputationService** class represents the reputation service.
* The corresponding URIs are described in **Reputation URIs**.
> [!IMPORTANT]
> Reputation statistics are global across the service, not tied to a specific title. The service configuration ID (SCID) for the service is the global SCID used to access reputation statistics.


## Reputation features

* Handles feedback and complaints in the same way. Entities submit feedback about a user, and this feedback affects the user's reputation. The feedback can then be forwarded to the Enforcement team for further action.
* Allows users to give feedback on other users. Titles can submit feedback automatically.
* Allows titles direct access to the API. A user can submit feedback directly from within a game, and from within the context of the game area where the user is currently.
* Handles low reputation as affecting what users are able to do on Xbox Live and within titles. Thus users must keep an eye on their reputation and act more appropriately during online play.
* Permits positive feedback, as well as negative feedback. Users who help the Xbox community or a title's community can be rewarded for their efforts, and they can even be given special privileges.
* Derives a single, overall reputation, represented by the **Reputation.OverallReputation** property, which is derived from the following reputation types:
  * Fair play. Represented by the **Reputation.FairplayReputation** property.
  * Communications. Represented by the **Reputation.CommunicationsReputation** property.
  * User-generated content (UGC). Represented by the **Reputation.UserGeneratedContentReputation** property.

See **ResetReputation (JSON)** for more information.

## Usage flow for the Reputation service

The overall flow for the reputation service has two phases: reporting reputation, and reputation-filtered matchmaking.

## Reporting reputation

When enough negative feedback has been reported for a specific user, the title sets the **Reputation.OverallReputation Property** to indicate a bad reputation for that user (JSON attribute OverallReputationIsBad).
Given time without complaints, a user's reputation slowly improves, and it is possible for a user with a once bad reputation to achieve a good reputation again.

## Reputation-filtered matchmaking

For reputation-filtered matchmaking, specified by Xbox Requirement (XR), the title retrieves the player's **Reputation.OverallReputation** property. This value is a score that indicates the state of the player's overall reputation.

> **Note:**  
> If your title is looking for the `OverallReputationIsBad` attribute in a JSON file, and does not find it, it is safe to assume that the user has a good reputation.
This can happen with new accounts, until feedback has been processed for the user.
Players with any feedback from other users will always have reputation statistics, and a value for the **Reputation.OverallReputation** property.


## Reputation as an indicator of behavior

Reputation provides an indicator of how the user behaves on the system.
For example, is the person a friendly player or not?
Feedback from other session members determines a player's reputation.

Each user has a reputation score that travels with that person everywhere on Xbox Live.
The reputation score is exposed prominently in social places that friends can see, so that they can apply peer pressure to a player to behave better.

For example:

* The reputation score is shown on each user's profile card. Anyone in the system can look at the user's profile with a single click.
* The reputation score is shown in multiplayer games. When users play together online, the group's reputation equates to the reputation of the player with the lowest reputation in the group. The group is only matched with others with similar reputation. Other players use reputation to decide what kind of players are in that game and decide if they want to join the game.

## Key elements of Reputation

A title can determine if a user has reached an Avoid Me level for fair play, communications, or user-generated content (UGC) categories.

The user has reached Avoid Me for the associated category if any one of the following properties is set to 1:

* **Reputation.OverallReputation Property**. The associated JSON attribute is OverallReputationIsBad.
* **Reputation.FairplayReputation Property**. The associated JSON attribute is FairplayReputationIsBad.
* **Reputation.CommunicationsReputation Property**. The associated JSON attribute is CommsReputationIsBad.
* **Reputation.UserGeneratedContentReputation Property**. The associated JSON attribute is UserContentReputationIsBad.

## Good game reports

In addition to reporting users for bad actions, users can also send each other good game reports, which can be created in titles as voting for the most valuable player.

## Feedback history

Feedback history reports information such as the time when the user was last reported and what was the person reported for, for example, "Recently received feedback on Communication style."

## Xbox Requirement for Reputation

Xbox Requirement (XR) 068, Matchmaking Filtering by Reputation, requires the separation of players with low reputation from those with high reputation.
This is done by looking at the **Reputation.OverallReputation** value of a player and the player's OverallReputationIsBad attribute in user statistics.

Your title can retrieve a user's reputation by passing "OverallReputation" to the *statisticName* parameter of the **UserStatisticsService.GetSingleUserStatisticsAsync Method (String, String, String)**.
The WinRT method calls **GET (/users/xuid({xuid})/scids/{scid}/stats)** as shown in the following JSON body.

```json
    {
      "requestedusers": [
        "2533274792693551"
      ],
      "requestedscids": [
        {
          "scid": "7492baca-c1b4-440d-a391-b7ef364a8d40",
          "requestedstats": [
            "OverallReputationIsBad",
            "FairplayReputationIsBad",
            "CommsReputationIsBad",
            "UserContentReputationIsBad"
          ]
        }
      ]
    }
```

When a user's feedback from other players reaches a low level, OverallReputationIsBad is set to 1 for the user.
People for whom **Reputation.OverallReputation** is 1 should only be matched with other people having **OverallReputation** set to 1.

By default, when people enter a match, they generally don't have to deal with people with low reputations.
Titles can optionally allow a player with a good reputation to opt in to match with low-reputation players.

For the most recent version of XRs that apply to reputation, see [Xbox Requirements](../../../../policies/GC-policies-nav.md).

## Creating users with bad overall reputation for testing

For testing, users with very poor reputation can be set up to test the match filtering implementation for a title.
To set a specific value for a user, the test title or tool calls **POST (/users/xuid({xuid})/resetreputation)** with a JSON file that sets the user's specific reputation values.
See **ResetReputation (JSON)** for more information.

For example, the following JSON body sets a user's fair play reputation to a very poor value:

```json
    {
      "fairplayReputation": 5,
      "commsReputation": 75,
      "userContentReputation": 75
    }
```

Partners can make this call for all sandboxes except for RETAIL.
This request sets a user's base reputation scores, and the player's weightings for positive feedback will all be zeroed out.

The user's actual reputation after this call consists of these base scores plus the player's ambassador bonus, plus the player's follower bonus.
This mechanism creates a user with a low score and **Reputation.OverallReputation** set to 1 to test for the Match Filter XR.

The title can get the user reputation score for the user from the user statistics service, as described in the "Xbox Requirement for Reputation" section of this article.

## Reset a User's reputation to the defaults

The title sets the OverallReputationIsBad attribute to indicate that the user has a good reputation.
It calls **POST (/users/me/resetreputation)** and sets all values to 75.
A single call to **/users/xuid({xuid})/deleteuserdata** can be used to reset multiple Xbox user IDs.

The request body is:

```json
    {
      "xuids": [
        "2814659110958830"
      ]
    }
```

## Sending feedback from titles

Titles can send fair play feedback about players from matches.
This is done either directly from the title or from the title service in batches.

The title can use the **ReputationService.SubmitReputationFeedbackAsync Method** or the following direct REST methods:

|                      |                                                             |
|----------------------|-------------------------------------------------------------|
| Client POST          | https://reputation.xboxlive.com/users/xuid{XUID}/feedback |
| Service (Batch) POST | https://reputation.xboxlive.com:10443/users/batchfeedback   |

See **Feedback (JSON)** for a sample JSON body for the submission and for definitions of the allowed fields.

## Types of feedback allowed

The categories of feedback that can be posted are defined in **Feedback (JSON)**.

## When titles should send feedback

A title should send negative feedback when an event negatively affects the player experience in a game.
As a general rule, the title should send only one feedback per type, per round played.

For example, the title should:

1. Only send one FairPlayKillsTeammates feedback item for a person per round to kill 3 or more teammates, instead of sending one event every time the person kills a teammate.

2. Send the FairplayQuitter feedback item when someone purposefully quits a match early.

3. Send the FairplayUnsporting feedback item, once per race, when a user is driving backwards in a racing game.

## See also

* [Sending Reputation feedback from a title](concepts/live-sending-reputation-feedback.md)
