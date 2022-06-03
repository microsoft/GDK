---
author: joannaleecy
title: XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking
description: Sets if matchmaking should auto fill open slots during gameplay. This can be changed anytime.
kindex: XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking  

Sets if matchmaking should auto fill open slots during gameplay. This can be changed anytime.  

## Syntax  
  
```cpp
void XblMultiplayerManagerSetAutoFillMembersDuringMatchmaking(  
         bool autoFillMembers  
)  
```  
  
### Parameters  
  
*autoFillMembers* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Set true, to search for members during matchmaking if the game has open slots. Set false, to not allow auto fill.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  