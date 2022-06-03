---
author: joannaleecy
title: XblMultiplayerGetSessionByHandleAsync
description: Gets a session object with all its attributes from the server, given a session handle id.
kindex: XblMultiplayerGetSessionByHandleAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSessionByHandleAsync  

Gets a session object with all its attributes from the server, given a session handle id.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSessionByHandleAsync(  
         XblContextHandle xblContext,  
         const char* handleId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*handleId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
A multiplayer handle id, which uniquely identifies the session.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
A handle is a service-side pointer to a session. The handleId is a GUID identifier of the handle. Callers will usually get the handleId either from another player's XblMultiplayerActivityDetails, or from an invite.
  
## REST Call  
  
Calls GET /handles/{handleId}/session
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  