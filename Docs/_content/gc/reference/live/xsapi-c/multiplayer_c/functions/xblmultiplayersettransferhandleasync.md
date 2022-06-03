---
author: joannaleecy
title: XblMultiplayerSetTransferHandleAsync
description: The access rights the caller has to the origin session are extended to the target session.
kindex: XblMultiplayerSetTransferHandleAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSetTransferHandleAsync  

The access rights the caller has to the origin session are extended to the target session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSetTransferHandleAsync(  
         XblContextHandle xblContext,  
         XblMultiplayerSessionReference targetSessionReference,  
         XblMultiplayerSessionReference originSessionReference,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*targetSessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md)  
  
Target XblMultiplayerSessionReference for the session you want to extend the access rights for.  
  
*originSessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md)  
  
Origin XblMultiplayerSessionReference for the session that grants access to the target session.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
For example, in a title with a lobby session and a game session, the title could put a transfer handle linking the lobby to the game inside the lobby session. Users invited to the lobby can use the handle to join the game session as well. The transfer handle is deleted once the target session is deleted.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  