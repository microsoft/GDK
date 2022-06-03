---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionSessionReference
description: Retrieves the session reference for the lobby session.
kindex: XblMultiplayerManagerLobbySessionSessionReference
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionSessionReference  

Retrieves the session reference for the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionSessionReference(  
         XblMultiplayerSessionReference* sessionReference  
)  
```  
  
### Parameters  
  
*sessionReference* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionReference*](../../multiplayer_c/structs/xblmultiplayersessionreference.md)  
  
Passes back a pointer to the session reference for the lobby session, or null if a lobby session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function retrieves a pointer to the session reference for the lobby session, if the lobby session exists in Multiplayer Manager. The session reference contains the service configuration ID (SCID), session template, and session name for the lobby session, and uniquely identifies the lobby session in Multiplayer Session Directory (MPSD). For more information about session references, see [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionCorrelationId](xblmultiplayermanagerlobbysessioncorrelationid.md)  
[XblMultiplayerManagerGameSessionSessionReference](xblmultiplayermanagergamesessionsessionreference.md)
  
  