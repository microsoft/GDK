---
author: joannaleecy
title: XblMultiplayerManagerGameSessionHost
description: Retrieves member information for the host member in the game session.
kindex: XblMultiplayerManagerGameSessionHost
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionHost  

Retrieves member information for the host member in the game session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerGameSessionHost(  
         XblMultiplayerManagerMember* hostMember  
)  
```  
  
### Parameters  
  
*hostMember* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
A caller-allocated structure to be populated with member information for the host member.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation. Returns `__HRESULT_FROM_WIN32(ERROR_NO_SUCH_USER)` if a host member doesn't exist.
  
## Remarks  
  
This function retrieves member information about the member that represents the host for a game session. If a game session doesn't exist, or if a host member doesn't exist for the game session, the function returns `__HRESULT_FROM_WIN32(ERROR_NO_SUCH_USER)`. The host member is defined as the user with the lowest index on the host device. <br />The information returned by this function is valid only until [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called again.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionMembers](xblmultiplayermanagergamesessionmembers.md)  
[XblMultiplayerManagerGameSessionIsHost](xblmultiplayermanagergamesessionishost.md)
  
  