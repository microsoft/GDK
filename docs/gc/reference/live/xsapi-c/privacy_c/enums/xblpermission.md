---
author: joannaleecy
title: XblPermission
description: Actions that a client can check permission for.
kindex: XblPermission
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPermission  

Actions that a client can check permission for.    

## Syntax  
  
```cpp
enum class XblPermission  : uint32_t  
{  
    Unknown = 0,  
    CommunicateUsingText = 1000,  
    CommunicateUsingVideo = 1001,  
    CommunicateUsingVoice = 1002,  
    ViewTargetProfile = 1004,  
    ViewTargetGameHistory = 1005,  
    ViewTargetVideoHistory = 1006,  
    ViewTargetMusicHistory = 1007,  
    ViewTargetExerciseInfo = 1009,  
    ViewTargetPresence = 1011,  
    ViewTargetVideoStatus = 1012,  
    ViewTargetMusicStatus = 1013,  
    PlayMultiplayer = 1014,  
    ViewTargetUserCreatedContent = 1018,  
    BroadcastWithTwitch = 1019,  
    WriteComment = 1022,  
    ShareItem = 1024,  
    ShareTargetContentToExternalNetworks = 1025,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unrecognized permission (not one of the below values). |  
| CommunicateUsingText | Check whether or not the user can send a message with text content to the target user. This value does not change if the player has muted the target user. Use CommunicateUsingVoice instead. This value will be false if for example you have set your comms to friends only and the target is not a friend. This value will be false if for example if the target user has blocked you. This value will be false if for example you have set your comms settings to Blocked. |  
| CommunicateUsingVideo | Check whether or not the user can communicate using video with the target user. |  
| CommunicateUsingVoice | Check whether or not the user can communicate using voice with the target user. This will be false if the player has muted the target user. |  
| ViewTargetProfile | Check whether or not the user can view the profile of the target user. |  
| ViewTargetGameHistory | Check whether or not the user can view the game history of the target user. |  
| ViewTargetVideoHistory | Check whether or not the user can view the detailed video watching history of the target user. |  
| ViewTargetMusicHistory | Check whether or not the user can view the detailed music listening history of the target user. |  
| ViewTargetExerciseInfo | Check whether or not the user can view the exercise info of the target user. |  
| ViewTargetPresence | Check whether or not the user can view the online status of the target user. |  
| ViewTargetVideoStatus | Check whether or not the user can view the details of the targets video status (extended online presence). |  
| ViewTargetMusicStatus | Check whether or not the user can view the details of the targets music status (extended online presence). |  
| PlayMultiplayer | Check whether or not a user can play multiplayer with the target user. |  
| ViewTargetUserCreatedContent | Check whether or not the user can view user created content produced by target user. |  
| BroadcastWithTwitch | Check whether or not the user can broadcast sessions on Twitch. |  
| WriteComment | Check whether or not the user can write a comment on an object owned by the target. |  
| ShareItem | Check whether or not the user can share an item owned by the target. |  
| ShareTargetContentToExternalNetworks | Check whether or not the user can share an item owned by the target to external social networks. |  
  
## Remarks  
  
Permission may be restricted by either a missing privilege of the caller or a privacy restriction of the target.
  
## Member of
  
[XblPermissionCheckResult](../structs/xblpermissioncheckresult.md)
  
## Argument of
  
[XblPrivacyCheckPermissionAsync](../functions/xblprivacycheckpermissionasync.md)  
[XblPrivacyCheckPermissionForAnonymousUserAsync](../functions/xblprivacycheckpermissionforanonymoususerasync.md)  
[XblPrivacyBatchCheckPermissionAsync](../functions/xblprivacybatchcheckpermissionasync.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  