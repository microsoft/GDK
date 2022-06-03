---
author: M-Stahl
title: XAppCaptureReadScreenshotStream
description: Reads a screenshot stream.
kindex: XAppCaptureReadScreenshotStream
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureReadScreenshotStream  

Reads a screenshot stream.  

## Syntax  
  
```cpp
HRESULT XAppCaptureReadScreenshotStream(  
         XAppCaptureScreenshotStreamHandle handle,  
         uint64_t startPosition,  
         uint32_t bytesToRead,  
         uint8_t* buffer,  
         uint32_t* bytesWritten  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: XAppCaptureScreenshotStreamHandle  

  
Screenshot stream handle returned by calling [XAppCaptureOpenScreenshotStream](xappcaptureopenscreenshotstream.md).  


*startPosition* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

  
Position in the stream to start reading.  


*bytesToRead* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Number of bytes in the stream to read.  


*buffer* &nbsp;&nbsp;\_Out\_writes\_to\_(bytesToRead,*bytesWritten)  
Type: uint8_t*  

  
Buffer to contain the bytes read by **XAppCaptureReadScreenshotStream**.  


*bytesWritten* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  

  
Number of bytes actually written to the *buffer*.  


  
### Return value
Type: HRESULT
  
Function result.  

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Before reading a screenshot you must open a screenshot stream with [XAppCaptureOpenScreenShotStream](xappcaptureopenscreenshotstream.md). This will produce the **XAppCaptureScreenshotStreamHandle** needed for the *handle* parameter. You may then call this function to read the screenshot. The *startPosition* and *bytesToRead* parameters will allow you to read a section of the screenshot, this is useful for reading a large stream a section at a time. You can get the total size of the stream from the *totalBytes* output parameter in [XAppCaptureOpenScreenShotStream](xappcaptureopenscreenshotstream.md). The output parameters *buffer* and *bytesWritten* will help you accurately read the data returned from this function. After reading the screenshot data close the screenshot stream with [XAppCaptureCloseScreenshotStream](xappcaptureclosescreenshotstream.md) in order to avoid a memory leak.

## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureOpenScreenShotStream](xappcaptureopenscreenshotstream.md)  
[XAppCaptureTakeScreenshot](xappcapturetakescreenshot.md)  
[XAppCaptureCloseScreenshotStream](xappcaptureclosescreenshotstream.md)