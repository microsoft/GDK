---
author: M-Stahl
title: XGameUiShowPlayerPickerAsync
description: Displays a picker UI that allows a person playing the game to select players from a presented list of people.
kindex: XGameUiShowPlayerPickerAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowPlayerPickerAsync  

Displays a picker UI that allows a person playing the game to select players from a presented list of people.

## Syntax  

```cpp
HRESULT XGameUiShowPlayerPickerAsync(  
         XAsyncBlock* async,  
         XUserHandle requestingUser,  
         const char* promptText,  
         uint32_t selectFromPlayersCount,  
         const uint64_t* selectFromPlayers,  
         uint32_t preSelectedPlayersCount,  
         const uint64_t* preSelectedPlayers,  
         uint32_t minSelectionCount,  
         uint32_t maxSelectionCount  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).

*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user requesting the player picker UI.

*promptText* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

The prompt display text.

*selectFromPlayersCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The number of players that the caller can select from.

*selectFromPlayers* &nbsp;&nbsp;\_In\_reads\_(selectFromPlayersCount)  
Type: uint64_t*  

A pointer to a list of player IDs that the caller can select from.

*preSelectedPlayersCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The number of players that are pre-selected when the UI is presented.

*preSelectedPlayers* &nbsp;&nbsp;\_In\_reads\_opt\_(preSelectedPlayersCount)  
Type: uint64_t*  

A pointer to a list of player IDs that are pre-selected when the UI is presented.

*minSelectionCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The minimum number of people the caller must select.

*maxSelectionCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The maximum number of people the caller can select.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.

To get the result, call [XGameUiShowPlayerPickerResultCount](xgameuishowplayerpickerresultcount.md) and [XGameUiShowPlayerPickerResult](xgameuishowplayerpickerresult.md) inside the *AsyncBlock* callback or after the *AsyncBlock* is complete.
  
## Remarks  
  
The player IDs must be Xbox User Ids (XUIDs), which are a *uint64_t* value.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowPlayerPickerResult](xgameuishowplayerpickerresult.md)  
[XGameUiShowPlayerPickerResultCount](xgameuishowplayerpickerresultcount.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md) 