---
author: M-Stahl
title: XGameUiShowTextEntryResultSize
description: Gets the size of the return buffer from a [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md) call.
kindex: XGameUiShowTextEntryResultSize
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowTextEntryResultSize  

Gets the size of the return buffer from a [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md) call.

## Syntax  

```cpp
HRESULT XGameUiShowTextEntryResultSize(  
         XAsyncBlock* async,  
         uint32_t* resultTextBufferSize  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md).

*resultTextBufferSize* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  

The size of the result text buffer.
  
### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
Typically this function is to be called in [XGameUiShowTextEntryAsync's](xgameuishowtextentryasync.md) **XAsyncBlock**. This function allows you to retrieve the size of the text input from a text entry field that was originally called for by [XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md). To retrieve the  text entry result you will need to call [XGameUiShowTextEntryResult](xgameuishowtextentryresult.md).  
You may also call this function anytime after the async function completes in order to retrieve the function result.  
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowTextEntryAsync](xgameuishowtextentryasync.md)  
[XGameUiShowTextEntryResult](xgameuishowtextentryresult.md)  