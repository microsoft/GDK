---
author: joannaleecy
title: XblMultiplayerActivitySetActivityAsync
description: Sets or updates the multiplayer activity for a local user.
kindex: XblMultiplayerActivitySetActivityAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerActivitySetActivityAsync  

Sets or updates the multiplayer activity for a local user.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerActivitySetActivityAsync(  
         XblContextHandle xblContext,  
         const XblMultiplayerActivityInfo* activityInfo,  
         bool allowCrossPlatformJoin,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context for the local user.  
  
*activityInfo* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerActivityInfo*](../structs/xblmultiplayeractivityinfo.md)  
  
Information about the activity. The `maxPlayers` and `currentPlayers` fields are optional; they are ignored if set to 0. The value of the `platform` field is ignored; XSAPI automatically sets the activity on the appropriate local platform.  
  
*allowCrossPlatformJoin* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True if the activity should be joinable on other platforms supported by the title.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The `XAsyncBlock` for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
When a title starts or joins a multiplayer experience, it should create an activity. Doing this lets both the shell and other players in your title see the player's activity. Your title can let other players join the game in progress. If a player wants to join an activity for your title and it is not running, it is activated and the connection string is passed to it. <br /><br /> To see how this function is used, see "Setting an activity" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  