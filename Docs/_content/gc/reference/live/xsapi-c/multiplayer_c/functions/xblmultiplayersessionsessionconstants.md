---
author: joannaleecy
title: XblMultiplayerSessionSessionConstants
description: A set of constants associated with this session. These can only be set when creating the session.
kindex: XblMultiplayerSessionSessionConstants
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSessionConstants  

A set of constants associated with this session. These can only be set when creating the session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionSessionConstants(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
A pointer to the constant values used in the multiplayer session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  