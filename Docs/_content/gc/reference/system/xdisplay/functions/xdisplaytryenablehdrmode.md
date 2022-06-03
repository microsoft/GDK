---
author: M-Stahl
title: XDisplayTryEnableHdrMode
description: Attempts to enable HDR (high dynamic range) mode for the attached display.
kindex:
- XDisplayTryEnableHdrMode
- HDR, XDisplayTryEnableHdrMode
- VRR, XDisplayTryEnableHdrMode
ms.author: v-denken
ms.topic: reference
edited: 05/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XDisplayTryEnableHdrMode  

Attempts to enable HDR (high dynamic range) mode for the attached display.  

## Syntax  
  
```cpp
XDisplayHdrModeResult XDisplayTryEnableHdrMode(  
         XDisplayHdrModePreference displayModePreference,  
         XDisplayHdrModeInfo* displayHdrModeInfo  
)  
```  
  
### Parameters  
  
*displayModePreference* &nbsp;&nbsp;\_In\_  
Type: [XDisplayHdrModePreference](../enums/xdisplayhdrmodepreference.md)  
  
Enumeration used to favor either HDR or an improved framerate up to 120Hz, in cases where both are not supported by the connected TV.
  
*displayHdrModeInfo* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XDisplayHdrModeInfo*](../structs/xdisplayhdrmodeinfo.md)  
  
If HDR mode is enabled, the minimum and maximum tone map luminance values for the attached display.  
  
### Return value
Type: [XDisplayHdrModeResult](../enums/xdisplayhdrmoderesult.md)
  
If the function succeeds, the return value is set to either **XDisplayHdrModeResult::Enabled** if HDR mode is enabled, or **XDisplayHdrModeResult::Disabled** if HDR mode is not enabled. If the function fails, the return value is set to **XDisplayHdrModeResult::Unknown**.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  

The *displayModePreference* parameter provides a way to favor HDR *or* 120Hz refresh rates for TVs that don't support both simultaneously.

In example below, the developer attempts to enable HDR mode for the current title, stating preference for HDR instead of a higher framerate (in the case that both cannot be achieved).  
```cpp
const XDisplayHdrModeResult result = XDisplayTryEnableHdrMode( 
    XDisplayHdrModePreference::PreferHdr, 
    &displayModeHdrInfo); 

switch (result) 
{ 
  case XDisplayHdrModeResult::Unknown: 
    // HDR is currently in an unknown state. 
    break; 
  case XDisplayHdrModeResult::Enabled: 
    // HDR is currently enabled. 
    break; 
  case XDisplayHdrModeResult::Disabled: 
    // HDR is currently disabled. 
    break; 
}
```

Titles should use [XDisplayHdrModePreference::PreferHdr](../enums/xdisplayhdrmodepreference.md) when:
* Your title only implements HDR and does not support 120hz at all.  
* The end user has set an in-game setting indicating they don’t want 120Hz refresh rate, or they prefer HDR such as a preference for quality over performance.  
* The title is in a game mode in which 120Hz refresh rate is not supported.  

Titles should use [XDisplayHdrModePreference::PreferRefreshRate](../enums/xdisplayhdrmodepreference.md) when:  
* You support 120hz and you or the end user has indicated that it is preferred for the current scenario (e.g. setting **Prefer performance** in an in game setting or game mode).  
  
Call **XDisplayTryEnableHdrMode** a second time with a different preference if:  
* Something changed that has swayed your preference. Most likely the user has changed the in-game setting from **Prefer quality** to **Prefer performance**.  
> [!NOTE]
> Don't call **XDisplayTryEnableHdrMode** and toggle back and forth each frame; only change when there is some specific provocation.  

After calling **XDisplayTryEnableHdrMode**, call [IDXGIOutput::GetDisplayModeList](/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaymodelist) to check for to check for 120Hz support.

The **XDisplayTryEnableHdrMode** function returns an **XDisplayHdrModeResult** enumeration value that indicates whether the function can enable HDR mode for the attached display. If **XDisplayHdrModeResult::Enabled** is returned, the function also provides an [XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md) structure that contains information about HDR mode for the display, including the minimum and maximum tone map luminance values for HDR mode. By default, if HDR mode is enabled, the **XDisplayTryEnableHdrMode** function returns the following values for the members of **XDisplayHdrModeInfo**:
  
| Member | Value |  
| --- | --- |  
| minToneMapLuminance | 0.01 |  
| maxToneMapLuminance | 1000 |  
| maxFullFrameToneMapLuminance | 1000 |
  
For more information about HDR luminance values and tone mapping, see the [For a Better HDR Gaming Experience](https://www.hgig.org/doc/ForBetterHDRGaming.pdf) presentation on the [HDR Gaming Interest Group](https://www.hgig.org/) website.
  
The following example attempts to enable HDR mode for the attached display. If [XDisplayHdrModeInfo::Enabled](../enums/xdisplayhdrmoderesult.md) is returned, then HDR mode is enabled for the display and the game uses the luminance values from the returned [XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md) structure to initialize in HDR mode; otherwise, HDR mode is either unavailable or disabled, and the game initializes in SDR (standard dynamic range) mode. 
  
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

  
For more information about HDR support, see [High dynamic range (HDR) output (NDA topic)](../../../../graphics/overviews/hdr-support.md).  

## Requirements  
  
**Header:** XDisplay.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XDisplayHdrModePreference](../enums/xdisplayhdrmodepreference.md)  
[XDisplayHdrModeInfo](../structs/xdisplayhdrmodeinfo.md)  
[XDisplayHdrModeResult](../enums/xdisplayhdrmoderesult.md)  
[XDisplay](../xdisplay_members.md)  