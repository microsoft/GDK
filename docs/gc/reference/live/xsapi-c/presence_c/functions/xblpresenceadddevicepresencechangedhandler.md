---
author: joannaleecy
title: XblPresenceAddDevicePresenceChangedHandler
description: Registers an event handler for device presence change notifications. Notifications will only be received for the Users configured with [XblPresenceTrackUsers](xblpresencetrackusers.md).
kindex: XblPresenceAddDevicePresenceChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceAddDevicePresenceChangedHandler  

Registers an event handler for device presence change notifications. Notifications will only be received for the Users configured with [XblPresenceTrackUsers](xblpresencetrackusers.md).  

## Syntax  
  
```cpp
XblFunctionContext XblPresenceAddDevicePresenceChangedHandler(  
         XblContextHandle xblContextHandle,  
         XblPresenceDevicePresenceChangedHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblPresenceDevicePresenceChangedHandler*  
  
The callback function that receives notifications.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
An XblFunctionContext object that can be used to unregister the event handler.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  