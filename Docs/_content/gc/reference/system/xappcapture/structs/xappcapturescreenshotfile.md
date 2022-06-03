---
author: M-Stahl
title: XAppCaptureScreenshotFile
description: Captured screenshot and descriptive information.
kindex: XAppCaptureScreenshotFile
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureScreenshotFile  

Captured screenshot and descriptive information.  

## Syntax  
  
```cpp
typedef struct XAppCaptureScreenshotFile {  
    char path[MAX_PATH];  
    size_t fileSize;  
    uint32_t width;  
    uint32_t height;  
} XAppCaptureScreenshotFile  
```
  
### Members  
  
*path*  
Type: char[MAX_PATH]  
  
Path to the captured screenshot.  
  
*fileSize*  
Type: size_t  
  
Size of the captured screenshot in bytes.  
  
*width*  
Type: uint32_t  
  
Width of the captured screenshot in pixels.  
  
*height*  
Type: uint32_t  
  
Height of the captured screenshot in pixels.  
  
## Remarks  

This screenshot file represents a diagnostic screenshot taken with the function [XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md). The diagnostic screenshot is saved in the same partition as the game so it can be accessed using the *path* parameter instead of opening a screenshot stream. This structure is a member of [XAppCaptureDiagnosticScreenshotResult](xappcapturediagnosticscreenshotresult.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureDiagnosticScreenshotResult](xappcapturediagnosticscreenshotresult.md)  
[XAppCaptureTakeDiagnosticScreenshot](../functions/xappcapturetakediagnosticscreenshot.md)  