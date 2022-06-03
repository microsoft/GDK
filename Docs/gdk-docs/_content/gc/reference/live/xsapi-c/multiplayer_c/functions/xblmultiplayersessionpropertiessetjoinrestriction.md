---
author: joannaleecy
title: XblMultiplayerSessionPropertiesSetJoinRestriction
description: Restricts who can join "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.)
kindex: XblMultiplayerSessionPropertiesSetJoinRestriction
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionPropertiesSetJoinRestriction  

Restricts who can join "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.)  

## Syntax  
  
```cpp
void XblMultiplayerSessionPropertiesSetJoinRestriction(  
         XblMultiplayerSessionHandle handle,  
         XblMultiplayerSessionRestriction joinRestriction  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*joinRestriction* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionRestriction](../enums/xblmultiplayersessionrestriction.md)  
  
New join restriction value.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
Defaults to "none". If "local", only users whose token's DeviceId matches someone else already in the session and "active": true. If "followed", only local users (as defined above) and users who are followed by an existing (not reserved) member of the session can join without a reservation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  