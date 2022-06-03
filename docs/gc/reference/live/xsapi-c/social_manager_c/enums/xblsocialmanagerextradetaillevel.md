---
author: joannaleecy
title: XblSocialManagerExtraDetailLevel
description: Controls how much information is exposed in each xbox_live_social_graph_user. Detail level can only be set on construction of social_manager.
kindex: XblSocialManagerExtraDetailLevel
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialManagerExtraDetailLevel  

Controls how much information is exposed in each xbox_live_social_graph_user. Detail level can only be set on construction of social_manager.    

## Syntax  
  
```cpp
enum class XblSocialManagerExtraDetailLevel  : uint32_t  
{  
    NoExtraDetail,  
    TitleHistoryLevel = 0x1,  
    PreferredColorLevel = 0x2,  
    All = 0x3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoExtraDetail | Only get default PeopleHub information (presence, profile). |  
| TitleHistoryLevel | Add extra detail for the title history for the users. |  
| PreferredColorLevel | Add extra detail for the preferred color for the users. |  
| All | Add all extra detail. |  
  
## Argument of
  
[XblSocialManagerAddLocalUser](../functions/xblsocialmanageraddlocaluser.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  