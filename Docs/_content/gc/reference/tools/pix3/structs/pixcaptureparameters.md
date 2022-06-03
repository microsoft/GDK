---
author: aablackm
title: PIXCaptureParameters
description: Parameters for PIXBeginCapture.
kindex:
- PIXCaptureParameters
- PIX, PIXCaptureParameters
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
security: public
---

# PIXCaptureParameters  

Parameters for [PIXBeginCapture](../functions/pixbegincapture.md).  

## Syntax  

```cpp
union PIXCaptureParameters
{
    enum PIXCaptureStorage
    {
        Memory = 0,
    };

    struct GpuCaptureParameters
    {
        PVOID reserved;
    } GpuCaptureParameters;

    struct TimingCaptureParameters
    {
        PWSTR FileName;
        UINT32 MaximumToolingMemorySizeMb;
        PIXCaptureStorage CaptureStorage;

        BOOL CaptureGpuTiming;

        BOOL CaptureCallstacks;
        BOOL CaptureCpuSamples;
        UINT32 CpuSamplesPerSecond;

        BOOL CaptureFileIO;

        BOOL CaptureVirtualAllocEvents;
        BOOL CaptureHeapAllocEvents;
        BOOL CaptureXMemEvents; // Xbox only
        BOOL CapturePixMemEvents; // Xbox only
    } TimingCaptureParameters;
};

typedef PIXCaptureParameters* PPIXCaptureParameters;
```

### Members  
  
*reserved*  
Type: PVOID  

Reserved.  

*FileName*  
Type: PWSTR  

The file name for the capture on the console.  

*MaximumToolingMemorySizeMb*  
Type: UINT32  

The maximum number in MB of the buffer in tooling memory that will be used to hold capture data.  
Capture will stop when the memory buffer is full.

*CaptureStorage*  
Type: PIXCaptureStorage  

The storage location of the capture in progress.
When memory storage runs out, the capture will stop. 

*CaptureGpuTiming*  
Type: BOOL  

Determines whether or not to capture GPU Timing data, including PIX GPU events, GPU work, PIX GPU Markers and API Markers.

*CaptureCallstacks*  
Type: BOOL  

Determines whether or not to capture call stacks for context switches.  

*CaptureCpuSamples*  
Type: BOOL  

Determines whether or not to capture CPU samples.   

*CpuSamplesPerSecond*  
Type: UINT32  

The number of CPU samples per second to capture.   
  
*CaptureFileIO*  
Type: BOOL  

Determines whether or not to capture DirectStorage and Win32 file IO.  

*CaptureVirtualAllocEvents*  
Type: BOOL  

Determines whether or not to capture virtual allocation events.  

*CaptureHeapAllocEvents*  
Type: BOOL  

Determines whether or not to capture heap allocation events.  

*CaptureXMemEvents*  
Type: BOOL  

Determines whether or not to capture XMem allocation events.  

*CapturePixMemEvents*  
Type: BOOL  

Determines whether or not to capture allocations made with title-defined custom memory allocators.  

## Remarks  
  
This union is used by [PIXBeginCapture](../functions/pixbegincapture.md) to start a programmatically controlled PIX timing capture.   
  
`PixBeginCapture` also uses the flags returned by [PixGetCaptureState](../functions/pixgetcapturestate.md).   
  
The capture will stop when the memory buffer is full.   
  

## Requirements  

**Header:** pix3.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[pix3](../pix3_members.md)  