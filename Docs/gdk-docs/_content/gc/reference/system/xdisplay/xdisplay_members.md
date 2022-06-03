---
author: M-Stahl
title: XDisplay (API contents)
description: Reference material for XDisplay APIs.
kindex: XDisplay
ms.author: v-denken
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XDisplay  

Reference material for XDisplay APIs.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XDisplayAcquireTimeoutDeferral](functions/xdisplayacquiretimeoutdeferral.md) | Acquires a screen timeout deferral. |  
| [XDisplayCloseTimeoutDeferralHandle](functions/xdisplayclosetimeoutdeferralhandle.md) | Releases a screen timeout deferral previously acquired by calling [XDisplayAcquireTimeoutDeferral](functions/xdisplayacquiretimeoutdeferral.md). |  
| [XDisplayTryEnableHdrMode](functions/xdisplaytryenablehdrmode.md) | Attempts to enable HDR (high dynamic range) mode for the attached display. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XDisplayHdrModeInfo](structs/xdisplayhdrmodeinfo.md) | Specifies the minimum and maximum tone map luminance values for HDR (high dynamic range) mode on the attached display. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XDisplayHdrModePreference](enums/xdisplayhdrmodepreference.md) | Specifies the preferred mode to use when calling [XDisplayTryEnableHdrMode](functions/xdisplaytryenablehdrmode.md). |  
| [XDisplayHdrModeResult](enums/xdisplayhdrmoderesult.md) | Specifies the current state of HDR (high dynamic range) support on the attached display. |  
  
  
## See also  
[System API reference](../gc-reference-system-toc.md)  