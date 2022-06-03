---
author: joannaleecy
title: XblMultiplayerCreateSearchHandleResult
description: Get the result from an XblMultiplayerCreateSearchHandleAsync.
kindex: XblMultiplayerCreateSearchHandleResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerCreateSearchHandleResult  

Get the result from an XblMultiplayerCreateSearchHandleAsync.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerCreateSearchHandleResult(  
         XAsyncBlock* async,  
         XblMultiplayerSearchHandle* handle  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*handle* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblMultiplayerSearchHandle*](../handles/xblmultiplayersearchhandle.md)  
  
Passes back a handle to the local search handle object. If this parameter is null, the local search handle object will be freed immediately. Note that this does not destroy the search handle on the MPSD service side, that must be done with XblMultiplayerDeleteSearchHandleAsync. If this is non-null, the handle must later be closed with [XblMultiplayerSearchHandleCloseHandle](xblmultiplayersearchhandleclosehandle.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  