---
author: M-Stahl
title: XGameUiShowPlayerPickerResultCount
description: Gets the count of results from a [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md) call.
kindex: XGameUiShowPlayerPickerResultCount
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowPlayerPickerResultCount  

Gets the count of results from a [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md) call.

## Syntax  

```cpp
HRESULT XGameUiShowPlayerPickerResultCount(  
         XAsyncBlock* async,  
         uint32_t* resultPlayersCount  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md).

*resultPlayersCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  

The count of results.
  
### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
Typically this function is to be called in [XGameUiShowPlayerPickerAsync's](xgameuishowplayerpickerasync.md) **XAsyncBlock**. This function will allow you to retrieve the number of players returned to the list. To get the actual list of players you will need to call [XGameUiShowPlayerPickerResult](xgameuishowplayerpickerresult.md).  
You may also call this function anytime after the async function completes in order to retrieve the function result.  
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowPlayerPickerAsync](xgameuishowplayerpickerasync.md)  
[XGameUiShowPlayerPickerResult](xgameuishowplayerpickerresult.md)  