---
author: joannaleecy
title: XblMultiplayerSessionSetMatchmakingTargetSessionConstantsJson
description: Sets the properties of the matchmaking. This should only be set by a client acting as a matchmaking service.
kindex: XblMultiplayerSessionSetMatchmakingTargetSessionConstantsJson
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetMatchmakingTargetSessionConstantsJson  

Sets the properties of the matchmaking. This should only be set by a client acting as a matchmaking service.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionSetMatchmakingTargetSessionConstantsJson(  
         XblMultiplayerSessionHandle handle,  
         const char* matchmakingTargetSessionConstantsJson  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*matchmakingTargetSessionConstantsJson* &nbsp;&nbsp;\_In\_  
Type: char*  
  
A JSON string representing the target session constants.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  