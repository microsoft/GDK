---
author: joannaleecy
title: XblPresenceRemoveTitlePresenceChangedHandler
description: Unregisters an event handler for title presence change notifications.
kindex: XblPresenceRemoveTitlePresenceChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceRemoveTitlePresenceChangedHandler  

Unregisters an event handler for title presence change notifications.  

## Syntax  
  
```cpp
HRESULT XblPresenceRemoveTitlePresenceChangedHandler(  
         XblContextHandle xblContextHandle,  
         XblFunctionContext token  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
The XblFunctionContext object that was returned when the event handler was registered.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  