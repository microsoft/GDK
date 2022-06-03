---
author: joannaleecy
title: XblMultiplayerSessionMembers
description: Gets the collection of members that are in the session or entering the session together.
kindex: XblMultiplayerSessionMembers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionMembers  

Gets the collection of members that are in the session or entering the session together.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionMembers(  
         XblMultiplayerSessionHandle handle,  
         const XblMultiplayerSessionMember** members,  
         size_t* membersCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*members* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionMember**](../structs/xblmultiplayersessionmember.md)  
  
Passes back a pointer to array of session member ojects. The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.  
  
*membersCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size of the returned array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call XblMultiplayerSessionJoin or XblMultiplayerSessionLeave to add or remove yourself from this list. Call XblMultiplayerSessionAddMemberReservation to add a reservation for another user on this list.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  