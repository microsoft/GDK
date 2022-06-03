---
author: joannaleecy
title: XblMultiplayerManagerEstimatedMatchWaitTime
description: Retrieves the estimated wait time, in seconds, to complete a matchmaking request in progress.
kindex: XblMultiplayerManagerEstimatedMatchWaitTime
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerEstimatedMatchWaitTime  

Retrieves the estimated wait time, in seconds, to complete a matchmaking request in progress.  

## Syntax  
  
```cpp
uint32_t XblMultiplayerManagerEstimatedMatchWaitTime(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: uint32_t
  
The estimated wait time, in seconds.
  
## Remarks  
  
Call this function only after the [XblMultiplayerManagerFindMatch](xblmultiplayermanagerfindmatch.md) function has been called to submit a matchmaking request. The matchmaking request uses SmartMatch to find an existing game that has enough open player slots for all the members in the lobby session. If a matchmaking request isn't in progress, this function returns zero (0) seconds. For more information about finding a multiplayer game, see [Enable finding a multiplayer game by using SmartMatch using Multiplayer Manager](../../../../../live/features/multiplayer/mpm/how-to/live-play-multiplayer-with-matchmaking.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerFindMatch](xblmultiplayermanagerfindmatch.md)
  
  