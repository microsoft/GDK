---
author: joannaleecy
title: XblSocialManagerSetRichPresencePollingStatus
description: Sets whether to enable social manager to poll every 30 seconds from the presence service.
kindex: XblSocialManagerSetRichPresencePollingStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerSetRichPresencePollingStatus  

Sets whether to enable social manager to poll every 30 seconds from the presence service.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerSetRichPresencePollingStatus(  
         XblUserHandle user,  
         bool shouldEnablePolling  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
Xbox Live User to enable polling for.  
  
*shouldEnablePolling* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Whether or not polling should enabled.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  