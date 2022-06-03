---
author: aablackm
title: PIXSetMarker(UINT64, PCSTR, ...)
description: Inserts a marker into the CPU timeline in the PIX System Timing Capture window, when a particular user-defined event occurs.
kindex:
- PIXSetMarker
- PIX, PIXSetMarker
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
security: public
---

# PIXSetMarker  
  
Inserts a marker into the CPU timeline in the PIX System Timing Capture window, when a particular user-defined event occurs.   

## Syntax  
  
```cpp
void PIXSetMarker(  
         UINT64 color,  
         PCSTR formatString,  
         ...  
)  
```  
  
### Parameters  
  
*color* &nbsp;&nbsp;  
Type: UINT64  
  
The color that will be used in the timing chart when this event occurs in PIX windows.  

Use [PIX_COLOR](pix_color.md) to specify a color, use [PIX_COLOR_INDEX](pix_color_index.md) to specify a color index, or pass in a raw DWORD noting that the format is ARGB and the alpha channel value must be 0xff.  
  

*formatString* &nbsp;&nbsp;\_In\_  
Type: PCSTR  
  
The name to use to describe the event. The string may specify zero or more optional string format placeholders, very similar to `sprintf` formatting.  

Type: ...  
  
If placeholders are used in *formatString*, there must be a corresponding number of parameters (up to a maximum of 16) whose types match the placeholders.  
  
### Return value  
  
Type: void  
  
## Remarks  
  
The `PIXSetMarker` function saves format string and format parameters instead of formatting the string at runtime. Formatting is then done when reading capture file in PIX. Use 16-byte aligned strings (preferable) or 8-byte aligned strings with `PIXSetMarker` to get the best performance. To print a char* or wchar_t* as a pointer using %p format specifier, cast pointer to void* or a pointer to an integral or a floating point type when passing it to `PIXSetMarker`. Any call to `PIXSetMarker` has guaranteed at least 512 bytes of space to save the record data.

The event will be shown as having no duration, and will be represented by a single line (a single vertical bar) in the **PIX System Timing Capture** window.

This function is used to mark events in the CPU timeline. To mark events in the GPU timeline, call the [third overload of the PIXSetMarker function](pixsetmarker_3.md) or [the fourth overload of the PIXSetMarker function](pixsetmarker_4.md)  

Calls to `PIXSetMarker` can occur anywhere, and do not have to follow a call to [PIXBeginEvent](pixbeginevent.md).  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIXSetMarker_2](pixsetmarker_2.md)  
[PIXSetMarker_3](pixsetmarker_3.md)  
[PIXSetMarker_4](pixsetmarker_4.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  