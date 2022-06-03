---
author: joannaleecy
title: XblSocialManagerCreateSocialUserGroupFromList
description: Constructs a social XblSocialManagerUserGroup, which is a collection of users with social information.
kindex: XblSocialManagerCreateSocialUserGroupFromList
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerCreateSocialUserGroupFromList  

Constructs a social XblSocialManagerUserGroup, which is a collection of users with social information.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerCreateSocialUserGroupFromList(  
         XblUserHandle user,  
         uint64_t* xboxUserIdList,  
         size_t xboxUserIdListCount,  
         XblSocialManagerUserGroupHandle* group  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User.  
  
*xboxUserIdList* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
List of users to populate the Xbox Social User Group with. The list cannot exceed XBL_SOCIAL_MANAGER_MAX_USERS_FROM_LIST.  
  
*xboxUserIdListCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of items in the xboxUserIdList.  
  
*group* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblSocialManagerUserGroupHandle*](../handles/xblsocialmanagerusergrouphandle.md)  
  
Passes back a handle to the created group. This group may later be cleaned up with XblSocialManagerDestroySocialUserGroup. The group will also be cleaned up (invalidating the returned handle) if the associated user is removed from Social Manager.  
  
  
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
  
  