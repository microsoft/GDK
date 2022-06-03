---
author: joannaleecy
title: XblAchievementsManagerResultGetAchievements
description: Get a list of XblAchievement objects.
kindex: XblAchievementsManagerResultGetAchievements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementsManagerResultGetAchievements  

Get a list of XblAchievement objects.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerResultGetAchievements(  
         XblAchievementsManagerResultHandle resultHandle,  
         const XblAchievement** achievements,  
         uint64_t* achievementsCount  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsManagerResultHandle](../handles/xblachievementsmanagerresulthandle.md)  
  
Achievement result handle.  
  
*achievements* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievement**](../../achievements_c/structs/xblachievement.md)  
  
Pointer to an array of XblAchievement objects. The memory for the returned pointer will remain valid for the life of the XblAchievementsManagerResultHandle object until it is closed.  
  
*achievementsCount* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  
  
The count of objects in the returned array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The returned array of XblAchievement objects is freed when all outstanding handles to the object have been closed with [XblAchievementsManagerResultCloseHandle](xblachievementsmanagerresultclosehandle.md). However the data might become stale.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  