---
author: joannaleecy
title: XblMultiplayerRemoveConnectionIdChangedHandler
description: Unregisters an event handler for multiplayer connection id changed notifications.
kindex: XblMultiplayerRemoveConnectionIdChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerRemoveConnectionIdChangedHandler  

Unregisters an event handler for multiplayer connection id changed notifications.  

## Syntax  
  
```cpp
void XblMultiplayerRemoveConnectionIdChangedHandler(  
         XblContextHandle xblContext,  
         XblFunctionContext token  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
The XblFunctionContext object that was returned when the event handler was registered.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  