---
author: M-Stahl
title: XGameUiShowErrorDialogAsync
description: Displays UI for an error dialog with a service defined error string for the specified error code.
kindex: XGameUiShowErrorDialogAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowErrorDialogAsync  

Displays UI for an error dialog with a service defined error string for the specified error code.

## Syntax  

```cpp
HRESULT XGameUiShowErrorDialogAsync(  
         XAsyncBlock* async,  
         HRESULT errorCode,  
         const char* context  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).  

*errorCode* &nbsp;&nbsp;\_In\_  
Type: HRESULT  

The error code to display the UI for.

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

The service defined error string to display for the error.  

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.

## Remarks  
  
 Additional buttons may appear on the dialog as appropriate, for example “Report a Problem” for Xbox Insiders to allow for bugs to be reported.

The async operation completes when the user dismisses the error dialog.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUIShowErrorDialogResult](xgameuishowerrordialogresult.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  