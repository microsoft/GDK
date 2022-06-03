---
author: aablackm
title: PIXBeginCapture
description: Starts a programmatically controlled PIX capture.
kindex:
- PIXBeginCapture
- PIX, PIXBeginCapture
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# PIXBeginCapture  
  
Starts a programmatically controlled PIX timing capture.
  

## Syntax  

```cpp
HRESULT PIXBeginCapture(  
         DWORD captureFlags,  
         const PPIXCaptureParameters captureParameters  
)  
```  

### Parameters  
  
*captureFlags* &nbsp;&nbsp;  
Type: DWORD  


A flag indicating the type of capture to perform. Only one capture flag can be passed to `PIXBeginCapture` at a time. Currently, the only valid value is PIX_CAPTURE_TIMING defined in pix3.h:

```cpp
#define PIX_CAPTURE_TIMING                  (1 << 0)  
```

*captureParameters* &nbsp;&nbsp;\_In\_opt\_  
Type: PPIXCaptureParameters  

For timing captures, pass a pointer to the `TimingCaptureParameters` structure, or pass a pointer to the [PIXCaptureParameters](../structs/pixcaptureparameters.md) union, which contains the `TimingCaptureParameters` structure.  

### Return value
  
Type: HRESULT

Indicates whether the capture was successfully initiated. S_FALSE is returned on success. Only one capture may be running at a time. If `PIXBeginCapture` is called when another capture is currently running, E_PENDING will be returned and the call will have no effect.  
  
<a id="remarksSection"></a>
  
## Remarks  
  
This function initiates a PIX capture from title code. `PIXBeginCapture` can currently only be used to take a [timing capture (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/new-timing-captures.md).

Programmatic timing captures can run for durations on the order of a few hours.  Due to the volume of data that may be collected during that time, it's possible that PIX won't be able to store all the capture data in the amount of tooling memory that is available on the console.

PIX will stop the capture when the amount of tooling memory specified by `MaximumToolingMemorySizeMb` is used up before the capture is stopped by a call to [PIXEndCapture](pixendcapture.md). 

Timing captures taken using `PIXBeginCapture` must be copied back to the PC and converted into an .xpix file before they can be viewed in PIX.  See [Opening Programmatic Timing Captures (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/open-offline-timing-captures.md) for a description of the steps required to view a programmatic capture in PIX.

Use [PIXEndCapture](pixendcapture.md) to stop a PIX capture from title code.

```cpp
//
//  timing capture
//
PIXCaptureParameters captureParams = {};

captureParams.TimingCaptureParameters.CaptureGpuTiming = TRUE;
captureParams.TimingCaptureParameters.CaptureCallstacks = TRUE;
captureParams.TimingCaptureParameters.CaptureCpuSamples = TRUE;
captureParams.TimingCaptureParameters.CpuSamplesPerSecond = 4000;

captureParams.TimingCaptureParameters.CaptureStorage = PIXCaptureParameters::Memory;
captureParams.TimingCaptureParameters.FileName = wstrFilename;
captureParams.TimingCaptureParameters.MaximumToolingMemorySizeMb = 4096;

XSF_ERROR_IF_FAILED(PIXBeginCapture(PIX_CAPTURE_TIMING, &captureParams));

```
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIXEndCapture](pixendcapture.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  