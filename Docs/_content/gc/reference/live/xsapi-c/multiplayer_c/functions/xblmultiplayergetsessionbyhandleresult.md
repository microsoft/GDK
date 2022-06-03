---
author: joannaleecy
title: XblMultiplayerGetSessionByHandleResult
description: Gets the result of an XblMultiplayerGetSessionByHandleAsync call.
kindex: XblMultiplayerGetSessionByHandleResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSessionByHandleResult  

Gets the result of an XblMultiplayerGetSessionByHandleAsync call.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSessionByHandleResult(  
         XAsyncBlock* async,  
         XblMultiplayerSessionHandle* handle  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*handle* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionHandle*](../handles/xblmultiplayersessionhandle.md)  
  
Passes back a handle to a new instance of a local multiplayer session object. It must be release by the caller with [XblMultiplayerSessionCloseHandle](xblmultiplayersessionclosehandle.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
If the session does not exist, this API will return __HRESULT_FROM_WIN32(ERROR_RESOURCE_DATA_NOT_FOUND) and a null XblMultiplayerSessionHandle.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  