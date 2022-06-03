---
author: joannaleecy
title: XblHttpCallGetResponseString
description: Get the response body string of the HTTP call.
kindex: XblHttpCallGetResponseString
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallGetResponseString  

Get the response body string of the HTTP call.  

## Syntax  
  
```cpp
HRESULT XblHttpCallGetResponseString(  
         XblHttpCallHandle call,  
         const char** responseString  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*responseString* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
The UTF-8 encoded response body string of the HTTP call. The memory for the returned string pointer remains valid for the life of the XblHttpCallHandle object until XblHttpCallCloseHandle() is called on it.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md) when the HTTP task is completed. This will only be valid if the responsetype passed to PerformAsync was String.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  