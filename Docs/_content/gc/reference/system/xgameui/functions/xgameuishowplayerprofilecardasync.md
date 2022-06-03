---
author: M-Stahl
title: XGameUiShowPlayerProfileCardAsync
description: Displays UI for the profile card of the specified player.
kindex: XGameUiShowPlayerProfileCardAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowPlayerProfileCardAsync  

Displays UI for the profile card of the specified player.

## Syntax  

```cpp
HRESULT XGameUiShowPlayerProfileCardAsync(  
         XAsyncBlock* async,  
         XUserHandle requestingUser,  
         uint64_t targetPlayer  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).

*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

The ID of the player requesting the profile card.

*targetPlayer* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

The ID of the player to show the profile card for.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.

## Remarks  
  
Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).  
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUIShowPlayerProfileCardResult](xgameuishowplayerprofilecardresult.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  
  