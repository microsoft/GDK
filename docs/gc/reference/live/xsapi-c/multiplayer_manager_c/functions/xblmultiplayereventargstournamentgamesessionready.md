---
author: joannaleecy
title: XblMultiplayerEventArgsTournamentGameSessionReady
description: Retrieves additional information for XblMultiplayerEventType::TournamentGameSessionReady events.
kindex: XblMultiplayerEventArgsTournamentGameSessionReady
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsTournamentGameSessionReady  

Retrieves additional information for XblMultiplayerEventType::TournamentGameSessionReady events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsTournamentGameSessionReady(  
         XblMultiplayerEventArgsHandle argsHandle,  
         time_t* startTime  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event args handle from the XblMultiplayerEvent.  
  
*startTime* &nbsp;&nbsp;\_Out\_  
Type: time_t*  
  
Passes back the game's start time for the tournament.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  