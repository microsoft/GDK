---
author: M-Stahl
title: XAppCaptureRecordDiagnosticClip
description: Records a diagnostic clip from your app.
kindex: XAppCaptureRecordDiagnosticClip
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureRecordDiagnosticClip  

Records a diagnostic clip from your app.  

## Syntax  
  
```cpp
HRESULT XAppCaptureRecordDiagnosticClip(  
         time_t startTime,  
         uint32_t durationInMs,  
         const char* filenamePrefix,  
         XAppCaptureRecordClipResult* result  
)  
```  
  
### Parameters  
  
*startTime* &nbsp;&nbsp;\_In\_  
Type: time_t  

  
Timestamp for the beginning of the diagnostic clip.  


*durationInMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
Duration in milliseconds of the diagnostic clip.  


*filenamePrefix* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

  
Desired prefix for the file name, is optional, will be appended to the front of the diagnostic file name.  


*result* &nbsp;&nbsp;\_Out\_  
Type: [XAppCaptureRecordClipResult*](../structs/xappcapturerecordclipresult.md)  

  
The resulting recorded diagnostic clip.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Calling this function does not trigger a UI notification. Clips are saved to a game accessible partition. The [XAppCaptureRecordDiagnosticClipResult](../structs/xappcapturerecordclipresult.md) contains a file path which you can use to access the screenshot.
This function will only be available on development kits. On retail kits this api will return an error immediately.

## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureRecordDiagnosticClipResult](../structs/xappcapturerecordclipresult.md)  
  