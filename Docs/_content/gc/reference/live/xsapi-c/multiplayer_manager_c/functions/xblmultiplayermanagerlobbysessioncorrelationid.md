---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionCorrelationId
description: Retrieves the correlation handle for the lobby session.
kindex: XblMultiplayerManagerLobbySessionCorrelationId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionCorrelationId  

Retrieves the correlation handle for the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionCorrelationId(  
         XblGuid* correlationId  
)  
```  
  
### Parameters  
  
*correlationId* &nbsp;&nbsp;\_Out\_  
Type: [XblGuid*](../../types_c/structs/xblguid.md)  
  
Passes back the correlation handle for the lobby session, or null if a lobby session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function retrieves the correlation handle for the lobby session in Multiplayer Manager (MPM). The correlation handle serves as an alias for the lobby session, allowing a game to refer to a lobby session by using only the correlation handle. The correlation handle can be used to query trace logs for entries that relate to the lobby session. For more information, see [Multiplayer concepts overview](../../../../../live/features/multiplayer/concepts/live-multiplayer-concepts.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionSessionReference](xblmultiplayermanagerlobbysessionsessionreference.md)
  
  