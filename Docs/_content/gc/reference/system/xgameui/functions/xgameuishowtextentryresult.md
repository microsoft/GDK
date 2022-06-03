---
author: M-Stahl
title: XGameUiShowTextEntryResult
description: Gets the results from a [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md) call.
kindex: XGameUiShowTextEntryResult
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowTextEntryResult  

Gets the results from a [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md) call.

## Syntax  

```cpp
HRESULT XGameUiShowTextEntryResult(  
         XAsyncBlock* async,  
         uint32_t resultTextBufferSize,  
         char* resultTextBuffer,  
         uint32_t* resultTextBufferUsed  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md).

*resultTextBufferSize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The size of the results text buffer, which is used to determine the buffer size that contains the result. You can get this info by calling [XGameUiShowTextEntryResultSize](xgameuishowtextentryresultsize.md). Alternatively, if you have a pre-allocated result buffer, you can pass in the size of that result buffer.

*resultTextBuffer* &nbsp;&nbsp;\_Out\_writes\_to\_(resultTextBufferSize,*resultTextBufferUsed)  
Type: char*  

A pointer to the text buffer that contains the result of the player's text input.

*resultTextBufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: uint32_t*  

The actual size of the buffer that contained the player's text input.
  
### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  

Typically this function is to be called in [XGameUiShowTextEntryAsync's](xgameuishowtextentryasync.md) **XAsyncBlock**. This function allows you to retrieve the text input from a text entry field that was originally called for by [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md). To retrieve the size of the text entry result you will need to call [XGameUiShowTextEntryResultSize](xgameuishowtextentryresultsize.md).  
You may also call this function anytime after the async function completes in order to retrieve the function result.  
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md)  
[XGameUiShowTextEntryResultSize](xgameuishowtextentryresultsize.md)  