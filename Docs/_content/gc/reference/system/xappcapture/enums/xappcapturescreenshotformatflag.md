---
author: M-Stahl
title: XAppCaptureScreenshotFormatFlag
description: Determines the definition quality of the screenshot capture.
kindex: XAppCaptureScreenshotFormatFlag
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureScreenshotFormatFlag  

Determines the definition quality of the screenshot capture.  

## Syntax  
  
```cpp
enum class XAppCaptureScreenshotFormatFlag  : uint16_t  
{  
    SDR = 1,  
    HDR = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| SDR | Setting this flag will capture a screenshot in SDR. |  
| HDR | Setting this flag will capture a screenshot in HDR. |  
  
## Remarks  

You may set one or both of the flags to designate a screenshot capture format. In the event that you set both you will receive two different captures. You may only set the HDR flag if the game is running in HDR.
  
This enum represents the option flags for [XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md).  
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md)  
  