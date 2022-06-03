---
author: joannaleecy
title: HCHttpCallRequestSetRequestBodyBytes
description: Set the request body bytes of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.
kindex: HCHttpCallRequestSetRequestBodyBytes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetRequestBodyBytes  

Set the request body bytes of the HTTP call. This API operation is mutually exclusive with HCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetRequestBodyBytes(  
         HCCallHandle call,  
         const uint8_t* requestBodyBytes,  
         uint32_t requestBodySize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
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
  
This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  