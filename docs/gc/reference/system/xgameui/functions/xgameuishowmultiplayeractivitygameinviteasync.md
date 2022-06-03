---
author: TBD
title: XGameUiShowMultiplayerActivityGameInviteAsync
description: TBD
kindex: XGameUiShowMultiplayerActivityGameInviteAsync
ms.author: TBD
ms.topic: reference
edited: 00/00/0000
security: public
---

# XGameUiShowMultiplayerActivityGameInviteAsync  

This method shows a picker UI populated from the requesting player's friend list and suggested friend list to send out game invites for titles using the Multiplayer Activity service. 

## Syntax  

```cpp
HRESULT XGameUiShowMultiplayerActivityGameInviteAsync(
  XAsyncBlock * async,
  XUserHandle requestingUser
)
```

### Parameters  

*async* &nbsp;&nbsp;\_In\_ 
Type: XAsyncBlock *  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).  

*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user that is sending the invites.

## Remarks

To send an invite with UI, after an activity is set using [XblMultiplayerActivitySetActivityAsync](../../../live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysetactivityasync.md) (see example above), the title should call the [XGameUiShowMultiplayerActivityGameInviteAsync](xgameuishowmultiplayeractivitygameinviteasync.md) API passing along the requesting user.  It will use the current activity of the title and invite players using its connection string and settings.

## Requirements  

**Header:** XGameUI.h  

**Library:** xgameruntime.lib  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

## See also  

[XGameUI members](../xgameui_members.md)  

