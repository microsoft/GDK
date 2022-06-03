---
author: joannaleecy
title: HCHttpCallResponseGetResponseBodyBytes
description: Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.
kindex: HCHttpCallResponseGetResponseBodyBytes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetResponseBodyBytes  

Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetResponseBodyBytes(  
         HCCallHandle call,  
         size_t bufferSize,  
         uint8_t* buffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The response body buffer size being passed in.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_opt\_(bufferSize,*bufferUsed)  
Type: uint8_t*  
  
The buffer to be written to.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The actual number of bytes written to the buffer.  
  
  
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
  
  