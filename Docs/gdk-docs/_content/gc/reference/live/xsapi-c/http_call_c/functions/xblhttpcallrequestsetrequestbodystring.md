---
author: joannaleecy
title: XblHttpCallRequestSetRequestBodyString
description: Set the request body string of the HTTP call.
kindex: XblHttpCallRequestSetRequestBodyString
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallRequestSetRequestBodyString  

Set the request body string of the HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallRequestSetRequestBodyString(  
         XblHttpCallHandle call,  
         const char* requestBodyString  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*requestBodyString* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded request body string of the HTTP call.  
  
  
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
  
  