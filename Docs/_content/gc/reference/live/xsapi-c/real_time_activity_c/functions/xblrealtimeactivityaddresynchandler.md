---
author: joannaleecy
title: XblRealTimeActivityAddResyncHandler
description: Registers a handler function to receive a notification that is sent when there is a resync message from the real time activity service.
kindex: XblRealTimeActivityAddResyncHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityAddResyncHandler  

Registers a handler function to receive a notification that is sent when there is a resync message from the real time activity service.  

## Syntax  
  
```cpp
XblFunctionContext XblRealTimeActivityAddResyncHandler(  
         XblContextHandle xboxLiveContext,  
         XblRealTimeActivityResyncHandler* handler,  
         void* context  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context handle.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblRealTimeActivityResyncHandler*  
  
The callback function that receives notifications.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler function.  
  
  
### Return value  
Type: XblFunctionContext
  
A XblFunctionContext object that can be used to unregister the event handler.
  
## Remarks  
  
This message indicates that data may have been lost and to resync all data by calling corresponding REST API's. Wherever possible, XSAPI will automatically resync the subscription and invoke the corresponding handler. For multiplayer session changed subscriptions, titles must resync their own sessions.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  