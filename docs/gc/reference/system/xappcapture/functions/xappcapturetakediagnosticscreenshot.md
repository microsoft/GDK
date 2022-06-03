---
author: M-Stahl
title: XAppCaptureTakeDiagnosticScreenshot
description: Takes a diagnostic screenshot from your app.
kindex: XAppCaptureTakeDiagnosticScreenshot
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureTakeDiagnosticScreenshot  

Takes a diagnostic screenshot from your app.  

## Syntax  
  
```cpp
HRESULT XAppCaptureTakeDiagnosticScreenshot(  
         bool gamescreenOnly,  
         XAppCaptureScreenshotFormatFlag captureFlags,  
         const char* filenamePrefix,  
         XAppCaptureDiagnosticScreenshotResult* result  
)  
```  
  
### Parameters  
  
*gamescreenOnly* &nbsp;&nbsp;\_In\_  
Type: bool  

  
Determines whether or not only the gamescreen will be captured. If set to false it is possible that some UI like an onscreen keyboard could be captured in addition to the game screen.


*captureFlags* &nbsp;&nbsp;\_In\_  
Type: [XAppCaptureScreenshotFormatFlag](../enums/xappcapturescreenshotformatflag.md)  

  
Determines whether the capture will be an SDR or HDR capture.


*filenamePrefix* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

  
Desired prefix for the file name, is optional, will be appended to the front of the diagnostic file name.  


*result* &nbsp;&nbsp;\_Out\_  
Type: [XAppCaptureDiagnosticScreenshotResult*](../structs/xappcapturediagnosticscreenshotresult.md)  

  
The resulting captured screenshot.  

  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Unlike [XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md), calling this function does not trigger a UI notification. **XAppCaptureTakeDiagnosticScreenshot** uses [XAppCaptureScreenshotFormatFlag](../enums/xappcapturescreenshotformatflag.md) to designate whether the screen capture will be in SDR, HDR, or both. However, you still must be running in HDR to take an HDR capture. Screenshots are saved to a game accessible partition. The [XAppCaptureDiagnosticScreenshotResult](../structs/xappcapturediagnosticscreenshotresult.md) contains an array of [XAppCaptureScreenshotFile](../structs/xappcapturescreenshotfile.md), each struct contains a file path to the screenshot.

This function will only be available on development kits. On retail kits this api will return an error immediately.  
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureDiagnosticScreenshotResult](../structs/xappcapturediagnosticscreenshotresult.md)  
[XAppCaptureScreenshotFormatFlag](../enums/xappcapturescreenshotformatflag.md)  
[XAppCaptureDiagnosticScreenshotResult](../structs/xappcapturediagnosticscreenshotresult.md)  
[XAppCaptureScreenshotFile](../structs/xappcapturescreenshotfile.md)