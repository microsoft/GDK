---
author: joannaleecy
title: HCTraceImplGetAreaVerbosity
description: Get the trace verbosity level of an trace area.
kindex: HCTraceImplGetAreaVerbosity
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCTraceImplGetAreaVerbosity  

Get the trace verbosity level of an trace area.  

## Syntax  
  
```cpp
HCTraceLevel HCTraceImplGetAreaVerbosity(  
         HCTraceImplArea* area  
)  
```  
  
### Parameters  
  
*area* &nbsp;&nbsp;  
Type: HCTraceImplArea*  
  
The trace area.  
  
  
### Return value  
Type: HCTraceLevel
  
The verbosity level of the area.
  
## Remarks  
  
This should be accessed through macros, such as HC_TRACE_GET_VERBOSITY, rather than called directly.
  
## Requirements  
  
**Header:** trace.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[trace](../trace_members.md)  
  
  