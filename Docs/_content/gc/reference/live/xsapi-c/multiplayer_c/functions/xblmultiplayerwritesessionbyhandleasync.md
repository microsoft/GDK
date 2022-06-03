---
author: joannaleecy
title: XblMultiplayerWriteSessionByHandleAsync
description: Writes a new or updated multiplayer session to the service, using the specified handle to the session.
kindex: XblMultiplayerWriteSessionByHandleAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerWriteSessionByHandleAsync  

Writes a new or updated multiplayer session to the service, using the specified handle to the session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerWriteSessionByHandleAsync(  
         XblContextHandle xblContext,  
         XblMultiplayerSessionHandle multiplayerSession,  
         XblMultiplayerSessionWriteMode writeMode,  
         const char* handleId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*multiplayerSession* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
A MultiplayerSession object that has been modified with the changes to write.  
  
*writeMode* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionWriteMode](../enums/xblmultiplayersessionwritemode.md)  
  
The type of write operation.  
  
*handleId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The ID of the handle that should be used when writing the session.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
A handle is a service-side pointer to a session. The handle ID is a GUID identifier of the handle. Callers will usually get the handleId either from another player's XblMultiplayerActivityDetails via the XblMultiplayerGetActivitiesForUsersAsync() API, or from an invite. Use this method only if your multiplayer session object doesn't have a valid XblMultiplayerSessionReference, as a handle's lifetime may be shorter than that of the session it points to.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  