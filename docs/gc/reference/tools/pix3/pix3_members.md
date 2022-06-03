---
author: aablackm
title: PIX3 (API contents)
description: PIX3 API reference material for the Microsoft Game Development Kit (GDK).
kindex:
- Pix3
- PIX, Pix3
ms.author: jerry.zhou
ms.topic: navigation
edited: 06/13/2019
security: public
---

# PIX3  

PIX3 API reference material for the Microsoft Game Development Kit (GDK).  

  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [ConfigureL2IPMCs](functions/configurel2ipmcs.md) | Configures performance counters inside the L2 caches. |  
| [ConfigureNBPMCs](functions/configurenbpmcs.md) | Configures the four hardware Performance Monitor Counters (PMCs) inside the north bridge to enable a title to read the counters directly for the title code. |  
| [ConfigurePMCs](functions/configurepmcs.md) | Configures the four hardware Performance Monitor Counters (PMCs) to enable a title to read the counters directly for the title code. |  
| [GetPMCValue](functions/getpmcvalue.md) | Gets the value of a hardware Performance Monitor Counter (PMC). |  
| [PIX_COLOR](functions/pix_color.md) | Specifies a particular color for an event. |  
| [PIX_COLOR_INDEX](functions/pix_color_index.md) | Specifies a set of unique event categories and lets PIX choose the colors to represent each category. |  
| [PIXBeginCapture](functions/pixbegincapture.md) | Starts a programmatically controlled PIX capture. |  
| [PIXBeginEvent](functions/pixbeginevent-overloads.md) | Starts a user-defined event for a timing capture of CPU activity, to be displayed in the System Timing Capture feature of PIX. |  
| [PIXEndCapture](functions/pixendcapture.md) | Stops a programmatically controlled capture that was started with `PIXBeginCapture`. |  
| [PIXEndEvent](functions/pixendevent-overloads.md) | Defines the end of a user-defined event. |  
| [PIXGetCaptureState](functions/pixgetcapturestate.md) | Retrieves the type of captures in progress, as a set of flags. |  
| [PIXRecordMemoryAllocationEvent](functions/pixrecordmemoryallocationevent.md) | Records a memory allocation event. |  
| [PIXRecordMemoryFreeEvent](functions/pixrecordmemoryfreeevent.md) | Records a memory freeing event. |  
| [PIXReportCounter](functions/pixreportcounter.md) | Displays a user-defined counter in the PIX UI. |  
| [PIXScopedEvent](functions/pixscopedevent-overloads.md) | Creates a user-defined event for a timing capture of CPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). |  
| [PIXSetMarker](functions/pixsetmarker-overloads.md) | Inserts a marker into the CPU timeline in the PIX System Timing Capture window, when a particular user-defined event occurs. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [PIXCaptureParameters](structs/pixcaptureparameters.md) | Parameters for PIXBeginCapture. |  
  

<a id="pixgpucaptureapis"></a>

## PIX GPU Capture APIs

APIs for [PIX GPU Captures (NDA topic)](../../../tools-console/xbox-tools-and-apis/pix/gpu/pix-gpu-capture.md) are part of the [ID3D12CommandQueue](id3d12commandqueue.md) interface. Please refer to the following API reference topics for the same


| Function | Description |  
| --- | --- |  
| [ID3D12CommandQueue::PIXGpuBeginCapture](id3d12commandqueue_pixgpubegincapture.md) | Begin capturing GPU data |
| [ID3D12CommandQueue::PIXGpuCaptureNextFrame](id3d12commandqueue_pixgpucapturenextframe.md) | Capture GPU data for the next frame |
| [ID3D12CommandQueue::PIXGpuEndCapture](id3d12commandqueue_pixgpuendcapture.md) | End capturing GPU data |

## See also  
[PIX overview (NDA topic)](../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[Tools API reference](../gc-reference-tools-toc.md)  