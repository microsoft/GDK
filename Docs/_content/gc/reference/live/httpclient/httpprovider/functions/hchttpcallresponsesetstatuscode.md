---
author: joannaleecy
title: HCHttpCallResponseSetStatusCode
description: Set the HTTP status code of the HTTP call response.
kindex: HCHttpCallResponseSetStatusCode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallResponseSetStatusCode  

Set the HTTP status code of the HTTP call response.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseSetStatusCode(  
         HCCallHandle call,  
         uint32_t statusCode  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*statusCode* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
the HTTP status code of the HTTP call response.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  