---
author: aablackm
title: PIXGetCaptureState
description: Retrieves the type of captures in progress, as a set of flags.
kindex:
- PIXGetCaptureState
- PIX, PIXGetCaptureState
ms.author: jerry.zhou
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# PIXGetCaptureState  
  
Retrieves the type of captures in progress, as a set of flags.  
  
## Syntax  
  
```cpp
DWORD PIXGetCaptureState(  
)  
```  
  
### Parameters  
  
  
### Return value  
  
Type: DWORD  
  
Capture state flags. If no capture state flags are set, zero is returned, which indicates that PIX has no captures in progress.  
  
#### Flags
  
| Flag | Value | Description |  
| --- | --- | --- |  
| PIX_CAPTURE_TIMING | (1 << 0) | System timing.|  
| PIX_CAPTURE_GPU | (1 << 1) | GPU frames.|  
| PIX_CAPTURE_FUNCTION_SUMMARY | (1 << 2) | A function summary capture was initiated from the **Home** tab.|  
| PIX_CAPTURE_FUNCTION_DETAILS | (1 << 3) | A request for additional function details was initiated using the **Capture Additional Calls** button from either a function summary or callgraph capture.|  
| PIX_CAPTURE_CALLGRAPH | (1 << 4) | A callgraph capture was initiated either from PIX or programmatically by calling `PIXBeginCapture`.|  
| PIX_CAPTURE_INSTRUCTION_TRACE | (1 << 5) | A CPU instruction trace capture is in progress.|  
| PIX_CAPTURE_SYSTEM_MONITOR_COUNTERS | (1 << 6) | System monitor counters.|  
| PIX_CAPTURE_VIDEO | (1 << 7) | Video playback.|  
| PIX_CAPTURE_AUDIO | (1 << 8) | Audio playback.|  
  
  
## Remarks
  
The flags retrieved from `PIXCaptureState` are used as parameters in the [PIXBeginCapture](pixbegincapture.md) function. 
In the case of [PIXBeginCapture](pixbegincapture.md), the flag will determine which type of Pix capture is initiated. 
You can confirm that the capture began properly by calling this function to check the capture types that are currently running.

## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIXBeginCapture](pixbegincapture.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  