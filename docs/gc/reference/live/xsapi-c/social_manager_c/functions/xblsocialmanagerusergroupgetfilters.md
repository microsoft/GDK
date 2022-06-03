---
author: joannaleecy
title: XblSocialManagerUserGroupGetFilters
description: Gets the filters for a filter group.
kindex: XblSocialManagerUserGroupGetFilters
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUserGroupGetFilters  

Gets the filters for a filter group.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUserGroupGetFilters(  
         XblSocialManagerUserGroupHandle group,  
         XblPresenceFilter* presenceFilter,  
         XblRelationshipFilter* relationshipFilter  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The group handle.  
  
*presenceFilter* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblPresenceFilter*](../enums/xblpresencefilter.md)  
  
Passes back the presence filter.  
  
*relationshipFilter* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblRelationshipFilter*](../enums/xblrelationshipfilter.md)  
  
Passes back the relationship filter.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
If the group is not a filter group, E_UNEXPECTED will be returned. Call this API after either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).<br />
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  