---
author: joannaleecy
title: HCTraceImplSetAreaVerbosity
description: Set the verbosity level of an trace area.
kindex: HCTraceImplSetAreaVerbosity
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCTraceImplSetAreaVerbosity  

Set the verbosity level of an trace area.  

## Syntax  
  
```cpp
void HCTraceImplSetAreaVerbosity(  
         HCTraceImplArea* area,  
         HCTraceLevel verbosity  
)  
```  
  
### Parameters  
  
*area* &nbsp;&nbsp;  
Type: HCTraceImplArea*  
  
The trace area.  
  
*verbosity* &nbsp;&nbsp;  
Type: [HCTraceLevel](../enums/hctracelevel.md)  
  
The verbosity level.  
  
  
### Return value  
Type: void
  
This should be accessed through macros, such as HC_TRACE_SET_VERBOSITY, rather than called directly.
  
## Requirements  
  
**Header:** trace.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[trace](../trace_members.md)  
  
  