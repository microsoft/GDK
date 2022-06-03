---
author: joannaleecy
title: XblMultiplayerSearchHandleGetVisibility
description: Get visibility of the session associated with the search handle.
kindex: XblMultiplayerSearchHandleGetVisibility
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleGetVisibility  

Get visibility of the session associated with the search handle.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetVisibility(  
         XblMultiplayerSearchHandle handle,  
         XblMultiplayerSessionVisibility* visibility  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*visibility* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionVisibility*](../enums/xblmultiplayersessionvisibility.md)  
  
Passes back the visibility of the associated session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  