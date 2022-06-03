---
author: joannaleecy
title: HCHttpCallRequestSetTimeout
description: Sets the timeout for this HTTP call.
kindex: HCHttpCallRequestSetTimeout
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetTimeout  

Sets the timeout for this HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetTimeout(  
         HCCallHandle call,  
         uint32_t timeoutInSeconds  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_opt\_  
Type: HCCallHandle  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*timeoutInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The timeout for this HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to 30 seconds. This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  