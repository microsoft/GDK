---
author: joannaleecy
title: XblAchievementsResultCloseHandle
description: Closes the XblAchievementsResultHandle.
kindex: XblAchievementsResultCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsResultCloseHandle  

Closes the XblAchievementsResultHandle.  

## Syntax  
  
```cpp
void XblAchievementsResultCloseHandle(  
         XblAchievementsResultHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsResultHandle](../handles/xblachievementsresulthandle.md)  
  
The XblAchievementsResultHandle to close.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When all outstanding handles have been closed, the memory associated with the achievement result will be freed.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  