---
author: joannaleecy
title: XblMultiplayerManagerAutoFillMembersDuringMatchmaking
description: Indicates whether the game should auto-fill open slots during gameplay.
kindex: XblMultiplayerManagerAutoFillMembersDuringMatchmaking
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerAutoFillMembersDuringMatchmaking  

Indicates whether the game should auto-fill open slots during gameplay.  

## Syntax  
  
```cpp
bool XblMultiplayerManagerAutoFillMembersDuringMatchmaking(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: bool
  
Returns true if the game should auto-fill open slots during gameplay; otherwise, false.
  
## Remarks  
  
Call the [XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking](xblmultiplayermanagersetautofillmembersduringmatchmaking.md) function to discover whether the game should use matchmaking to auto-fill open slots during gameplay. You can also call the [XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking](xblmultiplayermanagersetautofillmembersduringmatchmaking.md) function to specify whether the game should auto-fill open slots during gameplay. For more information about matchmaking, see [Matchmaking overview](../../../../../live/features/multiplayer/matchmaking/live-matchmaking-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  