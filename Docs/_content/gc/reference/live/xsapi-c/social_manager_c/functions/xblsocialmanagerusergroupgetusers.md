---
author: joannaleecy
title: XblSocialManagerUserGroupGetUsers
description: Gets an XblSocialManagerUserPtrArray of the users tracked by the user group.
kindex: XblSocialManagerUserGroupGetUsers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUserGroupGetUsers  

Gets an XblSocialManagerUserPtrArray of the users tracked by the user group.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUserGroupGetUsers(  
         XblSocialManagerUserGroupHandle group,  
         XblSocialManagerUserPtrArray* users,  
         size_t* usersCount  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The group handle from which to get users.  
  
*users* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: XblSocialManagerUserPtrArray*  
  
Passes back a pointer to an array of XblSocialManagerUser objects. The memory for the returned pointer remains valid until the next time [XblSocialManagerDoWork](xblsocialmanagerdowork.md) is called.  
  
*usersCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size of the users array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The XblSocialManagerUserPtrArray is only guaranteed to be valid until the next call to [XblSocialManagerDoWork](xblsocialmanagerdowork.md). If the user objects are needed beyond the scope of the next [XblSocialManagerDoWork](xblsocialmanagerdowork.md) call, they are statically sized and trivially copyable. Call this API after calling either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  