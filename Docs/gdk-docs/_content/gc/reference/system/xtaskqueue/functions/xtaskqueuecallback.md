---
author: M-Stahl
title: XTaskQueueCallback
description: A callback that is invoked by the task queue.
kindex: XTaskQueueCallback
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueueCallback
  
A callback that is invoked by the task queue.  
  
## Syntax
  
```cpp
void XTaskQueueCallback(  
         void* context,  
         bool canceled  
)  
```  
  
### Parameters
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. A context pointer passed when calling [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md).  
  
*canceled* &nbsp;&nbsp;\_In\_  
Type: bool  
  
If true, the callback is being canceled because the task queue is terminating.  
  
### Return value
  
Type: void
  
## Remarks
  
The `XTaskQueueCallback` callback is implemented to perform work on a task queue. Callbacks can be submitted to either the work port or completion port of a task queue by invoking [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) or [XTaskQueueSubmitDelayedCallback](xtaskqueuesubmitdelayedcallback.md). The work port and completion port of a task queue can have independent dispatch modes, and `XTaskQueueCallback` callbacks can be submitted to either port. Typically, a callback submitted to a work port in turn submits a corresponding callback to the completion port upon completing its work.  
  
The purpose of the `canceled` parameter is to ensure that any resources allocated by a callback can be properly released if a callback is canceled. If an `XTaskQueueCallback` callback is called and `canceled` is set to true, then the task queue for that callback has been terminated by calling [XTaskQueueTerminate](xtaskqueueterminate.md) and the callback has been canceled. The callback should release any allocated resources, including the memory allocated in `context`, and perform no other work.  
  
For an example, see [Submitting callbacks](../../../../system/overviews/async-task-queue-design-howto/submitting-callbacks.md).  
  
## Requirements
  
**Header:** XTaskQueue.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
  