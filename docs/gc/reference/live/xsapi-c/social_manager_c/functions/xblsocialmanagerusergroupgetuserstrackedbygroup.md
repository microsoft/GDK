---
author: joannaleecy
title: XblSocialManagerUserGroupGetUsersTrackedByGroup
description: Gets a pointer to an XSAPI owned array of xuids tracked by the group.
kindex: XblSocialManagerUserGroupGetUsersTrackedByGroup
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUserGroupGetUsersTrackedByGroup  

Gets a pointer to an XSAPI owned array of xuids tracked by the group.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUserGroupGetUsersTrackedByGroup(  
         XblSocialManagerUserGroupHandle group,  
         const uint64_t** trackedUsers,  
         size_t* trackedUsersCount  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The group from which to get users.  
  
*trackedUsers* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: uint64_t**  
  
Passes back a pointer to tracked xuids array. The memory for the returned pointer remains valid until the next time [XblSocialManagerDoWork](xblsocialmanagerdowork.md) is called.  
  
*trackedUsersCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size of the tracked users array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
For list-based groups, the set of tracked users is static (i.e. the list of xuids provided when the group is created), but for filter-based groups, the set tracked users changes as the local user's relationships change. Call this API after calling either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  