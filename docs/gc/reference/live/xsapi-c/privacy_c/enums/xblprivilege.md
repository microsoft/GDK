---
author: joannaleecy
title: XblPrivilege
description: Controls user's privileges.
kindex: XblPrivilege
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPrivilege  

Controls user's privileges.    

## Syntax  
  
```cpp
enum class XblPrivilege  : uint32_t  
{  
    Unknown = 0,  
    AllowIngameVoiceCommunications = 205,  
    AllowVideoCommunications = 235,  
    AllowProfileViewing = 249,  
    AllowCommunications = 252,  
    AllowMultiplayer = 254,  
    AllowAddFriend = 255  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unrecognized privilege (not one of the below values). |  
| AllowIngameVoiceCommunications | Controls the ability of the user to view the profile (bio, motto, etc) of other users. |  
| AllowVideoCommunications | Controls the ability of the user to communicate with other users via video. |  
| AllowProfileViewing | Controls the ability of the user to view the profile (bio, motto, etc) of other users. |  
| AllowCommunications | Controls the ability of the user to communicate with other users. |  
| AllowMultiplayer | Controls the ability of the user to join parties with other users. |  
| AllowAddFriend | Controls the ability of the user to add friends. |  
  
## Member of
  
[XblPermissionDenyReasonDetails](../structs/xblpermissiondenyreasondetails.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  