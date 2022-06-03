---
author: joannaleecy
title: XblContextSettingsGetHttpTimeoutWindow
description: Gets the HTTP timeout window in seconds.
kindex: XblContextSettingsGetHttpTimeoutWindow
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsGetHttpTimeoutWindow  

Gets the HTTP timeout window in seconds.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsGetHttpTimeoutWindow(  
         XblContextHandle context,  
         uint32_t* timeoutWindowInSeconds  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*timeoutWindowInSeconds* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
Passes back the timeout window in seconds. The default is 20 seconds.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This controls how long to spend attempting to retry idempotent service calls before failing.<br /><br /> Idempotent service calls are retried when a network error occurs or the server responds with one of these HTTP status codes:<br /> 408 (Request Timeout)<br /> 429 (Too Many Requests)<br /> 500 (Internal Server Error)<br /> 502 (Bad Gateway)<br /> 503 (Service Unavailable)<br /> 504 (Gateway Timeout)<br />
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  