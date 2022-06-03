---
author: joannaleecy
title: XblMultiplayerGetSearchHandlesResultCount
description: Get the number of search handles returned from an XblMultiplayerGetSearchHandlesAsync call.
kindex: XblMultiplayerGetSearchHandlesResultCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSearchHandlesResultCount  

Get the number of search handles returned from an XblMultiplayerGetSearchHandlesAsync call.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSearchHandlesResultCount(  
         XAsyncBlock* async,  
         size_t* searchHandleCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*searchHandleCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of search results.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  