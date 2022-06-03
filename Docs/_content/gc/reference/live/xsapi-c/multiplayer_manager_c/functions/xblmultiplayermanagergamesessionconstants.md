---
author: joannaleecy
title: XblMultiplayerManagerGameSessionConstants
description: Retrieves the session constants associated with the game session.
kindex: XblMultiplayerManagerGameSessionConstants
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionConstants  

Retrieves the session constants associated with the game session.  

## Syntax  
  
```cpp
const XblMultiplayerSessionConstants* XblMultiplayerManagerGameSessionConstants(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: const XblMultiplayerSessionConstants*
  
A pointer to the session constants for the game session, or null if a game session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).
  
## Remarks  
  
This function retrieves a pointer to the session constants for a game session, if the game session exists for the lobby session in Multiplayer Manager. The session constants contain constants, such as session visibility and session capabilities, defined by the session template used for the game session. Unlike session properties, session constants can only be set through the session template, and are set at the time the game session is created. For more information about session constants, see [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionPropertiesJson](xblmultiplayermanagergamesessionpropertiesjson.md)  
[XblMultiplayerManagerGameSessionSessionReference](xblmultiplayermanagergamesessionsessionreference.md)
  
  