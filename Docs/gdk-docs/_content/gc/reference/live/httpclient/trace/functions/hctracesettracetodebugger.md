---
author: joannaleecy
title: HCTraceSetTraceToDebugger
description: Sets or unsets if the trace is sent to the debugger.
kindex: HCTraceSetTraceToDebugger
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCTraceSetTraceToDebugger  

Sets or unsets if the trace is sent to the debugger.  

## Syntax  
  
```cpp
void HCTraceSetTraceToDebugger(  
         bool traceToDebugger  
)  
```  
  
### Parameters  
  
*traceToDebugger* &nbsp;&nbsp;\_In\_  
Type: bool  
  
If True, sends the trace to the debugger.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** trace.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[trace](../trace_members.md)  
  
  