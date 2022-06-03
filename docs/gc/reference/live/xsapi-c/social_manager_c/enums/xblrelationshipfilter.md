---
author: joannaleecy
title: XblRelationshipFilter
description: Possible relationship types to filter by.
kindex: XblRelationshipFilter
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblRelationshipFilter  

Possible relationship types to filter by.    

## Syntax  
  
```cpp
enum class XblRelationshipFilter  : uint32_t  
{  
    Unknown,  
    Friends,  
    Favorite  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown. |  
| Friends | Friends of the user (user is following). |  
| Favorite | Favorites of the user. |  
  
## Argument of
  
[XblSocialManagerUserGroupGetFilters](../functions/xblsocialmanagerusergroupgetfilters.md)  
[XblSocialManagerCreateSocialUserGroupFromFilters](../functions/xblsocialmanagercreatesocialusergroupfromfilters.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  