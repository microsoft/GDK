---
author: joannaleecy
title: XblHttpCallGetNumHeaders
description: Gets the number of response headers in the HTTP call.
kindex: XblHttpCallGetNumHeaders
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallGetNumHeaders  

Gets the number of response headers in the HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallGetNumHeaders(  
         XblHttpCallHandle call,  
         uint32_t* numHeaders  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*numHeaders* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
The number of response headers in the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md) when the HTTP task is completed.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  