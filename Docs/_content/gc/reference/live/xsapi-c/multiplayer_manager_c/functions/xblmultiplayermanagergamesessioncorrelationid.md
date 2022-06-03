---
author: joannaleecy
title: XblMultiplayerManagerGameSessionCorrelationId
description: Retrieves the correlation handle for the game session.
kindex: XblMultiplayerManagerGameSessionCorrelationId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionCorrelationId  

Retrieves the correlation handle for the game session.  

## Syntax  
  
```cpp
const char* XblMultiplayerManagerGameSessionCorrelationId(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: const char*
  
The correlation handle for the game session, or null if a game session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).
  
## Remarks  
  
This function retrieves the correlation handle for the game session. The correlation handle serves as an alias for the game session, allowing a game to refer to a game session by using only the correlation handle. The correlation handle can be used to query trace logs for entries that relate to the game session. For more information, see [Multiplayer concepts overview](../../../../../live/features/multiplayer/concepts/live-multiplayer-concepts.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionSessionReference](xblmultiplayermanagergamesessionsessionreference.md)
  
  