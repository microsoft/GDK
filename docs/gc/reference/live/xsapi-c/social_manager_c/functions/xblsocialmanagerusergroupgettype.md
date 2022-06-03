---
author: joannaleecy
title: XblSocialManagerUserGroupGetType
description: Gets the type of a Social Manager user group.
kindex: XblSocialManagerUserGroupGetType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerUserGroupGetType  

Gets the type of a Social Manager user group.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerUserGroupGetType(  
         XblSocialManagerUserGroupHandle group,  
         XblSocialUserGroupType* type  
)  
```  
  
### Parameters  
  
*group* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerUserGroupHandle](../handles/xblsocialmanagerusergrouphandle.md)  
  
The group handle.  
  
*type* &nbsp;&nbsp;\_Out\_  
Type: [XblSocialUserGroupType*](../enums/xblsocialusergrouptype.md)  
  
Passes back the group type.  
  
  
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
  
  