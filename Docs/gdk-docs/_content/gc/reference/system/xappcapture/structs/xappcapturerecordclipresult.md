---
author: M-Stahl
title: XAppCaptureRecordClipResult
description: Captured video clip and descriptive information.
kindex: XAppCaptureRecordClipResult
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureRecordClipResult  

Captured video clip and descriptive information.  

## Syntax  
  
```cpp
typedef struct XAppCaptureRecordClipResult {  
    char path[MAX_PATH];  
    size_t fileSize;  
    time_t startTime;  
    uint32_t durationInMs;  
    uint32_t width;  
    uint32_t height;  
    XAppCaptureVideoEncoding encoding;  
} XAppCaptureRecordClipResult  
```
  
### Members  
  
*path*  
Type: char[MAX_PATH]  
  
Path to the captured video.  
  
*fileSize*  
Type: size_t  
  
Size of the captured video clip.  
  
*startTime*  
Type: time_t  
  
Start time of the captured video clip.  
  
*durationInMs*  
Type: uint32_t  
  
Duration of the recorded video clip in milliseconds.
  
*width*  
Type: uint32_t  
  
Width of the recorded clip measured in pixels.  
  
*height*  
Type: uint32_t  
  
Height of the recorded clip measured in pixels.  
  
*encoding*  
Type: [XAppCaptureVideoEncoding](../enums/xappcapturevideoencoding.md)  
  
Video encoding format for the recorded clip.  
  
## Remarks  
  
This struct describes and provides access to the recorded clip made with [XAppCaptureRecordDiagnosticClip](../functions/xappcapturerecorddiagnosticclip.md). The recorded clip is saved in the same partition as the game so it can be accessed using the *path* parameter instead of needing to open a stream. This recorded clip does not behave as it if was taken by a user and will not be stored with a users recorded game clips.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureRecordDiagnosticClip](../functions/xappcapturerecorddiagnosticclip.md)  
  