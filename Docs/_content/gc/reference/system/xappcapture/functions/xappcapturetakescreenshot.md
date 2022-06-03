---
author: M-Stahl
title: XAppCaptureTakeScreenshot
description: Takes a screenshot.
kindex: XAppCaptureTakeScreenshot
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureTakeScreenshot  

Takes a screenshot.  

## Syntax  
  
```cpp
HRESULT XAppCaptureTakeScreenshot(  
         XUserHandle requestingUser,  
         XAppCaptureTakeScreenshotResult* result  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

  
Handle representing the user requesting the screenshot.  


*result* &nbsp;&nbsp;\_Out\_  
Type: [XAppCaptureTakeScreenshotResult*](../structs/xappcapturetakescreenshotresult.md)  

  
Results of the screenshot returned.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XAppCaptureTakeScreenshot** takes a screenshot as if the user triggered it. This will show a toast and save the game screenshot.
If the game is running in SDR, a single file is generated. If the game is running in HDR, two files are generated, one in HDR and one in SDR format.
The screenshot(s) may be uploaded automatically to Xbox Live depending on the user preference. Once the screenshot was taken successfully, the resulting file can be read by opening the screenshot stream with [XAppCaptureOpenScreenShotStream](xappcaptureopenscreenshotstream.md) and reading the screenshot with [XAppCaptureReadScreenshotStream](xappcapturereadscreenshotstream.md). Both of these function will require that you use the local Id returned in the [XAppCaptureTakeScreenshotResult](../structs/xappcapturetakescreenshotresult.md) returned from this function.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureOpenScreenShotStream](xappcaptureopenscreenshotstream.md)  
[XAppCaptureReadScreenShotStream](xappcapturereadscreenshotstream.md)  
[XAppCaptureCloseScreenshotStream](xappcaptureclosescreenshotstream.md)  
[XAppCaptureTakeScreenshotResult](../structs/xappcapturetakescreenshotresult.md)  
  