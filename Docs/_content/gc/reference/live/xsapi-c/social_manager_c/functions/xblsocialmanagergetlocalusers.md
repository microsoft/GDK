---
author: joannaleecy
title: XblSocialManagerGetLocalUsers
description: Returns user handles for all users tracked by SocialManager.
kindex: XblSocialManagerGetLocalUsers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerGetLocalUsers  

Returns user handles for all users tracked by SocialManager.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerGetLocalUsers(  
         size_t usersCount,  
         XblUserHandle* users  
)  
```  
  
### Parameters  
  
*usersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the user handle array.  
  
*users* &nbsp;&nbsp;\_Out\_writes\_(usersCount)  
Type: XblUserHandle*  
  
Passes back a pointer to an array to populate with local users. This array is only valid until the next call to XblSocialManagerDoWork. The user handles returned are not duplicated copies so do not call close on them.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Duplicate handle is not called before returning the handles, so if the user is needed after removing it from SocialManager, duplicate handle must be called. Make sure to have created a social graph for at least one local user by calling [XblSocialManagerAddLocalUser](xblsocialmanageraddlocaluser.md). Also, call [XblSocialManagerGetLocalUserCount](xblsocialmanagergetlocalusercount.md) to get the number of local users currently tracked.
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  