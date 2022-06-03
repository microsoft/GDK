---
author: joannaleecy
title: XblAchievementsResultHasNext
description: Checks if there are more pages of achievements to retrieve from the service.
kindex: XblAchievementsResultHasNext
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsResultHasNext  

Checks if there are more pages of achievements to retrieve from the service.  

## Syntax  
  
```cpp
HRESULT XblAchievementsResultHasNext(  
         XblAchievementsResultHandle resultHandle,  
         bool* hasNext  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsResultHandle](../handles/xblachievementsresulthandle.md)  
  
Achievement result handle.  
  
*hasNext* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Passes back true if there are more results to retrieve, false otherwise.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  