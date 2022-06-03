---
author: M-Stahl
title: XGameUiShowMessageDialogAsync
description: Displays UI for a customizable message dialog.
kindex: XGameUiShowMessageDialogAsync
ms.author: aarocar
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowMessageDialogAsync  

Displays UI for a customizable message dialog. The index of the button pressed by the user is contained in the result.

## Syntax  

```cpp
HRESULT XGameUiShowMessageDialogAsync(  
         XAsyncBlock* async,  
         const char* titleText,  
         const char* contentText,  
         const char* firstButtonText,  
         const char* secondButtonText,  
         const char* thirdButtonText,  
         XGameUiMessageDialogButton defaultButton,  
         XGameUiMessageDialogButton cancelButton  
)  
```  

### Parameters  

*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).  

*titleText* &nbsp;&nbsp;\_In\_  
Type: char*  

The text title of the message dialog.

*contentText* &nbsp;&nbsp;\_In\_  
Type: char*  

The text displayed inside of the message dialog.

*firstButtonText* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

The text displayed on the first button of the message dialog.

*secondButtonText* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

The text displayed on the second button of the message dialog.

*thirdButtonText* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

The text displayed on the third button of the message dialog.

*defaultButton* &nbsp;&nbsp;\_In\_  
Type: [XGameUiMessageDialogButton](../enums/xgameuimessagedialogbutton.md)  

Indicates which button is selected by default when the message dialog is first displayed.

*cancelButton* &nbsp;&nbsp;\_In\_  
Type: [XGameUiMessageDialogButton](../enums/xgameuimessagedialogbutton.md)  

Indicates which button represents the cancel action.

### Return value

Type: HRESULT

HRESULT success or error code of the async call.

To get the result, call [XGameUiShowMessageDialogResult](xgameuishowmessagedialogresult.md) inside the *XAsyncBlock* callback or after the *XAsyncBlock* is complete.

## Remarks  

Like other **XGameUI\*** functions, **XGameUiShowMessageDialogAsync** renders it's UI outside of the title partition, and the result is composited with the title's output before each frame is sent to the display device. This means that **XGameUiShowMessageDialogAsync** can be used to present information to a user whether or not the game is even rendering.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).

The following example code illustrates using this method in a development scenario to create blocking UI waiting for input. This can be particularly useful to pause current execution at the location of a crashing failure and either reporting the crash location or prompting the developer to attach a debugger.

```cpp
if (FAILED(XGameRuntimeInitialize()))  
    return 1;

XTaskQueueHandle queue;
DX::ThrowIfFailed(
    XTaskQueueCreate(XTaskQueueDispatchMode::ThreadPool, XTaskQueueDispatchMode::Immediate, &queue)  
);

XAsyncBlock* ab = new XAsyncBlock;
ZeroMemory(ab, sizeof(XAsyncBlock));
ab->queue = queue;

// show dialog, wait for completion, get result.

XGameUiMessageDialogButton button;
if (SUCCEEDED(XGameUiShowMessageDialogAsync(ab, u8"Title String", u8"This is content text",
                                            u8"Option #1", u8"Option #2", u8"Option #3",
                                            XGameUiMessageDialogButton::First,
                                            XGameUiMessageDialogButton::Third)) &&
    SUCCEEDED(XAsyncGetStatus(ab, true)) &&
    SUCCEEDED(XGameUiShowMessageDialogResult(ab, &button)))  
{
    DoSomethingWithResponse(button);  // set breakpoint here to investigate
}
```

## Requirements  

**Header:** XGameUI.h

**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUIShowMessageDialogResult](xgameuishowmessagedialogresult.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  