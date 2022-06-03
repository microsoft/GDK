---
author: joannaleecy
title: XblHttpCallRequestSetRequestBodyBytes
description: Set the request body bytes of the HTTP call.
kindex: XblHttpCallRequestSetRequestBodyBytes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallRequestSetRequestBodyBytes  

Set the request body bytes of the HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallRequestSetRequestBodyBytes(  
         XblHttpCallHandle call,  
         const uint8_t* requestBodyBytes,  
         uint32_t requestBodySize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*requestBodyBytes* &nbsp;&nbsp;\_In\_reads\_bytes\_(requestBodySize)  
Type: uint8_t*  
  
The request body bytes of the HTTP call.  
  
*requestBodySize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The length in bytes of the body being set.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md).
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  