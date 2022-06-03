---
author: M-Stahl
title: XAppCaptureVideoEncoding
description: Determines the video encoding type video capture.
kindex: XAppCaptureVideoEncoding
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureVideoEncoding  

Determines the video encoding type video capture.  

## Syntax  
  
```cpp
enum class XAppCaptureVideoEncoding  : uint8_t  
{  
    H264 = 0,  
    HEVC = 1  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| H264 | H.264 video encoding also known as MPEG-4 AVC |  
| HEVC | H.265 video encoding also know as High Efficiency Video Coding (HEVC) |  
  
## Remarks    

Member of [XAppCaptureRecordClipResult](../structs/xappcapturerecordclipresult.md). H.264 (also known as AVC - Advanced Video Coding) is an industry standard for video compression that allows for the recording, compression, and distribution of digital video content. H.265 (also known as HEVC - High Efficiency Video Coding) is a more advanced version, which allows for further reduced file size, and therefore a reduction in required bandwidth for streaming.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureRecordClipResult](../structs/xappcapturerecordclipresult.md)  
  