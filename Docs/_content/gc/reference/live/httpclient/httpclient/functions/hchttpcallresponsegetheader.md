---
author: joannaleecy
title: HCHttpCallResponseGetHeader
description: Get a response header for the HTTP call for a given header name.
kindex: HCHttpCallResponseGetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetHeader  

Get a response header for the HTTP call for a given header name.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetHeader(  
         HCCallHandle call,  
         const char* headerName,  
         const char** headerValue  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded response header name for the HTTP call. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded response header value for the HTTP call. Returns nullptr if the header doesn't exist. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling HCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  