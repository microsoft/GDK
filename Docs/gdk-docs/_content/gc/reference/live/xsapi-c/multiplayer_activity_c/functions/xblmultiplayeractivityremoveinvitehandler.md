---
author: joannaleecy
title: XblMultiplayerActivityRemoveInviteHandler
description: Unregisters an event handler for multiplayer activity invites.
kindex: XblMultiplayerActivityRemoveInviteHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityRemoveInviteHandler  

Unregisters an event handler for multiplayer activity invites.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivityRemoveInviteHandler(  
         XblContextHandle xblContextHandle,  
         XblFunctionContext token  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
The `XblFunctionContext` object that was returned when the event handler was registered.  
  
  
### Return value  
Type: HRESULT
  

  
## Remarks  
  
To register an event handler for multiplayer activity invites, call the [XblMultiplayerActivityAddInviteHandler](xblmultiplayeractivityaddinvitehandler.md) function. <br /><br /> For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  