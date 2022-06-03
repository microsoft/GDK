---
author: joannaleecy
title: XblMultiplayerClearActivityAsync
description: Clears the user's current activity session for the specified serviceConfigurationId.
kindex: XblMultiplayerClearActivityAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerClearActivityAsync  

Clears the user's current activity session for the specified serviceConfigurationId.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerClearActivityAsync(  
         XblContextHandle xblContext,  
         const char* scid,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*scid* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) in which to clear activity. The SCID is considered case sensitive so paste it directly from the Partner Center  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  