---
author: joannaleecy
title: XblPresenceAddTitlePresenceChangedHandler
description: Registers an event handler for title presence change notifications. Notifications will only be received for the Users and Titles configured with [XblPresenceTrackUsers](xblpresencetrackusers.md) and [XblPresenceTrackAdditionalTitles](xblpresencetrackadditionaltitles.md) respectively.
kindex: XblPresenceAddTitlePresenceChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceAddTitlePresenceChangedHandler  

Registers an event handler for title presence change notifications. Notifications will only be received for the Users and Titles configured with [XblPresenceTrackUsers](xblpresencetrackusers.md) and [XblPresenceTrackAdditionalTitles](xblpresencetrackadditionaltitles.md) respectively.  

## Syntax  
  
```cpp
XblFunctionContext XblPresenceAddTitlePresenceChangedHandler(  
         XblContextHandle xblContextHandle,  
         XblPresenceTitlePresenceChangedHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblPresenceTitlePresenceChangedHandler*  
  
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
  
  