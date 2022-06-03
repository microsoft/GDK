---
author: joannaleecy
title: XblMultiplayerSessionAddMemberReservation
description: Add a new member reservation on the session for the specified xuid and member constants.
kindex: XblMultiplayerSessionAddMemberReservation
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionAddMemberReservation  

Add a new member reservation on the session for the specified xuid and member constants.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionAddMemberReservation(  
         XblMultiplayerSessionHandle handle,  
         uint64_t xuid,  
         const char* memberCustomConstantsJson,  
         bool initializeRequested  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The xuid to add a reservation for.  
  
*memberCustomConstantsJson* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The custom constants to set for this member. This is the only time the member's constants can be set. (Optional)  
  
*initializeRequested* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True if the system should perform managed initialization, and false otherwise.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  