---
author: joannaleecy
title: XblMultiplayerManagerDoWork
description: Maintains game state updates between the title and Multiplayer Manager (MPM).
kindex: XblMultiplayerManagerDoWork
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerDoWork  

Maintains game state updates between the title and Multiplayer Manager (MPM).  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerDoWork(  
         const _Deref_out_opt_ multiplayerEvents,  
         size_t* multiplayerEventsCount  
)  
```  
  
### Parameters  
  
*multiplayerEvents* &nbsp;&nbsp;  
Type: _Deref_out_opt_  
  
An array of multiplayer events for the game to handle. This is set to null if no multiplayer events occur during this update.  
  
*multiplayerEventsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size of the `multiplayerEvents` array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sends and receives game state updates between the title and Multiplayer Manager (MPM), returning an array of [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structures that represent significant multiplayer events, such as remote players joining or leaving. You must call this function on a regular and frequent basis, such as once per frame, so that MPM can properly maintain game state. For more information, see [Multiplayer Manager overview](../../../../../live/features/multiplayer/mpm/live-multiplayer-manager-overview.md). <br />The multiplayer events returned by this function are owned by MPM, and remain valid only until `XblMultiplayerManagerDoWork` is called again. In addition, the title must be thread-safe when calling `XblMultiplayerManagerDoWork`, because game state changes at the time this function is called. For example, if you're iterating through the list of members on a thread other than the one from which you're calling this function, the list may change when this function is called.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  