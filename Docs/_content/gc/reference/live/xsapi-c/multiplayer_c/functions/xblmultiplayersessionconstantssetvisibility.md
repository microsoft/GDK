---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetVisibility
description: Sets the visibility of this session.
kindex: XblMultiplayerSessionConstantsSetVisibility
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionConstantsSetVisibility  

Sets the visibility of this session.  

## Syntax  
  
```cpp
void XblMultiplayerSessionConstantsSetVisibility(  
         XblMultiplayerSessionHandle handle,  
         XblMultiplayerSessionVisibility visibility  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*visibility* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
New visibility value.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  