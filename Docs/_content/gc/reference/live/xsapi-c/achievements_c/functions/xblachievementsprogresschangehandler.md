---
author: joannaleecy
title: XblAchievementsProgressChangeHandler
description: A callback invoked when a progress is made on an achievement.
kindex: XblAchievementsProgressChangeHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementsProgressChangeHandler  

A callback invoked when a progress is made on an achievement.  

## Syntax  
  
```cpp
void XblAchievementsProgressChangeHandler(  
         const XblAchievementProgressChangeEventArgs* eventArgs,  
         void* context  
)  
```  
  
### Parameters  
  
*eventArgs* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementProgressChangeEventArgs*](../structs/xblachievementprogresschangeeventargs.md)  
  
The arguments associated with the change in achievement state. The fields of the struct are only valid during the callback.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Context provided by when the handler is added.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
For the callback to work properly, you must be subscribed to achievement progress changes for at least one user.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  