---
author: joannaleecy
title: XblMultiplayerSessionTimeOfSession
description: The time when the server returned the session.
kindex: XblMultiplayerSessionTimeOfSession
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionTimeOfSession  

The time when the server returned the session.  

## Syntax  
  
```cpp
time_t XblMultiplayerSessionTimeOfSession(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: time_t
  
The time when the server returned the session.
  
## Remarks  
  
Note that this is not part of the remote session state, it only indicates when the local session was created.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  