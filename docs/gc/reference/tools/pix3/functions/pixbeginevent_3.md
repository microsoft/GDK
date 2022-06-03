---
author: aablackm
title: PIXBeginEvent(void*, UINT64, PCSTR, ...)
description: Starts a user-defined event for a timing capture of CPU or GPU activity, to be displayed in the **System Timing Capture** features of PIX.
kindex:
- PIXBeginEvent
- PIX, PIXBeginEvent
ms.author: jerry.zhou
ms.topic: reference
edited: 06/13/2019
security: public
---

# PIXBeginEvent  

Starts a user-defined event for a timing capture of CPU or GPU activity, to be displayed in the **System Timing Capture** features of PIX.  

## Syntax  
  
```cpp
void PIXBeginEvent(  
         void* context,  
         UINT64 color,  
         PCSTR formatString,
         ...  
)  
```  


### Parameters  
  
*context* &nbsp;&nbsp;  
Type: void\*  
  
Context for the event, accepts `ID3D12GraphicsCommandList\*` , `ID3D12GraphicsCommandList\*` and `ID3D12XboxDmaCommandList\*` (Xbox only).

*color* &nbsp;&nbsp;  
Type: UINT64  
  
The event color to use in the system timing chart. Use [PIX_COLOR](pix_color.md) to specify a color, [PIX_COLOR_INDEX](pix_color_index.md) to specify a color index, or pass in a raw DWORD noting that the format is ARGB and the alpha channel value must be 0xff.  

*formatString* &nbsp;&nbsp;\_In\_  
Type: PCSTR  
  
The name to use to describe the event, as a pointer to a null-terminated string. The string may specify zero or more optional string format placeholders, very similar to `sprintf` formatting.  
  
Type: ...  
  
If placeholders are used in *formatString*, there must be a corresponding number of parameters whose types depend on the placeholders. This method supports up to a maximum of 16 format parameters.  
    
### Return value
Type: void
  
## Remarks  
  
The `PIXBeginEvent` function saves format string and format parameters instead of formatting the string at runtime. Formatting is then done when reading capture files in PIX. Use 16-byte aligned strings (preferable) or 8-byte aligned strings with PIXBeginEvent to get the best performance. To print a char\* or wchar_t\* as a pointer using %p format specifier, cast the pointer to void\* or a pointer to an integral or a floating point type when passing it to `PIXBeginEvent`. For the best performance, use a statically allocated string.  

Calls to `PIXBeginEvent` are guaranteed at least 512 bytes of space to save the record data, which includes the full size and alignment of the format string and all variables. In general, PIX events are intended for short high-performance markers that align to your game’s major components, systems, or content.  

This method is used to time CPU events. For more information about timing GPU events, see the [PIX GPU Capture APIs](../pix3_members.md#pixgpucaptureapis) section of [PIX3](../pix3_members.md).  

Each call to `PIXBeginEvent` must have a matching call to [PIXEndEvent](pixendevent.md). The timing interval is about 200ns, and there is a low overhead to using this function, so up to several hundred thousand calls to `PIXBeginEvent` can be made per second.  

`PIXBeginEvent` and `PIXEndEvent` pairs can be nested to any depth.  
  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIXBeginEvent](pixbeginevent.md)  
[PIXBeginEvent_2](pixbeginevent_2.md)  
[PIXBeginEvent_4](pixbeginevent_4.md)  
[PIXEndEvent](pixendevent.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  