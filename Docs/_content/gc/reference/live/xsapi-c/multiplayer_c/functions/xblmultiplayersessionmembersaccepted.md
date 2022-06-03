---
author: joannaleecy
title: XblMultiplayerSessionMembersAccepted
description: The number of members that have accepted and are added to the session and are no longer pending.
kindex: XblMultiplayerSessionMembersAccepted
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionMembersAccepted  

The number of members that have accepted and are added to the session and are no longer pending.  

## Syntax  
  
```cpp
uint32_t XblMultiplayerSessionMembersAccepted(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: uint32_t
  
The number of members that have accepted.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  