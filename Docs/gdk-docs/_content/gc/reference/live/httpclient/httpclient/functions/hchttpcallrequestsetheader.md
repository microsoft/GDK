---
author: joannaleecy
title: HCHttpCallRequestSetHeader
description: Set a request header for the HTTP call.
kindex: HCHttpCallRequestSetHeader
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetHeader  

Set a request header for the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetHeader(  
         HCCallHandle call,  
         const char* headerName,  
         const char* headerValue,  
         bool allowTracing  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*headerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded request header name for the HTTP call.  
  
*headerValue* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded request header value for the HTTP call.  
  
*allowTracing* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Set to false to skip tracing this request header, for example if it contains private information.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  