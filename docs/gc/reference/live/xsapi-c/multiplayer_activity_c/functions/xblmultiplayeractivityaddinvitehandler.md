---
author: joannaleecy
title: XblMultiplayerActivityAddInviteHandler
description: Registers an event handler for multiplayer activity invites.
kindex: XblMultiplayerActivityAddInviteHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityAddInviteHandler  

Registers an event handler for multiplayer activity invites.  

## Syntax  
  
```cpp
XblFunctionContext XblMultiplayerActivityAddInviteHandler(  
         XblContextHandle xblContextHandle,  
         XblMultiplayerActivityInviteHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblMultiplayerActivityInviteHandler*  
  
The callback function that receives notifications.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context to be passed to the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
An `XblFunctionContext` object that can be used to unregister the event handler.
  
## Remarks  
  
To unregister an event handler for multiplayer activity invites, call the [XblMultiplayerActivityRemoveInviteHandler](xblmultiplayeractivityremoveinvitehandler.md) function. <br /><br /> For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  