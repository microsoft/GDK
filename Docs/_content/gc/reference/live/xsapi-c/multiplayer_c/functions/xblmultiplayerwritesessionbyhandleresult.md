---
author: joannaleecy
title: XblMultiplayerWriteSessionByHandleResult
description: Gets the result of a XblMultiplayerWriteSessionAsync operation.
kindex: XblMultiplayerWriteSessionByHandleResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerWriteSessionByHandleResult  

Gets the result of a XblMultiplayerWriteSessionAsync operation.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerWriteSessionByHandleResult(  
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
  
Passes back a handle to a new instance of a local multiplayer session object. It must be release by the caller with [XblMultiplayerSessionCloseHandle](xblmultiplayersessionclosehandle.md). If the updated session object is not needed, passing nullptr will cause the new multiplayer session object to be cleaned up immediately.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Note that if you leave a session that you are the last member of and the sessionEmptyTimeout is equal to 0, then the session will be deleted immediately and a nullptr will be returned.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  