---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionLocalMembers
description: Retrieves member information for the local members in the lobby session.
kindex: XblMultiplayerManagerLobbySessionLocalMembers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionLocalMembers  

Retrieves member information for the local members in the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionLocalMembers(  
         size_t localMembersCount,  
         XblMultiplayerManagerMember* localMembers  
)  
```  
  
### Parameters  
  
*localMembersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `localMembers` array. The required size can be obtained by calling [XblMultiplayerManagerLobbySessionLocalMembersCount](xblmultiplayermanagerlobbysessionlocalmemberscount.md).  
  
*localMembers* &nbsp;&nbsp;\_Out\_writes\_(localMembersCount)  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
A caller-allocated [XblMultiplayerManagerMember](../structs/xblmultiplayermanagermember.md) array to write into.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function returns member information for each member in the lobby session that is local to the device. You can also call the [XblMultiplayerManagerLobbySessionMembers](xblmultiplayermanagerlobbysessionmembers.md) function to return member information for all members in the lobby session. <br />The member information returned by this function is valid only until [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called again.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionMembersCount](xblmultiplayermanagerlobbysessionmemberscount.md)
  
  