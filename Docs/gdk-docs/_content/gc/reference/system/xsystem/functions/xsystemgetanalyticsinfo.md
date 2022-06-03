---
author: M-Stahl
title: XSystemGetAnalyticsInfo
description: Provides information about the device for profiling purposes.
kindex: XSystemGetAnalyticsInfo
ms.author: v-denken
ms.topic: reference
edited: 05/31/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSystemGetAnalyticsInfo  

Provides diagnostic information about the operating system and device on which the game is running.  

## Syntax  
  
```cpp
XSystemAnalyticsInfo XSystemGetAnalyticsInfo(  
)  
```  
  
### Parameters  
  
None.
  
### Return value
Type: [XSystemAnalyticsInfo](../structs/xsystemanalyticsinfo.md)
  
Returns an [XSystemAnalyticsInfo](../structs/xsystemanalyticsinfo.md) structure that contains information about the current device.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The **XSystemGetAnalyticsInfo** function returns an [XSystemAnalyticsInfo](../structs/xsystemanalyticsinfo.md) structure that contains diagnostic information about the current device. This information includes the versions of both the operating system in which the game is running and the operating system from which the game was launched, as well as the family and form of the device.  
  
The following example illustrates how to retrieve the version information for the operating system in which a game is running, by invoking **XSystemGetAnalyticsInfo** and concatenating the results returned in the *osVersion* member of **XSystemAnalyticsInfo**.  
  
```cpp
// Get the version of the operating system in which the game is running.
std::string Game::GetGameOSVersion()
{
    // Call XSystemGetAnalyticsInfo()
    XSystemAnalyticsInfo info = XSystemGetAnalyticsInfo();

    // Return a formatted string from the osVersion member of XSystemAnalyticsInfo.
    return std::to_string(info.osVersion.major) + "." +
        std::to_string(info.osVersion.minor) + "." +
        std::to_string(info.osVersion.build) + "." +
        std::to_string(info.osVersion.revision);

}
```
  
  
## Requirements  
  
**Header:** XSystem.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XSystem](../xsystem_members.md)  
[XSystemAnalyticsInfo](../structs/xsystemanalyticsinfo.md)  
  
  