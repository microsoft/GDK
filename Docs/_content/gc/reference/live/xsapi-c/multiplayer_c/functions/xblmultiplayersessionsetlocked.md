---
author: joannaleecy
title: XblMultiplayerSessionSetLocked
description: Sets if a session is locked or not. If locked, members that leave the session will be able to come back into the session, allowing no additional users to take that spot.
kindex: XblMultiplayerSessionSetLocked
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetLocked  

Sets if a session is locked or not. If locked, members that leave the session will be able to come back into the session, allowing no additional users to take that spot.  

## Syntax  
  
```cpp
void XblMultiplayerSessionSetLocked(  
         XblMultiplayerSessionHandle handle,  
         bool locked  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*locked* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Set true, if the session should be lock, false otherwise.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
If the session is locked, it must also be set to closed.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  