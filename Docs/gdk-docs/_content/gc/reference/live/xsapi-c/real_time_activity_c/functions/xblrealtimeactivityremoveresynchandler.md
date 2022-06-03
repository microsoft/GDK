---
author: joannaleecy
title: XblRealTimeActivityRemoveResyncHandler
description: Unregisters an event handler for real time activity resync notifications.
kindex: XblRealTimeActivityRemoveResyncHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityRemoveResyncHandler  

Unregisters an event handler for real time activity resync notifications.  

## Syntax  
  
```cpp
HRESULT XblRealTimeActivityRemoveResyncHandler(  
         XblContextHandle xboxLiveContext,  
         XblFunctionContext token  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context handle.  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
The XblFunctionContext object that was returned when the event handler was registered.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  