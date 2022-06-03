---
author: joannaleecy
title: XblMultiplayerSessionSessionReference
description: The uniquely identifying information for the session.
kindex: XblMultiplayerSessionSessionReference
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSessionReference  

The uniquely identifying information for the session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionSessionReference(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
A pointer to the multiplayer session reference. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  