---
author: joannaleecy
title: XblDisableAssertsForXboxLiveThrottlingInDevSandboxes
description: Disables asserts for Xbox Live throttling in dev sandboxes.
kindex: XblDisableAssertsForXboxLiveThrottlingInDevSandboxes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblDisableAssertsForXboxLiveThrottlingInDevSandboxes  

Disables asserts for Xbox Live throttling in dev sandboxes.  

## Syntax  
  
```cpp
void XblDisableAssertsForXboxLiveThrottlingInDevSandboxes(  
         XblConfigSetting setting  
)  
```  
  
### Parameters  
  
*setting* &nbsp;&nbsp;\_In\_  
Type: [XblConfigSetting](../enums/xblconfigsetting.md)  
  
The config settings value to be passed down.  
  
  
### Return value  
Type: void
  
HRESULT return code for this API operation.
  
## Remarks  
  
The asserts will not fire in RETAIL sandbox, and this setting has no affect in RETAIL sandboxes. It is best practice to not call this API, and instead adjust the calling pattern but this is provided as a temporary way to get unblocked while in early stages of game development.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  