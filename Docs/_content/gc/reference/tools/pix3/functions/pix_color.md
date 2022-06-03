---
author: aablackm
title: PIX_COLOR
description: Specifies a particular color for an event.
kindex:
- PIX_COLOR
- PIX, PIX_COLOR
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# PIX_COLOR  
  
Specifies a particular color for an event.  

## Syntax  
  
```cpp
UINT PIX_COLOR(  
         BYTE r,  
         BYTE g,  
         BYTE b  
)  
```  
  
### Parameters  
  
*r* &nbsp;&nbsp;  
Type: BYTE  
  
The red component of the color.  

*g* &nbsp;&nbsp;  
Type: BYTE  
  
The green component of the color.  
  

*b* &nbsp;&nbsp;  
Type: BYTE  
  
The blue component of the color.
  
### Return value
Type: UINT
  
Returns a UINT containing the specified color.  

## Remarks  
  
Use the PIX_COLOR\* functions to specify colors to pass as metadata to a PIX event/marker API. 
Use `PIX_COLOR` to specify a particular color for an event. Or, use [PIX_COLOR_INDEX](pix_color_index.md) to specify a set of unique event categories and let PIX choose the colors to represent each category.  
  
The PIX_COLOR\* functions can be used to determine the color parameter for a number of functions to represent how they will be displayed in a PIX chart. Those functions include [PIXBeginEvent](pixbeginevent.md), [PIXScopedEvent](pixscopedevent.md), and [PIXSetMarker](pixsetmarker.md).
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIX_COLOR_INDEX](pix_color_index.md)  
[PIXBeginEvent](pixbeginevent.md)  
[PIXScopedEvent](pixscopedevent.md)  
[PIXSetMarker](pixsetmarker.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[PIX3](../pix3_members.md)  