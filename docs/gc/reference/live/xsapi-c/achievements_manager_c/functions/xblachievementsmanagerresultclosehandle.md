---
author: joannaleecy
title: XblAchievementsManagerResultCloseHandle
description: Closes the XblAchievementsManagerResultHandle.
kindex: XblAchievementsManagerResultCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerResultCloseHandle  

Closes the XblAchievementsManagerResultHandle.  

## Syntax  
  
```cpp
void XblAchievementsManagerResultCloseHandle(  
         XblAchievementsManagerResultHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsManagerResultHandle](../handles/xblachievementsmanagerresulthandle.md)  
  
The XblAchievementsManagerResultHandle to close.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When all outstanding handles have been closed, the memory associated with the achievement result will be freed.
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  