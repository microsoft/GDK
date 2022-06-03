---
author: joannaleecy
title: XblAchievementsRemoveAchievementProgressChangeHandler
description: Removes an event handler for achievement progress change notifications.
kindex: XblAchievementsRemoveAchievementProgressChangeHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsRemoveAchievementProgressChangeHandler  

Removes an event handler for achievement progress change notifications.  

## Syntax  
  
```cpp
HRESULT XblAchievementsRemoveAchievementProgressChangeHandler(  
         XblContextHandle xblContextHandle,  
         XblFunctionContext functionContext  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*functionContext* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
XblFunctionContext for the handler to remove.  
  
  
### Return value  
Type: HRESULT
  

  
## Remarks  
  
<prereq /> Call this API only if [XblAchievementsAddAchievementProgressChangeHandler](xblachievementsaddachievementprogresschangehandler.md) was used to register an event handler.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  