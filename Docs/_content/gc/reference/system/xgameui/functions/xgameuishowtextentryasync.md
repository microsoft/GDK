---
author: M-Stahl
title: XGameUiShowTextEntryAsync
description: Displays a text entry UI for a user to enter information.
kindex: XGameUiShowTextEntryAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowTextEntryAsync  

Displays a text entry UI for a user to enter information.

## Syntax  
  
```cpp
HRESULT XGameUiShowTextEntryAsync(  
         XAsyncBlock* async,  
         const char* titleText,  
         const char* descriptionText,  
         const char* defaultText,  
         XGameUiTextEntryInputScope inputScope,  
         uint32_t maxTextLength  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).

*titleText* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  

The text title of the text entry UI.

*descriptionText* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  

The text description of the text entry UI.

*defaultText* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  

Default text that is initially populated in the text entry UI.

*inputScope* &nbsp;&nbsp;\_In\_  
Type: [XGameUiTextEntryInputScope](../enums/xgameuitextentryinputscope.md)  

Specified the input scope of the text entry, indicating the type of information that is allowed. This scope
provides a hint as to what text may be desired by the game. The game will still need to validate what text 
they get back from the keyboard.

*maxTextLength* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The maximum number of characters the user can enter in the text entry UI. On console, the maximum number 
of characters is 1024. On PC, there is no limitation.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.

To get the result, call [XGameUiShowTextEntryResultSize](xgameuishowtextentryresultsize.md) and [XGameUiShowTextEntryResult](xgameuishowtextentryresult.md) inside the *AsyncBlock* callback or after the *AsyncBlock* is complete.
  
## Remarks  
  
On consoles, this will provide both a text input field and an onscreen virtual keyboard (OSK). On Windows, this will provide a new window with a text input field. A virtual keyboard will only appear on Windows if the user is configured to use an onscreen keyboard (such as being in tablet mode) rather than using a physical keyboard.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUIShowTextEntryResult](xgameuishowtextentryresult.md)  
[XGameUIShowTextEntryResultSize](xgameuishowtextentryresultsize.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  