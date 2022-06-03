---
author: joannaleecy
title: XblReputationFeedbackType
description: Defines values used to identify the type of reputation feedback.
kindex: XblReputationFeedbackType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblReputationFeedbackType  

Defines values used to identify the type of reputation feedback.    

## Syntax  
  
```cpp
enum class XblReputationFeedbackType  : uint32_t  
{  
    FairPlayKillsTeammates,  
    FairPlayCheater,  
    FairPlayTampering,  
    FairPlayQuitter,  
    FairPlayKicked,  
    CommunicationsInappropriateVideo,  
    CommunicationsAbusiveVoice,  
    InappropriateUserGeneratedContent,  
    PositiveSkilledPlayer,  
    PositiveHelpfulPlayer,  
    PositiveHighQualityUserGeneratedContent,  
    CommsPhishing,  
    CommsPictureMessage,  
    CommsSpam,  
    CommsTextMessage,  
    CommsVoiceMessage,  
    FairPlayConsoleBanRequest,  
    FairPlayIdler,  
    FairPlayUserBanRequest,  
    UserContentGamerpic,  
    UserContentPersonalInfo,  
    FairPlayUnsporting,  
    FairPlayLeaderboardCheater  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| FairPlayKillsTeammates | Titles that are able to automatically determine that a user kills a teammate may send this feedback without user intervention. |  
| FairPlayCheater | Titles that are able to automatically determine that a user is cheating may send this feedback without user intervention. |  
| FairPlayTampering | Titles that are able to automatically determine that a user has tampered with on-disk content may send this feedback without user intervention. |  
| FairPlayQuitter | Titles that are able to automatically determine that a user quit a game early may send this feedback without user intervention. |  
| FairPlayKicked | When a user is voted out of a game (kicked), titles may send this feedback without user intervention. |  
| CommunicationsInappropriateVideo | Titles that allow users to report inappropriate video communications may send this feedback. |  
| CommunicationsAbusiveVoice | Titles that allow users to report inappropriate voice communications may send this feedback. |  
| InappropriateUserGeneratedContent | Titles that allow users to report inappropriate user generated content may send this feedback. |  
| PositiveSkilledPlayer | Titles that allow users to vote on a most valuable player at the end of a multiplayer session may send this feedback. |  
| PositiveHelpfulPlayer | Titles that allow users to submit positive feedback on helpful fellow players may send this feedback. |  
| PositiveHighQualityUserGeneratedContent | Titles that allow users to submit positive feedback on shared user generated content may send this feedback. |  
| CommsPhishing | Titles that allow users to report phishing message may send this feedback. |  
| CommsPictureMessage | Titles that allow users to report communication based on a picture may send this feedback. |  
| CommsSpam | Titles that allow users to report spam messages may send this feedback. |  
| CommsTextMessage | Titles that allow users to report text messages may send this feedback. |  
| CommsVoiceMessage | Titles that allow users to report voice messages may send this feedback. |  
| FairPlayConsoleBanRequest | Titles that allow users to report voice messages may send this feedback. |  
| FairPlayIdler | Titles that allow users to report if a user stands idle on purpose in a game, usually round after round, may send this feedback. |  
| FairPlayUserBanRequest | Titles that report a recommendation to ban a user from Xbox Live may send this feedback. |  
| UserContentGamerpic | Titles that allow users to report inappropriate gamer picture may send this feedback. |  
| UserContentPersonalInfo | Titles that allow users to report inappropriate biography and other personal information may send this feedback. |  
| FairPlayUnsporting | Titles that allow users to report unsporting behavior may send this feedback. |  
| FairPlayLeaderboardCheater | Titles that allow users to report leaderboard cheating may send this feedback. |  
  
## Member of
  
[XblReputationFeedbackItem](../structs/xblreputationfeedbackitem.md)
  
## Argument of
  
[XblSocialSubmitReputationFeedbackAsync](../functions/xblsocialsubmitreputationfeedbackasync.md)
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  