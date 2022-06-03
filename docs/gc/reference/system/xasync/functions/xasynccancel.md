---
author: M-Stahl
title: XAsyncCancel
description: Attempts to cancel an asynchronous call.
kindex: XAsyncCancel
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAsyncCancel
  
Attempts to cancel an asynchronous call.  
  
## Syntax
  
```cpp
void XAsyncCancel(  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../structs/xasyncblock.md) for the asynchronous call.  
  
### Return value
  
Type: void  
  
## Remarks
  
If the `XAsyncCancel` function is invoked for an asynchronous call that has not yet completed, the [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md), [XAsyncGetResultSize](xasyncgetresultsize.md), and [XAsyncGetStatus](xasyncgetstatus.md) functions return `E_ABORT` and completion of the asynchronous call is signalled. Cancellation may happen synchronously, asynchronously, or not at all, depending on the call being canceled. If a completion callback was specified for the asynchronous call, it is then invoked. For more information about completion callbacks, see [XAsyncCompletionRoutine](xasynccompletionroutine.md).  
  
If the `XAsyncCancel` function is invoked for an asynchronous call that has already completed, nothing happens.  
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncCompletionRoutine](xasynccompletionroutine.md)  
[XAsync Members](../xasync_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  