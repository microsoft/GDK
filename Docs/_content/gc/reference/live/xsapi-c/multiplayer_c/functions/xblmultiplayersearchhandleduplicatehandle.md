---
author: joannaleecy
title: XblMultiplayerSearchHandleDuplicateHandle
description: Increments the reference count to a local search handle details object.
kindex: XblMultiplayerSearchHandleDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleDuplicateHandle  

Increments the reference count to a local search handle details object.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleDuplicateHandle(  
         XblMultiplayerSearchHandle handle,  
         XblMultiplayerSearchHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSearchHandle*](../handles/xblmultiplayersearchhandle.md)  
  
Passes back the duplicated handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  