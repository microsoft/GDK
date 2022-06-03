---
author: joannaleecy
title: XblMultiplayerActivityUpdateRecentPlayers
description: Appends to a player's list of recent players. If an encountered user is already in the list, it updates the existing recent-player entry.
kindex: XblMultiplayerActivityUpdateRecentPlayers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityUpdateRecentPlayers  

Appends to a player's list of recent players. If an encountered user is already in the list, it updates the existing recent-player entry.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivityUpdateRecentPlayers(  
         XblContextHandle xblContext,  
         const XblMultiplayerActivityRecentPlayerUpdate* updates,  
         size_t updatesCount  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*updates* &nbsp;&nbsp;\_In\_reads\_(updatesCount)  
Type: [XblMultiplayerActivityRecentPlayerUpdate*](../structs/xblmultiplayeractivityrecentplayerupdate.md)  
  
List of [XblMultiplayerActivityRecentPlayerUpdate](../structs/xblmultiplayeractivityrecentplayerupdate.md) objects to append to the recent players list.  
  
*updatesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the `updates` array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This call is unidirectional; it only affects the caller's recent-players list. <br /><br /> Recent-player updates are batched and uploaded by XSAPI by using the background queue provided during `XblInitialize`. <br /><br /> To force an immediate flush, call [XblMultiplayerActivityFlushRecentPlayersAsync](xblmultiplayeractivityflushrecentplayersasync.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  