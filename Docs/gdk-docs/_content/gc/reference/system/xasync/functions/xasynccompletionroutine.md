---
author: M-Stahl
title: XAsyncCompletionRoutine
description: Represents the completion callback for an asynchronous call.
kindex: XAsyncCompletionRoutine
ms.author: mstahl
ms.topic: reference
edited: 03/04/2020
security: public
applies-to: pc-gdk
---

# XAsyncCompletionRoutine
  
Represents the completion callback for an asynchronous call.  
  
## Syntax
  
```cpp
void XAsyncCompletionRoutine(  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../structs/xasyncblock.md) for the completion callback.  
  
### Return value
  
Type: void
  
## Remarks
  
You can optionally specify an `XAsyncCompletionRoutine` pointer to provide a *completion callback* for an asynchronous call. A completion callback is a callback function that executes after the completion of an asynchronous call. You can specify an `XAsyncCompletionRoutine` pointer in the `callback` member of an [XAsyncBlock](../structs/xasyncblock.md) structure for an asynchronous call.  
  
Typically, a completion callback processes the results of an asynchronous call on another thread. The completion callback represents a callback function that is invoked when the asynchronous call completes. The callback function takes an `XAsyncBlock` pointer, which is subsequently used to obtain the results of the callback function.  
  
If you specify a completion callback, you can periodically check if the completion callback is completed by using the [XAsyncGetStatus](xasyncgetstatus.md) function, and then use [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md) and [XAsyncGetResultSize](xasyncgetresultsize.md) as needed to get the results from the completed task.  
  
A completion callback is invoked even if [XAsyncCancel](xasynccancel.md) is invoked to cancel the asynchronous call.  
  
Use [XAsyncGetStatus](xasyncgetstatus.md) or the completion callback's `Get\*Result` method to obtain the results of the asynchronous call. If the asynchronous call was canceled these methods return `E_ABORT`. For more information about the implementation pattern of an asynchronous provider, including the `Get\*Result` method, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md).  
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncGetStatus](xasyncgetstatus.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  