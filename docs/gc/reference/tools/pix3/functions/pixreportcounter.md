---
author: aablackm
title: PIXReportCounter
description: Displays a user-defined counter in the PIX UI.
kindex:
- PIXReportCounter
- PIX, PIXReportCounter
ms.author: jerry.zhou
ms.topic: reference
edited: 00/00/0000
security: public
---

# PIXReportCounter  
  
Displays a user-defined counter in the PIX **System Monitor** view.  
  
## Syntax  
  
```cpp
void PIXReportCounter(  
         PCWSTR name,  
         float value  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The name to display as a string.  
  
*value* &nbsp;&nbsp;  
Type: float  
  
The value to display. This could be a duration, percentage, count, or float value. Consider mapping values to the range 0 to 100, as this range is the clearest in the PIX UI.  
  
### Return value  
Type: void  
  
## Remarks
  
`PIXReportCounter` can be used to track an aspect of a game over time. During runtime, each time a function with the same *name* in called, the *value* parameter is plotted to create a timeline graph in the PIX **System Monitor** view. This can be used to track things like enemies on screen, objects in view, or anything else that might effect the performance of a capture.
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[PIX Counters (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/gpu/pix-counters.md)  
[PIX3](../pix3_members.md)  
[PIX  (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
  