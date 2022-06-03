---
author: joannaleecy
title: HCSettingsSetTraceLevel
description: Sets the trace level for the library. Traces are sent the debug output.
kindex: HCSettingsSetTraceLevel
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCSettingsSetTraceLevel  

Sets the trace level for the library. Traces are sent the debug output.  

## Syntax  
  
```cpp
HRESULT HCSettingsSetTraceLevel(  
         HCTraceLevel traceLevel  
)  
```  
  
### Parameters  
  
*traceLevel* &nbsp;&nbsp;\_In\_  
Type: [HCTraceLevel](../enums/hctracelevel.md)  
  
Trace level.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** trace.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[trace](../trace_members.md)  
  
  