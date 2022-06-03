---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionIsHost
description: Indicates whether the specified user is the host for the lobby session.
kindex: XblMultiplayerManagerLobbySessionIsHost
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionIsHost  

Indicates whether the specified user is the host for the lobby session.  

## Syntax  
  
```cpp
bool XblMultiplayerManagerLobbySessionIsHost(  
         uint64_t xuid  
)  
```  
  
### Parameters  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID (XUID) of the user.  
  
  
### Return value  
Type: bool
  
Returns true if the XUID is the host of the lobby session; otherwise, false.
  
## Remarks  
  
This function returns false if a lobby session doesn't exist, or if the Xbox User ID (XUID) specified in `xuid` isn't the host for the lobby session. You can retrieve the host for a lobby session by calling [XblMultiplayerManagerLobbySessionHost](xblmultiplayermanagerlobbysessionhost.md). For more information, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionSetSynchronizedHost](xblmultiplayermanagerlobbysessionsetsynchronizedhost.md)
  
  