---
author: joannaleecy
title: XblContextSettingsGetLongHttpTimeout
description: Gets the connect, send, and receive timeouts for HTTP socket operations of long calls such as Title Storage calls.
kindex: XblContextSettingsGetLongHttpTimeout
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsGetLongHttpTimeout  

Gets the connect, send, and receive timeouts for HTTP socket operations of long calls such as Title Storage calls.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsGetLongHttpTimeout(  
         XblContextHandle context,  
         uint32_t* timeoutInSeconds  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*timeoutInSeconds* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
Passes back the timeout for long HTTP calls in seconds. Default is 5 minutes (300 seconds).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Calls that take longer than the given timeout are aborted.
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  