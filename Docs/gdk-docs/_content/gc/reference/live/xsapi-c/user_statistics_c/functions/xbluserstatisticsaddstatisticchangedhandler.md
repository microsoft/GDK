---
author: joannaleecy
title: XblUserStatisticsAddStatisticChangedHandler
description: Registers an event handler for statistic change notifications. Event handlers receive a XblStatisticChangeEventArgs object.
kindex: XblUserStatisticsAddStatisticChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsAddStatisticChangedHandler  

Registers an event handler for statistic change notifications. Event handlers receive a XblStatisticChangeEventArgs object.  

## Syntax  
  
```cpp
XblFunctionContext XblUserStatisticsAddStatisticChangedHandler(  
         XblContextHandle xblContextHandle,  
         XblStatisticChangedHandler handler,  
         void* handlerContext  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblStatisticChangedHandler  
  
The callback function that receives notifications.  
  
*handlerContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context pointer to be passed back to the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
A XblFunctionContext object that can be used to unregister the event handler.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  