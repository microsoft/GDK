---
author: joannaleecy
title: XblSocialManagerDestroySocialUserGroup
description: Destroys a created Social User Group.
kindex: XblSocialManagerDestroySocialUserGroup
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerDestroySocialUserGroup  

Destroys a created Social User Group.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerDestroySocialUserGroup(  
         XblSocialManagerUserGroupHandle group  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The Social User Group to destroy and stop tracking.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This will stop updaing the Xbox Social User Group and remove tracking for any users the XblSocialManagerUserGroup holds. Call this API after calling either [XblSocialManagerCreateSocialUserGroupFromFilters](xblsocialmanagercreatesocialusergroupfromfilters.md) or [XblSocialManagerCreateSocialUserGroupFromList](xblsocialmanagercreatesocialusergroupfromlist.md) to create an XblSocialManagerUserGroup. Have the XblSocialManagerUserGroupHandle returned by the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::SocialUserGroupLoaded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  