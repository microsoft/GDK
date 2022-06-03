---
author: joannaleecy
title: XblHttpCallRequestSetRetryAllowed
description: Sets if retry is allowed for this HTTP call.
kindex: XblHttpCallRequestSetRetryAllowed
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallRequestSetRetryAllowed  

Sets if retry is allowed for this HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallRequestSetRetryAllowed(  
         XblHttpCallHandle call,  
         bool retryAllowed  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*retryAllowed* &nbsp;&nbsp;\_In\_  
Type: bool  
  
If retry is allowed for this HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to true. This must be called prior to calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md).
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  