---
author: joannaleecy
title: XblAchievementsResultGetAchievements
description: Get a list of XblAchievement objects.
kindex: XblAchievementsResultGetAchievements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsResultGetAchievements  

Get a list of XblAchievement objects.  

## Syntax  
  
```cpp
HRESULT XblAchievementsResultGetAchievements(  
         XblAchievementsResultHandle resultHandle,  
         const XblAchievement** achievements,  
         size_t* achievementsCount  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsResultHandle](../handles/xblachievementsresulthandle.md)  
  
Achievement result handle.  
  
*achievements* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievement**](../structs/xblachievement.md)  
  
Pointer to an array of XblAchievement objects. The memory for the returned pointer will remain valid for the life of the XblAchievementsResultHandle object until it is closed.  
  
*achievementsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The count of objects in the returned array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The returned array of XblAchievement objects is freed when all outstanding handles to the object have been closed with [XblAchievementsResultCloseHandle](xblachievementsresultclosehandle.md).
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  