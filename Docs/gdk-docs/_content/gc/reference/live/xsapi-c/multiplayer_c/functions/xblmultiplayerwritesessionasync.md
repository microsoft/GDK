---
author: joannaleecy
title: XblMultiplayerWriteSessionAsync
description: Writes a new or updated multiplayer session to the service. The session must have a valid session reference. If it was not created with one, use XblMultiplayerWriteSessionByHandleAsync instead.
kindex: XblMultiplayerWriteSessionAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerWriteSessionAsync  

Writes a new or updated multiplayer session to the service. The session must have a valid session reference. If it was not created with one, use XblMultiplayerWriteSessionByHandleAsync instead.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerWriteSessionAsync(  
         XblContextHandle xblContext,  
         XblMultiplayerSessionHandle multiplayerSession,  
         XblMultiplayerSessionWriteMode writeMode,  
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
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
In the async callback, call XblMultiplayerWriteSessionResult() to get a XblMultiplayerSessionHandle handle. Use that handle to call XblMultiplayerSessionWriteStatus() to get the write status. The call to XblMultiplayerWriteSessionAsync() will only fail if the args passed to it are invalid or in very rare cases where it could not start the async task.
  
## REST Call  
  
Calls V105 PUT /serviceconfigs/{serviceConfigurationId}/sessionTemplates/{sessiontemplateName}/sessions/{sessionName}
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  