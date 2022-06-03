---
author: M-Stahl
title: XAppCaptureDiagnosticScreenshotResult
description: App capture screenshot and descriptive information.
kindex: XAppCaptureDiagnosticScreenshotResult
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureDiagnosticScreenshotResult  

App capture screenshot and descriptive information.  

## Syntax  
  
```cpp
typedef struct XAppCaptureDiagnosticScreenshotResult {  
    size_t fileCount;  
    XAppCaptureScreenshotFile files[APPCAPTURE_MAX_CAPTURE_FILES];  
} XAppCaptureDiagnosticScreenshotResult  
```
  
### Members  
  
*fileCount*  
Type: size_t  
  
Size of the resulting diagnostic screenshot.  
  
*files*  
Type: [XAppCaptureScreenshotFile](xappcapturescreenshotfile.md)[APPCAPTURE_MAX_CAPTURE_FILES]  
  
Diagnostic screenshot.  
  
## Remarks  
  
Output parameter for [XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md).  
XAppCaptureScreenshotFile may contain more than one screenshot. If the game is running in HDR the XAppCaptureDiagnosticScreenshotResult will contain both and HDR and SDR formatted screenshot.  

  
## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md)  
  