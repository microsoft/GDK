---
author: joannaleecy
title: XblAchievementsGetAchievementResult
description: Get the result handle from an XblAchievementsGetAchievementAsync call.
kindex: XblAchievementsGetAchievementResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsGetAchievementResult  

Get the result handle from an XblAchievementsGetAchievementAsync call.  

## Syntax  
  
```cpp
HRESULT XblAchievementsGetAchievementResult(  
         XAsyncBlock* async,  
         XblAchievementsResultHandle* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that passed to XblAchievementsGetAchievementAsync.  
  
*result* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievementsResultHandle*](../handles/xblachievementsresulthandle.md)  
  
The achievement result handle. This handle is used by other APIs to get the achievement objects and to get the next page of achievements from the service if there is one. The handle must be closed using [XblAchievementsResultCloseHandle](xblachievementsresultclosehandle.md) when the result is no longer needed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  