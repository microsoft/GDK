---
author: joannaleecy
title: XblMultiplayerAddSubscriptionLostHandler
description: Registers an event handler for notifications when a multiplayer subscription is lost. Use the returned XblFunctionContext to unregister the handler.
kindex: XblMultiplayerAddSubscriptionLostHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerAddSubscriptionLostHandler  

Registers an event handler for notifications when a multiplayer subscription is lost. Use the returned XblFunctionContext to unregister the handler.  

## Syntax  
  
```cpp
XblFunctionContext XblMultiplayerAddSubscriptionLostHandler(  
         XblContextHandle xblContext,  
         XblMultiplayerSessionSubscriptionLostHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblMultiplayerSessionSubscriptionLostHandler*  
  
The callback function that receives notifications.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context to be passed the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
The function context token that was registered for the event.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  