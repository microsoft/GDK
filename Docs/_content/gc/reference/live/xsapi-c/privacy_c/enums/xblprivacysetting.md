---
author: joannaleecy
title: XblPrivacySetting
description: All of the things protected by the Privacy Engine.
kindex: XblPrivacySetting
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPrivacySetting  

All of the things protected by the Privacy Engine.    

## Syntax  
  
```cpp
enum class XblPrivacySetting  : uint32_t  
{  
    Unknown = 0,  
    ShareFriendList = 1,  
    ShareGameHistory = 2,  
    CommunicateUsingTextAndVoice = 3,  
    SharePresence = 4,  
    ShareProfile = 5,  
    ShareVideoAndMusicStatus = 6,  
    CommunicateUsingVideo = 7,  
    CollectVoiceData = 8,  
    ShareXboxMusicActivity = 9,  
    ShareExerciseInfo = 11,  
    ShareIdentity = 12,  
    ShareIdentityInGame = 13,  
    ShareRecordedGameSessions = 14,  
    CollectLiveTvData = 15,  
    CollectXboxVideoData = 16,  
    ShareIdentityTransitively = 17,  
    ShareVideoHistory = 18,  
    ShareMusicHistory = 19,  
    AllowUserCreatedContentViewing = 20,  
    AllowProfileViewing = 21,  
    ShowRealTimeActivity = 22,  
    CollectVoiceDataXboxOneFull = 23,  
    CanShareIdentity = 24,  
    ShareContentToExternalNetworks = 25,  
    CollectVoiceSearchData = 26,  
    ShareClubMembership = 27,  
    CollectVoiceGameChatData = 28,  
    ShareActivityFeed = 29,  
    CommunicateDuringCrossNetworkPlay = 30,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unrecognized privacy setting (not one of the below values). |  
| ShareFriendList | List of friends. |  
| ShareGameHistory | Played game history. |  
| CommunicateUsingTextAndVoice | Messaging and Voice chat. |  
| SharePresence | Online status. |  
| ShareProfile | User Profile. |  
| ShareVideoAndMusicStatus | Video and Music Status. |  
| CommunicateUsingVideo | Video Communication. |  
| CollectVoiceData | Voice Data Collection. |  
| ShareXboxMusicActivity | Share Xbox Music Activity. |  
| ShareExerciseInfo | Fitness Data. |  
| ShareIdentity | Share identity - Real Name, aka MSA Name. |  
| ShareIdentityInGame | Real Identity Data for in game use. |  
| ShareRecordedGameSessions | Game DVR. |  
| CollectLiveTvData | Allow Microsoft to collect data about Live TV watching. |  
| CollectXboxVideoData | Allow Microsoft to collect data about Xbox Video watching. |  
| ShareIdentityTransitively | Allow other users to view real identity via "transitive real name". |  
| ShareVideoHistory | Allow other users to view the owner's video viewing history. |  
| ShareMusicHistory | Allow other users to view the owner's music history. |  
| AllowUserCreatedContentViewing | Allow the user to view user created content of other users. This is a parental control on the owner, not a privacy setting that affects other users. |  
| AllowProfileViewing | Allow the user to view the profiles of other users. This is a parental control on the owner, not a privacy setting that affects other users. |  
| ShowRealTimeActivity | Sometimes called the 'Cloaked' bit. |  
| CollectVoiceDataXboxOneFull | Allow full voice data (identifiable to user) to be collected on Xbox One. |  
| CanShareIdentity | Enforcement setting to prevent a user from sharing identity. |  
| ShareContentToExternalNetworks | Allow other users to share owner's Xbox LIVE content to external social networks. |  
| CollectVoiceSearchData | Allow voice search data to be collected on Xbox One. |  
| ShareClubMembership | Allow other users to see the public clubs that the user has joined. |  
| CollectVoiceGameChatData | Allow voice data collection from game chats. |  
| ShareActivityFeed | Allow other users to view items posted by the owner on their activity feed. |  
| CommunicateDuringCrossNetworkPlay | Augments the existing communications settings to allow communications with user on platforms other than Xbox Live. |  
  
## Member of
  
[XblPermissionDenyReasonDetails](../structs/xblpermissiondenyreasondetails.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  