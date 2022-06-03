---
author: joannaleecy
title: XblContextSettingsSetLongHttpTimeout
description: Sets the connect, send, and receive timeouts for HTTP socket operations of long calls such as Title Storage calls.
kindex: XblContextSettingsSetLongHttpTimeout
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblContextSettingsSetLongHttpTimeout  

Sets the connect, send, and receive timeouts for HTTP socket operations of long calls such as Title Storage calls.  

## Syntax  
  
```cpp
HRESULT XblContextSettingsSetLongHttpTimeout(  
         XblContextHandle context,  
         uint32_t timeoutInSeconds  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context that the settings are associated with.  
  
*timeoutInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The timeout for long HTTP calls in seconds. Default is 5 minutes (300 seconds).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Calls that take longer than the given timeout are aborted. Take care when setting this to smaller values as some calls like Title Storage may take a few minutes to complete.
  
## Requirements  
  
**Header:** xbox_live_context_settings_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_context_settings_c](../xbox_live_context_settings_c_members.md)  
  
  