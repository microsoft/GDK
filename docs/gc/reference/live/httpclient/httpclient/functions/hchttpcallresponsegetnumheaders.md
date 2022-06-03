---
author: joannaleecy
title: HCHttpCallResponseGetNumHeaders
description: Gets the number of response headers in the HTTP call.
kindex: HCHttpCallResponseGetNumHeaders
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetNumHeaders  

Gets the number of response headers in the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetNumHeaders(  
         HCCallHandle call,  
         uint32_t* numHeaders  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*numHeaders* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
The number of response headers in the HTTP call.  
  
  
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
  
  