---
title: Sending reputation feedback from a title
description: Describes how to promote positive player experiences by sending player feedback to the Reputation service.
kindex:
- Sending Reputation feedback from a title
- Reputation
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 49f8eb44-1e31-4248-b645-9123df6f8689
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Sending reputation feedback from a title

This topic describes how to promote positive player experiences by sending player feedback to the Reputation service.

The majority of Xbox Live members play well together, but there's a small percentage of problematic members who hurt other member's game experiences.
We identify these problematic members through feedback from players and titles.
We help protect the rest of the Xbox Live gaming population by ensuring that these members have a limited multiplayer experience where they can't interfere with ethical players' games.

Xbox Live relies heavily on players to report other players to keep the system accurate. However, titles can directly participate in reporting and dramatically help improve the accuracy of the player reputation population.

This topic covers the following:

* [Steps to submit feedback from the title or the Title service](#stsfftots)
* [Example partner feedback usage scenarios](#epfus)
* [Complete behavior feedback options](#cbfo)
* [Feedback API calls](#fac)
* [Feedback object](#fo)
* [Feedback Q&A](#fqaa)


<a id="stsfftots"></a>

## Steps to submit feedback from the title or the Title service

1. Add feedback moments (conveying infraction time) to the title or the Title service.
2. Determine the correct feedback type.
3. Call Reputation Feedback APIs with feedback.


### Adding feedback moments to the title or the Title service

Players can have bad experiences with teammates who sabotage their own side, players who do nothing instead of actively playing, or cheaters who ruin their games.
Xbox Live lets players report these problematic players directly. However, user feedback isn't perfect.

Titles can easily determine simple things like players idling in-game and quitting early. Titles can sometimes determine when a player is cheating.
Your title can submit feedback in a wide variety of feedback moments, which helps improve the experience of all ethical players.


### Determining the correct feedback type

The Reputation service has many feedback types to capture the ways that a player might warrant feedback.
For more information, see the following table.
Most of the feedback types are negative, but it's also possible to improve a player's reputation with positive feedback.

Xbox system UI provides a way for players to submit feedback on other players in-game.
This player-to-player feedback doesn't carry much weight, because some players are prone to griefing one another when they lose.

Titles can supplement this system UI, providing UI for players to directly submit feedback on another player. We prefer that titles submit feedback on behalf of the title itself by using Partner feedback because it's highly trusted.

 [Return to the top of this topic.](#top)

<a id="epfus"></a>

## Example Partner feedback usage scenarios


### Player quitting a game in the middle of a match

A player is losing a game and uses the game's menu to quit the game, abandoning their teammates.
When a title detects this behavior, it can report the behavior by using `FairPlayQuitter`.


### Idling after match found in a game

A player gets matched with other players to play, but consistently stands idle in the game instead of helping the team.
The title can report the player behavior by using `FairPlayIdler`.


### Killing teammates in a game

A player in a game is constantly killing teammates for fun.
When a title detects that a player is consistently team-killing, it can report the player by using `FairPlayKillsTeammates`.


### Title has community kick/vote feature

A player has been voted by players in the round to be removed from the session for bad behavior.
If the title removes this player from the session, it can report them by using `FairPlayKicked`.


### Helpful player community vote

After a few rounds of a game, the title offers an option to pick a player who has helped the team the most.
When a title detects this action, it can report the behavior by using `PositiveHelpfulPlayer`.


### High-quality&ndash;user-generated content (UGC)

A title has a scene in which a player can pick the best design for a vehicle.
When a title detects this action, it can report the behavior by using `PositiveHighQualityUGC`.


### Skilled player

After a few rounds of a game, the title offers an option to pick an MVP&mdash;the best player.
When a title detects that a player consistently earns MVP status, it can report the behavior by using `PositiveSkilledPlayer`.


### Player reports questionable UGC in a title

A title has a scene in which a player can view vehicle designs.
A player notices an offensive design and wants to report it.
When a title detects this action, it can report the offender by using `UserContentInappropriateUGC`.


### Title wants to request an Xbox Live ban review of a player

A title's community manager has noticed a low-reputation player who is consistently causing trouble in their game.
A title can request an Xbox Family, Trust, and Safety (XFTS) review by using `FairPlayUserBanRequest`.

 [Return to the top of this topic.](#top)
<a id="cbfo"></a>

## Complete behavior feedback options

The following table describes the feedback types for submitting player feedback on behalf of your title.

The Reputation service is flexible and can easily add new feedback types if you think that the following types don't meet your title's needs.
To add a new feedback type, contact your account manager.

**Fair play feedback types**               | **Description**
----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------
`FairPlayKillsTeammates`                    | Report a player who is intentionally killing their own teammates.
`FairPlayCheater`                           | Report a player who is certainly cheating.
`FairPlayTampering`                         | Report a player who has certainly tampered with the game disc or has otherwise tampered with the game's software or hardware.
`FairPlayUserBanRequest`                   | Report a player who you think has earned a suspension.
`FairPlayConsoleBanRequest`                 | Report a console that you think should be banned from connecting to Xbox Live.
`FairPlayUnsporting`                        | Report a player who is certainly engaging in unsportsmanlike conduct.
`FairPlayIdler`                             | Report a player who enters multiplayer matches but doesn't actively play.
`FairPlayLeaderboardCheater`                | Report a player who has certainly cheated to appear high on a leaderboard.
**Communications feedback types**         | **Description**  
`CommsInappropriateVideo`                   | Report a player who is being inappropriate in video chat.
**UCG feedback types** | **Description**  
`UserContentInappropriateUGC`               | Report an inappropriate piece of content that a player creates in your title.
`UserContentReviewRequest`                  | Report a piece of content proactively so that XFTS can review it.
`UserContentReviewRequestBroadcast`         | Report a broadcast proactively so that XFTS can review it.
`UserContentReviewRequestGameDVR`           | Report a Game DVR clip proactively so that XFTS can review it
`UserContentReviewRequestScreenshot`        | Report a screenshot proactively so that XFTS can review it.
**Positive feedback types**                     |  **Description**  
`PositiveSkilledPlayer`                     | If players can vote to determine an MVP, report a skilled player when you're certain that the player deserves positive feedback.
`PositiveHelpfulPlayer`                     | If a game provides UI for a player to report that another player was helpful, report the helpful player.
`PositiveHighQualityUGC`                    | If a game provides UI for a player to compliment another player's content, report the content positively.

 [Return to the top of this topic.](#top)
<a id="fac"></a>

## Feedback API calls

Titles can use two strategies to call the Reputation service.

* Report players in aggregate from a partner service by using a service token for authentication (preferred).
* Report players directly from the client.

The client API has built-in antifraud technology. To be considered valid, multiple reports on a player are required.

Both APIs are batched and can report multiple players simultaneously.

The title can use the following Xbox Live APIs to submit player reputation feedback.

Language | API
-------- | --------------------------------------------------------------------------------------------
C        | `XblSocialSubmitBatchReputationFeedbackAsync`
C++      | `xbox::services::social::reputation_service.submit_batch_reputation_feedback(...)`

Alternatively, the title can use the following direct REST methods.

API          | URL                                                      | Authentication requirements
------------ | -------------------------------------------------------- | ---------------------------------------
Service `POST` | https://reputation.xboxlive.com/users/batchfeedback      | `S-token` with partner and sandbox claims
Client `POST`  | https://reputation.xboxlive.com/users/batchtitlefeedback | `Xtoken` with title and sandbox claims

 [Return to the top of this topic.](#top)
<a id="fo"></a>

## Feedback object

The `Feedback` object has the following specification for the latest version (101).
Both APIs expect a batch of the following objects.

Member       | Type   | Description
------------ | ------ | -----------------------------------------------------------------------------------------------------------------------------------------------------------------
`sessionRef`   | Object | An object describing the Multiplayer Session Directory (MPSD) session that this feedback relates to, or `null`.
`feedbackType` | String | The type of feedback. Possible values are defined in the `ReputationFeedbackType` enumeration.
`textReason`   | String | Player-supplied text that the sender added to explain the reason that the feedback was submitted. This text is very valuable for XFTS.
`evidenceId`   | String | The ID of a resource that can be used as evidence of the feedback being submitted. For example, a video file recorded during gameplay or an activity feed item.
`titleID`      | String | The title ID of the played title. This ID is only required if it isn't present in a token.
`targetXuid`   | String | The XUID of the player who you're reporting.

The following example code shows the use of `FairPlayKillsTeammates`.


```json
POST https://reputation.xboxlive.com/users/batchtitlefeedback
{
    "items" :
    [
        {
            "targetXuid": "33445566778899",
            "titleId" : null,
            "sessionRef": {
  "scid": "372D829B-FA8E-471F-B696-07B61F09EC20",
  "templateName": "CaptureFlag5",
  "name": "Title56932",
           },
            "feedbackType": "FairPlayKillsTeammates",
            "textReason": "Title detected this player killing team members 19 times",
            "evidenceId": null
        }
    ]
}
```

 [Return to the top of this topic.](#top)
<a id="fqaa"></a>

## Feedback Q&A


### Q: Can I send a hint to the system to help the people who might be looking at the player report?

**A:** Yes. These hints are very helpful. Use the `textReason` parameter to help XFTS. It looks at the submitted feedback. For example, for an idler, you can add a text reason that says, "We received no user input from this player after the first five seconds of the game."

This text reason is valuable for XFTS. Ensure that the text reason is helpful and descriptive.


### Q: Should I consider how often I send in feedback about a player?

**A:** No. Titles should call the Reputation service when they're confident that a player has earned feedback.
The service has several safety systems to prevent titles and players from being able to overly affect other players.


### Q: Can I adjust the weight of the feedback being sent?

**A:** No. The Reputation service determines the weight of the feedback.
We're always adjusting the weights to provide improvements for fairer scoring.


### Q: Can I undo feedback that I've sent about a player?

**A:** No. Feedback is final.
If you believe that your title has a bug and is sending erroneous feedback, let us know. We'll block your title until you fix the bug.


### Q: Can I see the feedback that's been sent for my title from players?

**A:** Yes. Currently, this information isn't available for you to view on your own.
To see the feedback, contact your account manager. We have data per title that we can share.



### Q: When I send in a console or player ban review request, how do I know what happened?

**A:** Currently, the information for the review is sent to XFTS, but you don't get an update on the ban review.


### Q: Is there a reputation score per title?

**A:** No.
Currently, there are sub-scores for reputation for fair play, communications, and UGC, but not per title.


 [Return to the top of this topic.](#top)

