---
author: M-Stahl
title: XAppCaptureOpenScreenshotStream
description: Opens a screenshot stream.
kindex: XAppCaptureOpenScreenshotStream
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureOpenScreenshotStream  

Opens a screenshot stream.  

## Syntax  
  
```cpp
HRESULT XAppCaptureOpenScreenshotStream(  
         const char* localId,  
         XAppCaptureScreenshotFormatFlag screenshotFormat,  
         XAppCaptureScreenshotStreamHandle* handle,  
         uint64_t* totalBytes  
)  
```  
  
### Parameters  
  
*localId* &nbsp;&nbsp;\_In\_  
Type: char*  

  
Local ID of the screenshot returned in [XAppCaptureTakeScreenshotResult](../structs/xappcapturetakescreenshotresult.md) after calling [XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md).  


*screenshotFormat* &nbsp;&nbsp;\_In\_  
Type: [XAppCaptureScreenshotFormatFlag](../enums/xappcapturescreenshotformatflag.md)  

  
Screenshot format flag returned in [XAppCaptureTakeScreenshotResult](../structs/xappcapturetakescreenshotresult.md) after calling [XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md).  


*handle* &nbsp;&nbsp;\_Out\_  
Type: XAppCaptureScreenshotStreamHandle*  

  
Screenshot stream handle returned as a result of opening the stream.  


*totalBytes* &nbsp;&nbsp;\_Out\_opt\_  
Type: uint64_t*  

  
Total number of bytes in the stream.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Screenshots are not accessible from the game partition and so you must open a stream in order to retrieve screenshots taken by the user or with [XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md). [XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md) returns a *localID* in its result which is used in this function to retrieve the proper screenshot. The *localID* will be valid as long as the screenshot is retained on disk. There is only a limited amount of space on the console in which screenshots are stored. Older screenshots will be deleted when the allotted space is filled. This could potentially cause the open screenshot function to miss on a localID. After opening the stream you may read the screenshot with [XAppCaptureReadScreenShotStream](xappcapturereadscreenshotstream.md). Finally every stream needs to be closed with [XAppCaptureCloseScreenshotStream](xappcaptureclosescreenshotstream.md) in order to avoid a memory leak.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureReadScreenShotStream](xappcapturereadscreenshotstream.md)  
[XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md)  
[XAppCaptureCloseScreenshotStream](xappcaptureclosescreenshotstream.md)  