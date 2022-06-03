---
author: joannaleecy
title: HCHttpCallResponseGetStatusCode
description: Get the HTTP status code of the HTTP call response.
kindex: HCHttpCallResponseGetStatusCode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallResponseGetStatusCode  

Get the HTTP status code of the HTTP call response.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetStatusCode(  
         HCCallHandle call,  
         uint32_t* statusCode  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*statusCode* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
the HTTP status code of the HTTP call response.  
  
  
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
  
  