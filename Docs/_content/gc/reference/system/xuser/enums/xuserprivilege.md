---
author: M-Stahl
title: XUserPrivilege
description: Specifies the privileges of a user.
kindex: XUserPrivilege
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserPrivilege  

Specifies the privileges of a user.  

## Syntax  
  
```cpp
enum class XUserPrivilege  : uint32_t  
{  
    CrossPlay = 185,  
    Clubs = 188,  
    Sessions = 189,  
    Broadcast = 190,  
    ManageProfilePrivacy = 196,  
    GameDvr = 198,  
    MultiplayerParties = 203,  
    CloudManageSession = 207,  
    CloudJoinSession = 208,  
    CloudSavedGames = 209,  
    SocialNetworkSharing = 220,  
    UserGeneratedContent = 247,  
    Communications = 252,  
    Multiplayer = 254,  
    AddFriends = 255,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CrossPlay | The user can play with people outside of Xbox. |  
| Clubs | Create, join, and participate in clubs. |  
| Sessions | Create and join non-interactive multiplayer sessions. |  
| Broadcast | Broadcast live gameplay. |  
| ManageProfilePrivacy | Change settings to show real name. |  
| GameDvr | Upload GameDVR. |  
| MultiplayerParties | Join parties. |  
| CloudManageSession | Allocate cloud compute resources for their session. |  
| CloudJoinSession | Join cloud compute sessions. |  
| CloudSavedGames | Save games on the cloud. |  
| SocialNetworkSharing | Share progress to social networks. |  
| UserGeneratedContent | Access user generated content in game. |  
| Communications | Use real time voice and text communication. |  
| Multiplayer | Join multiplayer sessions. |  
| AddFriends | Add friends. |  
  
## Remarks

To asynchronously see if a user has a specific privilege, call the [XUserCheckPrivilege](../functions/xusercheckprivilege.md) function.
To display a resolution UI for required user privileges, call the [XUserResolvePrivilegeWithUiAsync](../functions/xuserresolveprivilegewithuiasync.md) function.
Both functions use an XUserPrivilege enumeration as an argument.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserCheckPrivilege](../functions/xusercheckprivilege.md)

[XUserResolvePrivilegeWithUiAsync](../functions/xuserresolveprivilegewithuiasync.md)