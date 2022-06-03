---
author: joannaleecy
title: HCHttpCallRequestGetRequestBodyReadFunction
description: Get the function used by the HTTP call to read the request body
kindex: HCHttpCallRequestGetRequestBodyReadFunction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestGetRequestBodyReadFunction  

Get the function used by the HTTP call to read the request body  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetRequestBodyReadFunction(  
         HCCallHandle call,  
         HCHttpCallRequestBodyReadFunction* readFunction,  
         size_t* bodySize,  
         void** context  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*readFunction* &nbsp;&nbsp;\_Out\_  
Type: HCHttpCallRequestBodyReadFunction*  
  
The read function of this HTTP call.  
  
*bodySize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size of the body.    
  
*context* &nbsp;&nbsp;\_Out\_  
Type: void**  
  
The context associated with this read function.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  