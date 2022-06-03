---
author: joannaleecy
title: HCTraceLevel
description: Diagnostic level used by tracing.
kindex: HCTraceLevel
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCTraceLevel  

Diagnostic level used by tracing.    

## Syntax  
  
```cpp
enum class HCTraceLevel  : uint32_t  
{  
    Off = HC_PRIVATE_TRACE_LEVEL_OFF,  
    Error = HC_PRIVATE_TRACE_LEVEL_ERROR,  
    Warning = HC_PRIVATE_TRACE_LEVEL_WARNING,  
    Important = HC_PRIVATE_TRACE_LEVEL_IMPORTANT,  
    Information = HC_PRIVATE_TRACE_LEVEL_INFORMATION,  
    Verbose = HC_PRIVATE_TRACE_LEVEL_VERBOSE,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Off | No tracing. |  
| Error | Trace only errors. |  
| Warning | Trace warnings and errors. |  
| Important | Trace important, warnings and errors. |  
| Information | Trace info, important, warnings and errors. |  
| Verbose | Trace everything. |  
  
## Requirements  
  
**Header:** trace.h
  
## See also  
[trace](../trace_members.md)  
  
  