---
author: joannaleecy
title: XblMultiplayerManagerGameSessionMembers
description: Retrieves member information for the members in the game session.
kindex: XblMultiplayerManagerGameSessionMembers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionMembers  

Retrieves member information for the members in the game session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerGameSessionMembers(  
         size_t membersCount,  
         XblMultiplayerManagerMember* members  
)  
```  
  
### Parameters  
  
*membersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `members` array. The required size can be obtained by calling [XblMultiplayerManagerGameSessionMembersCount](xblmultiplayermanagergamesessionmemberscount.md).  
  
*members* &nbsp;&nbsp;\_Out\_writes\_(membersCount)  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
A caller-allocated [XblMultiplayerManagerMember](../structs/xblmultiplayermanagermember.md) array to write into.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function returns member information for each member in a game session. <br />The member information returned by this function is valid only until [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called again.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  