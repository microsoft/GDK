---
author: joannaleecy
title: XblSocialManagerAddLocalUser
description: Create a social graph for the specified local user.
kindex: XblSocialManagerAddLocalUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerAddLocalUser  

Create a social graph for the specified local user.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerAddLocalUser(  
         XblUserHandle user,  
         XblSocialManagerExtraDetailLevel extraLevelDetail,  
         XTaskQueueHandle queue  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User to create a graph for.  
  
*extraLevelDetail* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerExtraDetailLevel](../enums/xblsocialmanagerextradetaillevel.md)  
  
The level of verbosity that should be in the service calls for this user.  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  
  
Queue to be used for background operation for this user (Optional). Note: Using XTaskQueueDispatchMode::Immediate for this queue may cause poor performance.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The result of a local user being added will be triggered through the [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)::LocalUserAdded event in [XblSocialManagerDoWork](xblsocialmanagerdowork.md). To remove the social graph for the specified local user, call [XblSocialManagerRemoveLocalUser](xblsocialmanagerremovelocaluser.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  