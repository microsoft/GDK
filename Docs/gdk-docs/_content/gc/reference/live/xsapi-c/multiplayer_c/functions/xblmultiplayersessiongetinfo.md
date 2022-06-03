---
author: joannaleecy
title: XblMultiplayerSessionGetInfo
description: Gets some basic info about the session. Represents the info in the root of the MPSD session document.
kindex: XblMultiplayerSessionGetInfo
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionGetInfo  

Gets some basic info about the session. Represents the info in the root of the MPSD session document.  

## Syntax  
  
```cpp
const XblMultiplayerSessionGetInfo(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
A pointer to the basic info about the local multiplayer session. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  