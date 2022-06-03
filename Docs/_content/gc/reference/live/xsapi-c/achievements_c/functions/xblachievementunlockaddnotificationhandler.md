---
author: joannaleecy
title: XblAchievementUnlockAddNotificationHandler
description: Registers an event handler for achievement unlock notifications.
kindex: XblAchievementUnlockAddNotificationHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementUnlockAddNotificationHandler  

Registers an event handler for achievement unlock notifications.  

## Syntax  
  
```cpp
XblFunctionContext XblAchievementUnlockAddNotificationHandler(  
         XblContextHandle xblContextHandle,  
         XblAchievementUnlockHandler* handler,  
         void* handlerContext  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblAchievementUnlockHandler*  
  
The callback function that receives notifications.  
  
*handlerContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context to be passed the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
An XblFunctionContext object that can be used to unregister the event handler.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  