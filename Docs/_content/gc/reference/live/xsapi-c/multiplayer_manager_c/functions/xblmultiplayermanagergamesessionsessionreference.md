---
author: joannaleecy
title: XblMultiplayerManagerGameSessionSessionReference
description: Retrieves the session reference for the game session.
kindex: XblMultiplayerManagerGameSessionSessionReference
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionSessionReference  

Retrieves the session reference for the game session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionReference* XblMultiplayerManagerGameSessionSessionReference(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: const XblMultiplayerSessionReference*
  
A pointer to the session reference for the game session, or null if a game session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).
  
## Remarks  
  
This function retrieves a pointer to the session reference for a game session, if the game session exists for the lobby session in Multiplayer Manager. The session reference contains the service configuration ID (SCID), session template, and session name for the game session, and uniquely identifies the game session in Multiplayer Session Directory (MPSD). For more information about session references, see [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionCorrelationId](xblmultiplayermanagergamesessioncorrelationid.md)  
[XblMultiplayerManagerLobbySessionSessionReference](xblmultiplayermanagerlobbysessionsessionreference.md)
  
  