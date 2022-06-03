---
author: TBD
title: XGameUiShowMultiplayerActivityGameInviteResult
description: TBD
kindex: XGameUiShowMultiplayerActivityGameInviteResult
ms.author: TBD
ms.topic: reference
edited: 00/00/0000
security: public
---

# XGameUiShowMultiplayerActivityGameInviteResult  

Gets the results from a [XGameUiShowMultiplayerActivityGameInviteAsync](xgameuishowmultiplayeractivitygameinviteasync.md) call.

## Syntax  

```cpp
HRESULT XGameUiShowMultiplayerActivityGameInviteResult(
  XAsyncBlock * async
)
```

### Parameters  

*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock *  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).  

## Remarks

Failures will likely will only happen during development and usually indicates an invalid user was passed in or that there is no multiplayer activity set.

## Requirements  

**Header:** XGameUI.h  

**Library:** xgameruntime.lib  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

## See also  

[XGameUI members](../xgameui_members.md)  

