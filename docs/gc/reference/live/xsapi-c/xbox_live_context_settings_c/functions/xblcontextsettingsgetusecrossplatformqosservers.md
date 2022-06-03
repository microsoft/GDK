---
author: joannaleecy
title: XblContextSettingsGetUseCrossPlatformQosServers
description: Gets whether to use the xplatqos server for QoS calls.
kindex: XblContextSettingsGetUseCrossPlatformQosServers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsGetUseCrossPlatformQosServers  

Gets whether to use the xplatqos server for QoS calls.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsGetUseCrossPlatformQosServers(  
         XblContextHandle context,  
         bool* value  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*value* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Passes back true if the cross platform QoS servers should be used, false otherwise.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  