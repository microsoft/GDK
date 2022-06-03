---
author: joannaleecy
title: XblContextSettingsSetWebsocketTimeoutWindow
description: Sets the web socket timeout window in seconds.
kindex: XblContextSettingsSetWebsocketTimeoutWindow
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsSetWebsocketTimeoutWindow  

Sets the web socket timeout window in seconds.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsSetWebsocketTimeoutWindow(  
         XblContextHandle context,  
         uint32_t timeoutWindowInSeconds  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*timeoutWindowInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The timeout window in seconds. Default is 300 seconds. Set to 0 to turn off retry.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Controls how long to spend attempting to retry establishing a web socket connection before failing.
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  