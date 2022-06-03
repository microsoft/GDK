---
author: joannaleecy
title: XblContextSettingsSetHttpRetryDelay
description: Sets the HTTP retry delay in seconds.
kindex: XblContextSettingsSetHttpRetryDelay
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsSetHttpRetryDelay  

Sets the HTTP retry delay in seconds.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsSetHttpRetryDelay(  
         XblContextHandle context,  
         uint32_t delayInSeconds  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*delayInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The retry delay in seconds. Retries are delayed using an exponential back off. By default, it will delay 2 seconds then the next retry will delay 4 seconds, then 8 seconds, and so on up to a max of 1 min until either the call succeeds or the http_timeout_window is reached, at which point the call will fail. The delay is also jittered between the current and next delay to spread out service load. The default for http_timeout_window is 20 seconds and can be changed using XblContextSettingsSetHttpTimeoutWindow.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
If the service returns an HTTP error with a "Retry-After" header, then all future calls to that API will immediately fail with the original error without contacting the service until the "Retry-After" time has been reached. <br /> Idempotent service calls are retried when a network error occurs or the server responds with one of these HTTP status codes:<br /> 408 (Request Timeout)<br /> 429 (Too Many Requests)<br /> 500 (Internal Server Error)<br /> 502 (Bad Gateway)<br /> 503 (Service Unavailable)<br /> 504 (Gateway Timeout)<br />
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  