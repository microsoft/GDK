---
author: joannaleecy
title: XblSetOverrideConfiguration
description: Sets an override configuration for advanced scenarios where a common Service Configuration ID (SCID) and title Id are needed for cross platform experiences.
kindex: XblSetOverrideConfiguration
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSetOverrideConfiguration  

Sets an override configuration for advanced scenarios where a common Service Configuration ID (SCID) and title Id are needed for cross platform experiences.

## Syntax  
  
```cpp
HRESULT XblSetOverrideConfiguration(  
         const char* overrideScid,  
         uint32_t overrideTitleId  
)  
```  
  
### Parameters  
  
*overrideScid* &nbsp;&nbsp;\_In\_  
Type: char*  
  
Override Service Configuration ID (SCID) to be used by multiplayer manager. This SCID is considered case sensitive so paste it directly from the Partner Center  
  
*overrideTitleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Override title Id to be used by multiplayer manager.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Currently only used by multiplayer manager to enable cross platform multiplayer scenarios.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  