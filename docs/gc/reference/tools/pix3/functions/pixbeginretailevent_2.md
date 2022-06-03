---
author: aablackm
title: PIXBeginRetailEvent(void*,UINT64, PCWSTR, ...)
description: Starts a user-defined retail event.
kindex: PIXBeginRetailEvent
ms.author: jerry.zhou
ms.topic: reference
security: public
edited: 00/00/0000
---

# PIXBeginRetailEvent  

Starts a user-defined retail event.  

## Syntax  
  
```cpp
void PIXBeginRetailEvent(  
         void* context,  
         UINT64 color,  
         PCWSTR formatString,
         ...  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;  
Type: void*  
  
Context for the event, accepts `ID3D12GraphicsCommandList\*`, `ID3D12GraphicsCommandList\*` and `ID3D12XboxDmaCommandList\*` (Xbox only).  

*color* &nbsp;&nbsp;  
Type: UINT64  
  
The event color to use in the system timing chart. Use [PIX_COLOR](pix_color.md) to specify a color, [PIX_COLOR_INDEX](pix_color_index.md) to specify a color index, or pass in a raw DWORD noting that the format is ARGB and the alpha channel value must be 0xff.  
*formatString* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The name to use to describe the event, as a pointer to a null-terminated Unicode string. The string may specify zero or more optional string format placeholders, very similar to `sprintf` formatting.  
  
Type: ...  
  
If placeholders are used in *formatString*, there must be a corresponding number of parameters whose types depend on the placeholders. This method supports up to a maximum of 16 format parameters.  
  
### Return value
  
Type: void
  
## Remarks  
  
With a debug or instrumented device, `PIXBeginRetailEvent` behaves identically to [PIXBeginEvent](pixbeginevent.md). For a retail device, the events will be included in HIX files for GPU hang debugging.
  
`PIXBeginRetailEvent` and `PIXEndRetailEvent` pairs can be nested to any depth.  

## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[pix3](../pix3_members.md)  
[PIXEndRetailEvent](pixendretailevent.md)  
[PIXBeginRetailEvent(void*, UINT64, PCSTR, ...)](pixbeginretailevent.md)  