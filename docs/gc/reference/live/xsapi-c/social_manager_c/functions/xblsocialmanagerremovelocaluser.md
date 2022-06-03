---
author: joannaleecy
title: XblSocialManagerRemoveLocalUser
description: Immediately removes a social graph for the specified local user.
kindex: XblSocialManagerRemoveLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerRemoveLocalUser  

Immediately removes a social graph for the specified local user.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerRemoveLocalUser(  
         XblUserHandle user  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User to remove.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
When a user is removed, their social graph and user groups will be destroyed as well. There will be no future events associated with the user after they are removed. Call this API only if [XblSocialManagerAddLocalUser](xblsocialmanageraddlocaluser.md) was used to create a social graph for a local user.
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  