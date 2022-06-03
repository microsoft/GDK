---
author: joannaleecy
title: XblSocialManagerCreateSocialUserGroupFromFilters
description: Constructs a XblSocialManagerUserGroup, which is a collection of users with social information.
kindex: XblSocialManagerCreateSocialUserGroupFromFilters
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerCreateSocialUserGroupFromFilters  

Constructs a XblSocialManagerUserGroup, which is a collection of users with social information.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerCreateSocialUserGroupFromFilters(  
         XblUserHandle user,  
         XblPresenceFilter presenceFilter,  
         XblRelationshipFilter relationshipFilter,  
         XblSocialManagerUserGroupHandle* group  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User the group is associated with.  
  
*presenceFilter* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceFilter](../enums/xblpresencefilter.md)  
  
The restriction of users based on their presence and title activity.  
  
*relationshipFilter* &nbsp;&nbsp;\_In\_  
Type: [XblRelationshipFilter](../enums/xblrelationshipfilter.md)  
  
The restriction of users based on their relationship to the calling user.  
  
*group* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblSocialManagerUserGroupHandle*](../handles/xblsocialmanagerusergrouphandle.md)  
  
Passes back a handle to the created group. This group can be later be cleaned up with XblSocialManagerDestroySocialUserGroup. The group will also be cleaned up (invalidating the returned handle) if the associated user is removed from Social Manager.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The result of a user group being loaded will be triggered through the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  