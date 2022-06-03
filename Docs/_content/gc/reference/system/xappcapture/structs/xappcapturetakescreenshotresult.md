---
author: M-Stahl
title: XAppCaptureTakeScreenshotResult
description: Represents the results of taking a screenshot.
kindex: XAppCaptureTakeScreenshotResult
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureTakeScreenshotResult  

Represents the results of taking a screenshot.  

## Syntax  
  
```cpp
typedef struct XAppCaptureTakeScreenshotResult {  
    char localId[APPCAPTURE_MAX_LOCALID_LENGTH];  
    XAppCaptureScreenshotFormatFlag availableScreenshotFormats;  
} XAppCaptureTakeScreenshotResult  
```
  
### Members  
  
*localId*  
Type: char[APPCAPTURE_MAX_LOCALID_LENGTH]  
  
Local ID of the screenshot result.  
  
*availableScreenshotFormats*  
Type: [XAppCaptureScreenshotFormatFlag](../enums/xappcapturescreenshotformatflag.md)  
  
Image formats available resulting from the taking the screenshot.  
  
## Remarks  

Information about the resulting screenshot and whether both HDR and SDR formats are available, or only SDR format is available. You will use the *localID* to access the correct screenshot stream when calling [XAppCaptureOpenScreenShotStream](../functions/xappcaptureopenscreenshotstream.md). **XAppCaptureTakeScreenshotResult** is an output parameter for [XAppCaptureTakeScreenshot](xappcapturetakescreenshotresult.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureOpenScreenShotStream](../functions/xappcaptureopenscreenshotstream.md)  
[XAppCaptureTakeScreenshot](xappcapturetakescreenshotresult.md)  