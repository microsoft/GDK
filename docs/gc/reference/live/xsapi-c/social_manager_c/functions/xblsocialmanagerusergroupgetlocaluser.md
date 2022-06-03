---
author: joannaleecy
title: XblSocialManagerUserGroupGetLocalUser
description: Gets local user the group is associated with.
kindex: XblSocialManagerUserGroupGetLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUserGroupGetLocalUser  

Gets local user the group is associated with.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUserGroupGetLocalUser(  
         XblSocialManagerUserGroupHandle group,  
         XblUserHandle* localUser  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The group handle.  
  
*localUser* &nbsp;&nbsp;\_Out\_  
Type: XblUserHandle*  
  
Passes back the local user handle. This user handle does not need to be closed. It remains valid for as long as the user is added to the social manager.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this API after calling either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  