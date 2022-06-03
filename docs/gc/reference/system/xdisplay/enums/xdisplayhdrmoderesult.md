---
author: M-Stahl
title: XDisplayHdrModeResult
description: Specifies the current state of HDR (high dynamic range) support on the attached display.
kindex: XDisplayHdrModeResult
ms.author: v-denken
ms.topic: reference
edited: 05/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XDisplayHdrModeResult  

Specifies the current state of HDR (high dynamic range) support on the attached display.  

## Syntax  
  
```cpp
enum class XDisplayHdrModeResult  : uint32_t  
{  
    Unknown = 0,  
    Enabled = 1,  
    Disabled = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | An error occurred, and the current state of HDR support is unknown. |  
| Enabled | HDR mode is enabled. |  
| Disabled | HDR mode is disabled. |  

## Remarks

The [XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md) function returns an **XDisplayHdrModeResult** enumeration value that indicates whether the function can enable HDR mode for the attached display. If **XDisplayHdrModeResult::Enabled** is returned, the function also provides an [XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md) structure that contains the minimum and maximum tone map luminance values for HDR mode.

The following example attempts to enable HDR mode for the attached display. If **XDisplayHdrModeInfo::Enabled** is returned, then HDR mode is enabled for the display and the game uses the luminance values from the returned [XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md) structure to initialize in HDR mode; otherwise, HDR mode is either unavailable or disabled, and the game initializes in SDR (standard dynamic range) mode. 

```cpp
void Game::InitializeHDRMode() 
{
    // Attempt to enable HDR mode, then initialize based on the 
    // result of the attempt.
    XDisplayHdrModeInfo displayModeHdrInfo;

    if (XDisplayHdrModeResult::Enabled == XDisplayTryEnableHdrMode(XDisplayHdrModePreference::PreferHdr, &displayModeHdrInfo))
    {
        // HDR mode is enabled for the attached display.
        InitializeAsHDR(
            displayModeHdrInfo.minToneMapLuminance,
            displayModeHdrInfo.maxToneMapLuminance,
            displayModeHdrInfo.maxFullFrameToneMapLuminance);
    }
    else
    {
        // Either HDR mode is disabled for the attached display, or the
        // attached display does not support HDR.
        InitializeAsSDR();
    }
}
```


## Requirements  
  
**Header:** XDisplay.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md)  
[XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md)  
[XDisplay](../xdisplay_members.md)  