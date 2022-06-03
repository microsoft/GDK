---
author: joannaleecy
title: XblAchievementUnlockHandler
description: Handle for Function handling achievement unlock events.
kindex: XblAchievementUnlockHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementUnlockHandler  

Handle for Function handling achievement unlock events.  

## Syntax  
  
```cpp
void XblAchievementUnlockHandler(  
         const XblAchievementUnlockEvent* args,  
         void* context  
)  
```  
  
### Parameters  
  
*args* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementUnlockEvent*](../structs/xblachievementunlockevent.md)  
  
An achievement unlock event.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context to be passed the handler.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
The lifetime of the XblAchievementUnlockEvent object is limited to the callback.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  