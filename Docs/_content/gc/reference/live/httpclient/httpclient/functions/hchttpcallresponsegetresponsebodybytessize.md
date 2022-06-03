---
author: joannaleecy
title: HCHttpCallResponseGetResponseBodyBytesSize
description: Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.
kindex: HCHttpCallResponseGetResponseBodyBytesSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetResponseBodyBytesSize  

Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetResponseBodyBytesSize(  
         HCCallHandle call,  
         size_t* bufferSize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*bufferSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The response body buffer size of the HTTP call.  
  
  
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
  
  