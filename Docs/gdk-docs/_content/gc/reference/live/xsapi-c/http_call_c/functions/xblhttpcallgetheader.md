---
author: joannaleecy
title: XblHttpCallGetHeader
description: Get a response header for the HTTP call for a given header name.
kindex: XblHttpCallGetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblHttpCallGetHeader  

Get a response header for the HTTP call for a given header name.  

## Syntax  
  
```cpp
HRESULT XblHttpCallGetHeader(  
         XblHttpCallHandle call,  
         const char* headerName,  
         const char** headerValue  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded response header name for the HTTP call. The memory for the returned string pointer remains valid for the life of the XblHttpCallHandle object until XblHttpCallCloseHandle() is called on it.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded response header value for the HTTP call. Returns nullptr if the header doesn't exist. The memory for the returned string pointer remains valid for the life of the XblHttpCallHandle object until XblHttpCallCloseHandle() is called on it.  
  
  
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
  
  