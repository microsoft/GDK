---
author: joannaleecy
title: HCHttpCallRequestGetRequestBodyBytes
description: Get the request body bytes of the HTTP call.
kindex: HCHttpCallRequestGetRequestBodyBytes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallRequestGetRequestBodyBytes  

Get the request body bytes of the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetRequestBodyBytes(  
         HCCallHandle call,  
         _Outptr_result_bytebuffer_maybenull_ *requestBodySize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
**requestBodySize* &nbsp;&nbsp;  
Type: _Outptr_result_bytebuffer_maybenull_  
  
The request body size in bytes of the HTTP call.    
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  