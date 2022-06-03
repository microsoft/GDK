---
author: joannaleecy
title: XblPresenceFilter
description: The filter level of information. Title will only show users associated with a particular title.
kindex: XblPresenceFilter
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceFilter  

The filter level of information. Title will only show users associated with a particular title.    

## Syntax  
  
```cpp
enum class XblPresenceFilter  : uint32_t  
{  
    Unknown,  
    TitleOnline,  
    TitleOffline,  
    TitleOnlineOutsideTitle,  
    AllOnline,  
    AllOffline,  
    AllTitle,  
    All  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown. |  
| TitleOnline | Is currently playing current title and is online. |  
| TitleOffline | Has played this title and is offline. This filter option requires [XblSocialManagerExtraDetailLevel](xblsocialmanagerextradetaillevel.md)::TitleHistoryLevel to be set in [XblSocialManagerAddLocalUser](../functions/xblsocialmanageraddlocaluser.md) |  
| TitleOnlineOutsideTitle | Has played this title, is online but not currently playing this title. This filter option requires [XblSocialManagerExtraDetailLevel](xblsocialmanagerextradetaillevel.md)::TitleHistoryLevel to be set in [XblSocialManagerAddLocalUser](../functions/xblsocialmanageraddlocaluser.md) |  
| AllOnline | Everyone currently online. |  
| AllOffline | Everyone currently offline. |  
| AllTitle | Everyone who has played or is playing the title. This filter option requires [XblSocialManagerExtraDetailLevel](xblsocialmanagerextradetaillevel.md)::TitleHistoryLevel to be set in [XblSocialManagerAddLocalUser](../functions/xblsocialmanageraddlocaluser.md) |  
| All | Everyone. |  
  
## Argument of
  
[XblSocialManagerUserGroupGetFilters](../functions/xblsocialmanagerusergroupgetfilters.md)  
[XblSocialManagerCreateSocialUserGroupFromFilters](../functions/xblsocialmanagercreatesocialusergroupfromfilters.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  