---
author: M-Stahl
title: XDisplayHdrModeInfo
description: Specifies the minimum and maximum tone map luminance values for HDR (high dynamic range) mode on the attached display.
kindex: XDisplayHdrModeInfo
ms.author: v-denken
ms.topic: reference
edited: 04/25/2019
quality: good
security: public
applies-to: pc-gdk
---

# XDisplayHdrModeInfo  

Specifies the minimum and maximum tone map luminance values for HDR (high dynamic range) mode on the attached display.  

## Syntax  
  
```cpp
typedef struct XDisplayHdrModeInfo {  
    float minToneMapLuminance;  
    float maxToneMapLuminance;  
    float maxFullFrameToneMapLuminance;  
} XDisplayHdrModeInfo  
```
  
### Members  
  
*minToneMapLuminance*  
Type: float  
  
The minimum tone map luminance (MinTML) value, in nits.
  
*maxToneMapLuminance*  
Type: float  
  
The maximum tone map luminance (MaxTML) value, in nits.  
  
*maxFullFrameToneMapLuminance*  
Type: float  
  
The maximum full-frame tone map luminance (MaxFFTML) value, in nits.  

## Remarks

The [XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md) function returns an [XDisplayHdrModeResult](../enums/xdisplayhdrmoderesult.md) enumeration value that indicates whether the function can enable HDR mode for the attached display. If **XDisplayHdrModeResult::Enabled** is returned, the function also provides an **XDisplayHdrModeInfo** structure that contains information about HDR mode for the display, including the minimum and maximum tone map luminance values for HDR mode.

For more information about HDR luminance values and tone mapping, see the [For a Better HDR Gaming Experience](https://www.hgig.org/doc/ForBetterHDRGaming.pdf) presentation on the [HDR Gaming Interest Group](https://www.hgig.org/) website.

The following example attempts to enable HDR mode for the attached display. If [XDisplayHdrModeInfo::Enabled](../enums/xdisplayhdrmoderesult.md) is returned, then HDR mode is enabled for the display and the game uses the luminance values from the returned **XDisplayHdrModeInfo** structure to initialize in HDR mode; otherwise, HDR mode is either unavailable or disabled, and the game initializes in SDR (standard dynamic range) mode. 

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
[XDisplayHdrModeResult](../enums/xdisplayhdrmoderesult.md)  
[XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md)  
[XDisplay](../xdisplay_members.md)  