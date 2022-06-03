---
author: M-Stahl
title: XSystemAnalyticsInfo
description: Represents information about the device.
kindex: XSystemAnalyticsInfo
ms.author: v-denken
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSystemAnalyticsInfo  

Represents information about the current device.  

## Syntax  
  
```cpp
typedef struct XSystemAnalyticsInfo {  
    XVersion osVersion;  
    XVersion hostingOsVersion;  
    char family[64];  
    char form[64];  
} XSystemAnalyticsInfo  
```
  
### Members  
  
*osVersion*  
Type: [XVersion](../../xgameruntimetypes/structs/xversion.md)  
  
The version of the operating system on which the game is running. For Xbox devices, this value represents the version of the title OS. For desktop devices, this value represents the version of the system OS.
  
*hostingOsVersion*  
Type: [XVersion](../../xgameruntimetypes/structs/xversion.md)  
  
The version of the operating system from which the game was launched. For Xbox devices, this value represents the version of the system OS. For desktop devices, this value is typically the same as the value of *osVersion*.  
  
*family*  
Type: char[64]  
  
The general description of the device family. Examples: "Xbox" and "Windows".  
  
*form*  
Type: char[64]  
  
The specific type of hardware in the device family. Example: "Xbox One X DevKit".  
  
## Remarks  
  
This structure is returned when [XSystemGetAnalyticsInfo](../functions/xsystemgetanalyticsinfo.md) is called. The structure provides the current device's operating system versions, device family, and device form.  
  
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
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XSystem](../xsystem_members.md)  
[XSystemGetAnalyticsInfo](../functions/xsystemgetanalyticsinfo.md)  
[XVersion](../../xgameruntimetypes/structs/xversion.md)  

  