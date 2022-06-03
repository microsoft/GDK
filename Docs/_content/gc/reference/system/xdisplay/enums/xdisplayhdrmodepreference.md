---
author: M-Stahl
title: XDisplayHdrModePreference
description: Specifies the preferred mode to use when calling [XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md).
kindex: XDisplayHdrModePreference
ms.author: v-denken
ms.topic: reference
security: public
edited: 02/02/2021
applies-to: pc-gdk
---

# XDisplayHdrModePreference

Specifies the preferred mode to use when calling [XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
enum class XDisplayHdrModePreference  : uint32_t
{
    PreferHdr = 0,
    PreferRefreshRate = 1
}
```

<a id="constantsSection"></a>

## Constants

| Constant | Description |
| --- | --- |
| PreferHdr | HDR is preferred over a higher refresh rate when the display doesn't support both simultaneously. |
| PreferRefreshRate | 120 Hz refresh rate is preferred over HDR when the display doesn't support both simultaneously. |

<a id="remarksSection"></a>

## Remarks

For more information about HDR support, see [High Dynamic Range (HDR) output (NDA topic)](../../../../graphics/overviews/hdr-support.md).

For information about HDR luminance values and tone mapping, see the [For a Better HDR Gaming Experience](https://www.hgig.org/doc/ForBetterHDRGaming.pdf) presentation on the HDR Gaming Interest Group website.

**Example**

The following code example demonstrates how to enable HDR mode for an attached display. If [XDisplayHdrModeInfo::Enabled](xdisplayhdrmoderesult.md) is returned, then HDR mode is enabled for the display, and the game can choose to use the luminance values from the returned `XDisplayHdrModeInfo` structure to optimize the rendered HDR image for the attached display's capabilities. Otherwise, HDR mode is either unavailable, or it is disabled, and the game initializes in standard dynamic range (SDR) mode.

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


<a id="requirementsSection"></a>

## Requirements

**Header:** XDisplay.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XDisplayTryEnableHdrMode](../functions/xdisplaytryenablehdrmode.md)  
[XDisplay](../xdisplay_members.md)  
[High dynamic range (HDR) output (NDA topic)](../../../../graphics/overviews/hdr-support.md)  