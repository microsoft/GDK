---
author: joannaleecy
title: XblMultiplayerSessionMatchmakingServer
description: A multiplayer session server that contains properties associated with a target session reference.
kindex: XblMultiplayerSessionMatchmakingServer
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionMatchmakingServer  

A multiplayer session server that contains properties associated with a target session reference.  

## Syntax  
  
```cpp
const XblMultiplayerSessionMatchmakingServer(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
The matchmaking server supporting the multiplayer session. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  