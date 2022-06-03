---
author: joannaleecy
title: XblPresenceTrackUsers
description: Configures the list of users for whom real-time device and title presence updates will be tracked.
kindex: XblPresenceTrackUsers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceTrackUsers  

Configures the list of users for whom real-time device and title presence updates will be tracked.  

## Syntax  
  
```cpp
HRESULT XblPresenceTrackUsers(  
         XblContextHandle xblContextHandle,  
         const uint64_t* xuids,  
         size_t xuidsCount  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xuids* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
Array of XboxUserIDs to append to the existing list of tracked Users.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Length of xuids array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Updates will be delivered via XblPresenceDevicePresenceChangedHandlers and XblPresenceTitlePresenceChangedHandlers. Note that the set of tracked users can be updated independent from the handlers.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  