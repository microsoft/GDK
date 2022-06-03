---
author: M-Stahl
title: XGameUiShowAchievementsAsync
description: Displays UI presenting the requesting player's achievements for the specified title.
kindex: XGameUiShowAchievementsAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowAchievementsAsync

Displays UI presenting the requesting player's achievements for the specified title.

## Syntax  

```cpp
HRESULT XGameUiShowAchievementsAsync(  
         XAsyncBlock* async,  
         XUserHandle requestingUser,  
         uint32_t titleId  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).

*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

The player requesting the list of achievements.

*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The ID of the title that the player is requesting achievements for.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.
  
## Remarks  
  
This method does not return a list of achievements, it only displays the achievements in the UI for the player.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowAchievementsResult](xgameuishowachievementsasync.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  
  