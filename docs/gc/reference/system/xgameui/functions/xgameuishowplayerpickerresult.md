---
author: M-Stahl
title: XGameUiShowPlayerPickerResult
description: Gets the results from a [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md) call.
kindex: XGameUiShowPlayerPickerResult
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowPlayerPickerResult  

Gets the results from a [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md) call.

## Syntax  

```cpp
HRESULT XGameUiShowPlayerPickerResult(  
         XAsyncBlock* async,  
         uint32_t resultPlayersCount,  
         uint64_t* resultPlayers,  
         uint32_t* resultPlayersUsed  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md).

*resultPlayersCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The count of player results, which is used to determine the buffer size that contains the results. You can get this info by calling [XGameUiShowPlayerPickerResultCount](xgameuishowplayerpickerresultcount.md). Alternatively, if you have pre-allocated a large result buffer, you can pass in a number equal to the max number of uint64_t fields that the buffer can contain.

*resultPlayers* &nbsp;&nbsp;\_Out\_writes\_to\_(resultPlayersCount,*resultPlayersUsed)  
Type: uint64_t*  

A pointer to a list of the IDs of the players that were selected in the player picker UI.

*resultPlayersUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: uint32_t*  

The number of players that were selected in the player picker UI.

### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
Typically this function is to be called in [XGameUiShowPlayerPickerAsync's](xgameuishowplayerpickerasync.md) **XAsyncBlock**. This function will allow you to retrieve the list of players requested. You can also receive the number of player returned by calling [XGameUiShowPlayerPickerResultCount](xgameuishowplayerpickerresultcount.md).  
You may also call this function anytime after the async function completes in order to retrieve the function result.  
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md)  
[XGameUiShowPlayerPickerResultCount](xgameuishowplayerpickerresultcount.md)  