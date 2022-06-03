---
author: aablackm
title: PIXEndCapture
description: Stops a programmatically controlled capture that was started with `PIXBeginCapture`.
kindex:
- PIXEndCapture
- PIX, PIXEndCapture
ms.author: jerry.zhou
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# PIXEndCapture  
  
Stops a programmatically controlled capture that was started with `PIXBeginCapture`.  

## Syntax  

```cpp
HRESULT PIXEndCapture(  
         BOOL discard  
)  
```  

### Parameters  
  
*discard* &nbsp;&nbsp;  
Type: BOOL  

Indicates whether the capture should be discarded:  

* If *discard* is TRUE, the captured data is discarded, and the capture will not be displayed in PIX.  
* If *discard* is FALSE, the captured data is saved, and PIX will display the resulting capture.  

The *discard* parameter is useful to throw away captures that didn’t meet the criteria you were looking for. For example, you can use `PIXBeginCapture` and `PIXEndCapture` to attempt to capture calls to a function that fall within a predefined time range. You may wish to only display captures for calls to a function that fall within that range.  
  
### Return value  
  
Type: HRESULT  

Indicates whether the capture complete successfully. S_OK is returned on success. The operation is asynchronous and it will return E_PENDING until the capture is fully stopped. The title should not exit or start a new capture while the result is E_PENDING.

## Remarks  
  
Use [PIXBeginCapture](pixbegincapture.md) to begin a PIX capture.  
For more information about requirements for starting a PIX capture, see the Remarks section of [PIXBeginCapture](pixbegincapture.md).
  
The following C++ sample demonstrates how to begin and end a PIX capture.  
  
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

while (PIXEndCapture(FALSE) == E_PENDING)
{
    // Keep running
}

```

## Requirements  
  
**Header:** pix3.h

**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIXBeginCapture](pixbegincapture.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  