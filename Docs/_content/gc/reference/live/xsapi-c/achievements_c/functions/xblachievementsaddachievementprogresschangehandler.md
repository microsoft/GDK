---
author: joannaleecy
title: XblAchievementsAddAchievementProgressChangeHandler
description: Registers an event handler for achievement progress change notifications.
kindex: XblAchievementsAddAchievementProgressChangeHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsAddAchievementProgressChangeHandler  

Registers an event handler for achievement progress change notifications.  

## Syntax  
  
```cpp
XblFunctionContext XblAchievementsAddAchievementProgressChangeHandler(  
         XblContextHandle xblContextHandle,  
         XblAchievementsProgressChangeHandler handler,  
         void* handlerContext  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblAchievementsProgressChangeHandler  
  
The callback function that receives notifications.  
  
*handlerContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context pointer to be passed back to the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
A XblFunctionContext used to remove the handler.
  
## Remarks  
  
Call [XblAchievementsRemoveAchievementProgressChangeHandler](xblachievementsremoveachievementprogresschangehandler.md) to un-register event handler.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  