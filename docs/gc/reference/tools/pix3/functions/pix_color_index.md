---
author: aablackm
title: PIX_COLOR_INDEX
description: Specifies a set of unique event categories and lets PIX choose the colors to represent each category.
kindex:
- PIX_COLOR_INDEX
- PIX, PIX_COLOR_INDEX
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
security: public
---

# PIX_COLOR_INDEX  
  
Specifies a set of unique event categories and lets PIX choose the colors to represent each category.  
  
## Syntax  
  
```cpp
UINT PIX_COLOR_INDEX(  
         BYTE i  
)  
```  
  
### Parameters  
  
*i* &nbsp;&nbsp;  
Type: BYTE  
  
The index of the color.  
  
### Return value
Type: UINT
  
Returns a UINT containing the color representing the category.  

## Remarks  
  
Use the PIX_COLOR\* functions to specify colors to pass as metadata to a PIX event/marker API. Use [PIX_COLOR](pix_color.md) to specify a particular color for an event. Or, use `PIX_COLOR_INDEX` to specify a set of unique event categories, and let PIX choose the colors to represent each category. `PIX_COLOR_INDEX` allows for eight distinct color indexes to be used. The function will wrap the index values using *i* % 8 to choose the index that will determine the appropriate color.  
The PIX_COLOR\* functions can be used to determine the color parameter for a number of functions to represent how they will be displayed in a PIX chart. Those functions include the overloaded methods [PIXBeginEvent](pixbeginevent-overloads.md) and [PIXSetMarker](pixsetmarker-overloads.md).  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIX_COLOR](pix_color.md)  
[PIXBeginEvent](pixbeginevent.md)  
[PIXSetMarker](pixsetmarker.md)  
[PIX3](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  