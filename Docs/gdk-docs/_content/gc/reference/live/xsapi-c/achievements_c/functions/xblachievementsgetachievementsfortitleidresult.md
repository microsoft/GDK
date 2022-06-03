---
author: joannaleecy
title: XblAchievementsGetAchievementsForTitleIdResult
description: Get XblAchievementsResultHandle from an XblAchievementsGetAchievementsForTitleIdAsync call.
kindex: XblAchievementsGetAchievementsForTitleIdResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsGetAchievementsForTitleIdResult  

Get XblAchievementsResultHandle from an XblAchievementsGetAchievementsForTitleIdAsync call.  

## Syntax  
  
```cpp
HRESULT XblAchievementsGetAchievementsForTitleIdResult(  
         XAsyncBlock* async,  
         XblAchievementsResultHandle* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that passed to XblAchievementsGetAchievementsForTitleIdAsync.  
  
*result* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievementsResultHandle*](../handles/xblachievementsresulthandle.md)  
  
Achievement result handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Use [XblAchievementsResultGetAchievements](xblachievementsresultgetachievements.md) to get the list.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  