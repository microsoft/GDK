---
author: joannaleecy
title: XblAchievementsManagerDoWork
description: Called whenever the title wants to update the state of achievements and get list of change events.
kindex: XblAchievementsManagerDoWork
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementsManagerDoWork  

Called whenever the title wants to update the state of achievements and get list of change events.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerDoWork(  
         const XblAchievementsManagerEvent** achievementsEvents,  
         size_t* achievementsEventsCount  
)  
```  
  
### Parameters  
  
*achievementsEvents* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblAchievementsManagerEvent**](../structs/xblachievementsmanagerevent.md)  
  
Passes back a pointer to the array of achievement events that have occurred since the last call to XblAchievementsManagerDoWork.  
  
*achievementsEventsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of events in the achievement events array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Must be called every frame for data to be up to date. The array of achievement events that is sent back is only valid until the next call to [XblAchievementsManagerDoWork](xblachievementsmanagerdowork.md). Make sure to check if there were achievement events sent back. If the achievement events array is null, no results. If the achievement events count is 0, no results. If there were achievement events sent back then handle each [XblAchievementsManagerEvent](../structs/xblachievementsmanagerevent.md) by their respective [XblAchievementsManagerEventType](../enums/xblachievementsmanagereventtype.md).
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  