---
author: aablackm
title: PIXSetRetailMarker(void*, UINT64, PCWSTR, ...)
description: Inserts a retail marker, when a particular user-defined event occurs.
kindex: PIXSetRetailMarker
ms.author: jerry.zhou
ms.topic: reference
security: public
edited: 00/00/0000
---

# PIXSetRetailMarker  

Inserts a retail marker, when a particular user-defined event occurs.  

## Syntax  
  
```cpp
void PIXSetRetailMarker(  
         void* context,  
         UINT64 color,  
         PCWSTR formatString,  
         ...  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;  
Type: void*  
  
Context for the event, accepts **ID3D12GraphicsCommandList\*** , **ID3D12CommandQueue\*** and **ID3D12XboxDmaCommandList\*** (Xbox only).  

*color* &nbsp;&nbsp;  
Type: UINT64  
  
The color that will be used in the timing chart when this event occurs in PIX windows.  
Use [PIX_COLOR](pix_color.md) to specify a color, use [PIX_COLOR_INDEX](pix_color_index.md) to specify a color index, or pass in a raw DWORD noting that the format is ARGB and the alpha channel value must be 0xff.  

*formatString* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The name to use to describe the event, as a pointer to a null-terminated Unicode string. The string may specify zero or more optional string format placeholders, very similar to **sprintf** formatting.  

Type: ...  
  
If placeholders are used in **formatString**, there must be a corresponding number of parameters (up to a maximum of 16) whose types match the placeholders.  
  
### Return value
Type: void
  
  
## Remarks  
  
With a debug or instrumented device, `PIXSetRetailMarker` behaves identically to [PIXSetMarker](pixsetmarker.md). For a retail device, the markers will be included in HIX files for GPU hang debugging.

Calls to `PIXSetRetailMarker` can occur anywhere, and do not have to follow a call to [PIXBeginRetailEvent](pixbeginretailevent.md).  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[PIX overview (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[pix3](../pix3_members.md)  
[PIXSetRetailMarker(void*, UINT64, PCSTR, ...)](pixsetretailmarker.md)  
[PIXBeginRetailEvent](pixbeginretailevent.md)
  