---
author: joannaleecy
title: XblPresenceTrackAdditionalTitles
description: Configures the list of titles for which real-time title presence will be tracked. To receive title presence updates for titles other than the current title, they must be added using this API.
kindex: XblPresenceTrackAdditionalTitles
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceTrackAdditionalTitles  

Configures the list of titles for which real-time title presence will be tracked. To receive title presence updates for titles other than the current title, they must be added using this API.  

## Syntax  
  
```cpp
HRESULT XblPresenceTrackAdditionalTitles(  
         XblContextHandle xblContextHandle,  
         const uint32_t* titleIds,  
         size_t titleIdsCount  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*titleIds* &nbsp;&nbsp;\_In\_  
Type: uint32_t*  
  
Array of title IDs to append to the existing list of tracked titles. Note that the current title will be tracked by default.  
  
*titleIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Length of the titleIds array.    
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Updates will be delivered via XblPresenceTitlePresenceChangedHandlers. Note that the set of tracked titles can be updated independent from the handlers.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  