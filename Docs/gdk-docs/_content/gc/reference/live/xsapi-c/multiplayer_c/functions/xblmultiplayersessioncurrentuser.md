---
author: joannaleecy
title: XblMultiplayerSessionCurrentUser
description: Returns the current User in the session.
kindex: XblMultiplayerSessionCurrentUser
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCurrentUser  

Returns the current User in the session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionCurrentUser(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: const
  
The current User in the session. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Remarks  
  
A nullptr will be returned if there is no current user in the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  