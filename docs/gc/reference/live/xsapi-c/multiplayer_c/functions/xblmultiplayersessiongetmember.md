---
author: joannaleecy
title: XblMultiplayerSessionGetMember
description: Gets the session member with a specified MemberId.
kindex: XblMultiplayerSessionGetMember
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionGetMember  

Gets the session member with a specified MemberId.  

## Syntax  
  
```cpp
const XblMultiplayerSessionGetMember(  
         XblMultiplayerSessionHandle handle,  
         uint32_t memberId  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*memberId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The Id of the member to fetch.  
  
  
### Return value  
Type: const
  
A pointer to a member in a multiplayer session. (Read Only) The memory for the returned pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed.
  
## Remarks  
  
If there is no member with the specified Id, nullptr is returned.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  