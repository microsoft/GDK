---
author: joannaleecy
title: XblRealTimeActivityAddConnectionStateChangeHandler
description: Registers a handler function to receive a notification that is sent when the client service loses or gains connectivity to the real time activity service.
kindex: XblRealTimeActivityAddConnectionStateChangeHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityAddConnectionStateChangeHandler  

Registers a handler function to receive a notification that is sent when the client service loses or gains connectivity to the real time activity service.  

## Syntax  
  
```cpp
XblFunctionContext XblRealTimeActivityAddConnectionStateChangeHandler(  
         XblContextHandle xboxLiveContext,  
         XblRealTimeActivityConnectionStateChangeHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context handle.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblRealTimeActivityConnectionStateChangeHandler*  
  
The callback function that receives notifications.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler function.  
  
  
### Return value  
Type: XblFunctionContext
  
An XblFunctionContext object that can be used to unregister the event handler.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  