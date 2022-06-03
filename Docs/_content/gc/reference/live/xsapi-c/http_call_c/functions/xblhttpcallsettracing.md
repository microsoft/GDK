---
author: joannaleecy
title: XblHttpCallSetTracing
description: Enables or disables tracing for this specific HTTP call.
kindex: XblHttpCallSetTracing
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallSetTracing  

Enables or disables tracing for this specific HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallSetTracing(  
         XblHttpCallHandle call,  
         bool traceCall  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*traceCall* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Trace this call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Defaults to true.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  