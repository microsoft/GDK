---
author: joannaleecy
title: XblMultiplayerGetSearchHandlesResult
description: Get handles to the local search handle objects returned from XblMultiplayerGetSearchHandlesAsync call.
kindex: XblMultiplayerGetSearchHandlesResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSearchHandlesResult  

Get handles to the local search handle objects returned from XblMultiplayerGetSearchHandlesAsync call.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSearchHandlesResult(  
         XAsyncBlock* async,  
         XblMultiplayerSearchHandle* searchHandles,  
         size_t searchHandlesCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*searchHandles* &nbsp;&nbsp;\_Out\_writes\_(searchHandlesCount)  
Type: [XblMultiplayerSearchHandle*](../handles/xblmultiplayersearchhandle.md)  
  
A caller allocated array to pass back the search handle results. Each handle must later be closed with [XblMultiplayerSearchHandleCloseHandle](xblmultiplayersearchhandleclosehandle.md).  
  
*searchHandlesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of search handles array. Use [XblMultiplayerGetSearchHandlesResultCount](xblmultiplayergetsearchhandlesresultcount.md) to get the count required.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  