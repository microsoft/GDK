---
author: joannaleecy
title: XblMultiplayerSessionSessionProperties
description: Get the properties associated with the session. Any player can modify these properties.
kindex: XblMultiplayerSessionSessionProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSessionProperties  

Get the properties associated with the session. Any player can modify these properties.  

## Syntax  
  
```cpp
const XblMultiplayerSessionSessionProperties(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
A pointer to the set of properties associated with this session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  