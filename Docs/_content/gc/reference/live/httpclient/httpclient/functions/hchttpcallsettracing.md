---
author: joannaleecy
title: HCHttpCallSetTracing
description: Enables or disables tracing for this specific HTTP call.
kindex: HCHttpCallSetTracing
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallSetTracing  

Enables or disables tracing for this specific HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallSetTracing(  
         HCCallHandle call,  
         bool traceCall  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*traceCall* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Trace this call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  