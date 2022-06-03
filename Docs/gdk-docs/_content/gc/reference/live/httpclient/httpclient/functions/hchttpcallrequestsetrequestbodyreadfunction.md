---
author: joannaleecy
title: HCHttpCallRequestSetRequestBodyReadFunction
description: Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by HCHttpCallRequestSetRequestBodyBytes or HCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually
  exclusive.
kindex: HCHttpCallRequestSetRequestBodyReadFunction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetRequestBodyReadFunction  

Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by HCHttpCallRequestSetRequestBodyBytes or HCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually exclusive.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetRequestBodyReadFunction(  
         HCCallHandle call,  
         HCHttpCallRequestBodyReadFunction readFunction,  
         size_t bodySize,  
         void* context  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*readFunction* &nbsp;&nbsp;\_In\_  
Type: HCHttpCallRequestBodyReadFunction  
  
The request body read function this call should use.  
  
*bodySize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the body.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
The context associated with this read function.  
  
  
### Return value  
Type: HRESULT
  
Result code of this API operation. Possible values are S_OK or E_INVALIDARG.
  
## Remarks  
  
This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  