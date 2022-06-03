---
author: joannaleecy
title: XblMultiplayerWriteSessionResult
description: Gets the result of a XblMultiplayerWriteSessionAsync operation.
kindex: XblMultiplayerWriteSessionResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerWriteSessionResult  

Gets the result of a XblMultiplayerWriteSessionAsync operation.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerWriteSessionResult(  
         XAsyncBlock* async,  
         XblMultiplayerSessionHandle* handle  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*handle* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionHandle*](../handles/xblmultiplayersessionhandle.md)  
  
Passes back a handle to a new instance of a local multiplayer session object. The XblMultiplayerSessionHandle must be released by the caller by calling [XblMultiplayerSessionCloseHandle](xblmultiplayersessionclosehandle.md). Use XblMultiplayerSession* APIs to get session data from the handle. If the updated session object is not needed, passing nullptr will cause the new multiplayer session object to be cleaned up immediately.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation. It will be a failure HRESULT if there was a network error or failure HTTP status code unless its a 412 (Precondition Failed). A 412 returns success since the service also returns latest session state, so you must call XblMultiplayerSessionWriteStatus() to get the write status and call XblMultiplayerSession* APIs to get session data from the handle.
  
## Remarks  
  
Note that if you leave a session that you are the last member of and the sessionEmptyTimeout is equal to 0, then the session will be deleted immediately. Call XblMultiplayerSessionWriteStatus() to get the write status.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  