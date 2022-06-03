---
author: joannaleecy
title: XblContextSettingsGetWebsocketTimeoutWindow
description: Gets the web socket timeout window in seconds.
kindex: XblContextSettingsGetWebsocketTimeoutWindow
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsGetWebsocketTimeoutWindow  

Gets the web socket timeout window in seconds.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsGetWebsocketTimeoutWindow(  
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
  
Passes back the timeout window in seconds.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  