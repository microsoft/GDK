---
author: joannaleecy
title: XblSocialManagerUpdateSocialUserGroup
description: Updates specified social user group to new group of users.
kindex: XblSocialManagerUpdateSocialUserGroup
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUpdateSocialUserGroup  

Updates specified social user group to new group of users.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUpdateSocialUserGroup(  
         XblSocialManagerUserGroupHandle group,  
         uint64_t* users,  
         size_t usersCount  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The xbox social user group to update.  
  
*users* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
New list of users to track. Note that this replaces the existing list of tracked users. The list cannot exceed XBL_SOCIAL_MANAGER_MAX_USERS_FROM_LIST.  
  
*usersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of items in the users array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Does a diff to see which users have been added or removed. The result of a user group being updated will be triggered through the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupUpdated event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md). Call this API after calling either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  