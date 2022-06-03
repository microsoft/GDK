---
author: joannaleecy
title: HCHttpCallResponseGetResponseString
description: Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.
kindex: HCHttpCallResponseGetResponseString
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetResponseString  

Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using HCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetResponseString(  
         HCCallHandle call,  
         const char** responseString  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*responseString* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
The UTF-8 encoded response body string of the HTTP call. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
  
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
  
  