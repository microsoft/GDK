---
title: Feedback (JSON)
description: " Feedback (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Feedback (JSON)
Contains feedback information about a player.
<a id="ID4EN"></a>


## Feedback

The Feedback object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| sessionRef| object | An object describing the MPSD session this feedback relates to, or null. |
| feedbackType| string | The type of feedback. Possible values are defined in the <b>Microsoft.Xbox.Services.Social.ReputationFeedbackType</b>. |
| textReason| string| User-supplied text that the sender added to explain the reason the feedback was submitted. |
| voiceReasonId| string| The ID of a user-supplied voice file from Kinect that the sender added to explain the reason the feedback was submitted (Base-64). |
| evidenceId| string| The ID of a resource that can be used as evidence of the feedback being submitted, for example, a video file recorded during game play. |

<a id="ID4EVC"></a>


### Feedback Types

The "Sent by" column indicates who can submit the feedback.

   * "User" means it can be submitted by the console using an XToken for Auth, therefore the API can accept **SubmitFeedback**.
   * "Partner" means it can be submitted by a Partner using a Claims Cert, therefore the API can accept **SubmitBatchFeedback**.
   * "Privacy" means only the SLS Privacy service can send the feedback.
   * "None" means the feedback is generated internally by the SLS reputation service for auditing and cannot be sent by any caller.

| Type| Sent by| Notes|
| --- | --- | --- | --- | --- | --- |
| CommsAbusiveVoice| User| Users send feedback to report inappropriate voice communications from within a title and from the Xbox dashboard. |
| CommsInappropriateVideo| User, Partner| Users and partners send feedback to report inappropriate video from within a title and from the Xbox dashboard. |
| CommsMuted| Privacy| When a user mutes another player, Privacy sends this feedback to the reputation service. |
| CommsPhishing| User| Users send this feedback to report a phishing message. |
| CommsPictureMessage| User| The inbox service calls the reputation service, which updates the sender's reputation based on communication of a picture and reports the feedback to the Enforcement team. |
| CommsSpam| User| Users send this feedback to report a spam message. |
| CommsTextMessage| User| The inbox service calls the reputation service, which updates the sender's reputation and reports the feedback to the Enforcement team. **Note:** The Inbox UI should have a button to allow users to flag a message. |
  | CommsVoiceMessage | User | The inbox service calls the reputation service, which updates the sender's reputation based on communication of a voice message and reports the feedback to the Enforcement team.  |
  | FairPlayBlock | Privacy | Privacy sends this feedback to the reputation service when a user blocks another player.  |
  | FairPlayCheater | User, Partner | Titles that determine that a user is cheating can send this feedback without user intervention.  |
  | FairPlayConsoleBanRequest | Partner | A partner sends this feedback as a recommendation to ban a console from Xbox Live.  |
  | FairPlayIdler | User, Partner | Titles that determine if a user stands idle on purpose in a game, usually round after round, can send this feedback without user intervention.  |
  | FairPlayKicked | User, Partner | Titles that detect that a user is voted out of a game (kicked) can send this feedback without user intervention.  |
  | FairPlayKillsTeammates | User, Partner | Titles that can automatically determine when a player killls his teammate can send this feedback without user intervention.  |
  | FairPlayQuitter | User, Partner | Titles that determine that a user quit a game early can send this feedback without user intervention.  |
  | FairPlayTampering | User, Partner | Titles that determine that a user has tampered with on-disk content can send this feedback without user intervention.  |
  | FairPlayUnblock | Privacy | Privacy sends this feedback to the reputation service when a user unblocks another player.  |
  | FairPlayUserBanRequest | Partner | A partner sends this feedback as a recommendation to ban a user from Xbox Live.  |
  | InternalAmbassadorScoreUpdated | None | This is an internal feedback type not for use by callers.  |
  | InternalReputationReset | None | This is an internal feedback type not for use by callers.  |
  | InternalReputationUpdated | None | This is an internal feedback type not for use by callers.  |
  | PositiveHelpfulPlayer | User, Partner | Users and partners send this feedback to submit positive information about helpful fellow players from within games, forums, and so on.  |
  | PositiveHighQualityUGC | User, Partner | Users and partners send this feedback to indicate that titles should allow users to submit positive feedback on shared UGC from within the game, for example, tuning setups in Forza.  |
  | PositiveSkilledPlayer | User, Partner | Users and partners send this feedback to indicate that titles can allow users to vote on an MVP at the end of an MPSD session.  |
  | UserContentGamerpic | User | Users send this feedback to report an inappropriate gamer picture directly from the gamer card.  |
  | UserContentGamertag | User | Users send this feedback to report an inappropriate gamer tag directly from the gamer card.  |
  | UserContentInappropriateUGC | User, Partner | Users and partners send this feedback to indicate that titles should allow users to flag inappropriate shared UGC from within the game, for example, paint jobs in Forza.  |
  | UserContentPersonalInfo | User | Users send this feedback to report a biography and other personal information directly from the gamer card.  |

<a id="ID4EFEAC"></a>


## Sample JSON syntax


```json
{
"sessionRef": {
  "scid": "372D829B-FA8E-471F-B696-07B61F09EC20",
  "templateName": "CaptureFlag5",
  "name": "Halo556932",
  },
  "feedbackType": "CommsAbusiveVoice",
  "textReason": "He called me a doodoo-head!",
  "voiceReasonId": null,
  "evidenceId": null
}

```


<a id="ID4EOEAC"></a>


## See also

<a id="ID4EQEAC"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)