---
author: joannaleecy
title: HCHttpCallRequestSetRequestBodyString
description: Set the request body string of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.
kindex: HCHttpCallRequestSetRequestBodyString
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetRequestBodyString  

Set the request body string of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetRequestBodyString(  
         HCCallHandle call,  
         const char* requestBodyString  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*requestBodyString* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded request body string of the HTTP call.  
  
  
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
  
  