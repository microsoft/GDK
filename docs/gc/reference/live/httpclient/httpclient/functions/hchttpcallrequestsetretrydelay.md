---
author: joannaleecy
title: HCHttpCallRequestSetRetryDelay
description: Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds.
kindex: HCHttpCallRequestSetRetryDelay
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestSetRetryDelay  

Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestSetRetryDelay(  
         HCCallHandle call,  
         uint32_t retryDelayInSeconds  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_opt\_  
Type: HCCallHandle  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*retryDelayInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The retry delay in seconds.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Retries are delayed using an exponential back off. By default, it will delay 2 seconds then the next retry will delay 4 seconds, then 8 seconds, and so on up to a max of 1 min until either the call succeeds or the HTTP timeout window is reached, at which point the call will fail. The delay is also jittered between the current and next delay to spread out service load. The default for the HTTP timeout window is 20 seconds and can be changed using HCSettingsSetTimeoutWindow()<br /><br /> If the service returns an HTTP error with a "Retry-After" header, then all future calls to that API will immediately fail with the original error without contacting the service until the "Retry-After" time has been reached.<br /><br /> Idempotent service calls are retried when a network error occurs or the server responds with<br /> one of these HTTP status codes:<br /> 408 (Request Timeout)<br /> 429 (Too Many Requests)<br /> 500 (Internal Server Error)<br /> 502 (Bad Gateway)<br /> 503 (Service Unavailable)<br /> 504 (Gateway Timeout)<br /><br /> This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  