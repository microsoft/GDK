---
author: M-Stahl
title: XAsyncBlock
description: Represents the lifetime of an asynchronous call.
kindex: XAsyncBlock
ms.author: mstahl
ms.topic: reference
edited: 03/04/2020
security: public
applies-to: pc-gdk
---

# XAsyncBlock
  
Represents the lifetime of an asynchronous call.  
  
## Syntax  
  
```cpp
typedef struct XAsyncBlock {  
    XTaskQueueHandle queue;  
    void* context;  
    XAsyncCompletionRoutine* callback;  
    unsigned internal[sizeof ( void* ) * 4];  
} XAsyncBlock  
```  
  
### Members
  
*queue*  
Type: XTaskQueueHandle  
  
Optional. The handle to the task queue for the asynchronous call and, optionally, the completion callback specified in *callback*. If set to null, the asynchronous call attempts to use the process task queue. If the process task queue is also set to null, then the asynchronous call fails and returns `E_NO_TASK_QUEUE`.  
  
*context*  
Type: void*  
  
Optional. A pointer to information passed to the completion callback.  
  
*callback*  
Type: [XAsyncCompletionRoutine*](../functions/xasynccompletionroutine.md)  
  
Optional callback that will be invoked when the call completes.  
  
*internal*  
Type: unsigned char[sizeof(void*) * 4]  
  
Reserved for internal use.  
  
## Remarks
  
The `XAsyncBlock` structure represents the lifetime of an asynchronous call. You use `XAsyncBlock` to first invoke an asynchronous call and provide an optional completion callback for that call. After that, you can use the `XAsyncBlock` as a handle for that particular call's invocation. When you invoke an asynchronous call, it's submitted to a task queue for execution. A task queue allows you to determine which thread executes the asynchronous call and which thread invokes the completion callback, if one is specified. You don't have to create a task queue to call asynchronous calls. If a task queue isn't specified in *queue*, the process task queue is used by default. Typically, the process task queue dispatches asynchronous calls to the system thread pool and completion callbacks are invoked on the thread that initiated the asynchronous call when that thread is alertable. For more information about dispatch modes for task queues, see [Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md).  
  > [!NOTE]
> After invoking an asynchronous call, do not modify any of the parameters in the `XAsyncBlock` for that asynchronous call.  
  
### Completion Callbacks
  
You can optionally specify a pointer to a callback function in *callback* to provide a *completion callback* for an asynchronous call. A completion callback is a callback function that executes after the completion of an asynchronous call. You can provide context-specific data to the completion callback by specifying a pointer in *context* that represents information for the completion callback.  
  
If you don't specify a completion callback in *callback*, you can periodically check if the asynchronous call is completed by using the [XAsyncGetStatus](../functions/xasyncgetstatus.md) function, and then use [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md) and [XAsyncGetResultSize](../functions/xasyncgetresultsize.md) as needed to get the results from the completed task.  
  
For more information about completion callbacks, see [XAsyncCompletionRoutine](../functions/xasynccompletionroutine.md).  
  
### Implementing XAsyncBlock
  
You can use [XAsyncProvider](../../xasyncprovider/xasyncprovider_members.md) to implement your own asynchronous functionality using `XAsyncBlock`, and then invoke that functionality by using [XTaskQueue](../../xtaskqueue/xtaskqueue_members.md) functions. You can also call asynchronous calls by invoking [XAsyncRun](../functions/xasyncrun.md), a helper function that internally uses `XAsyncProvider` to run and track the callback function specified by [XAsyncWork](../functions/xasyncwork.md), another helper function. For more information about implementing your own asynchronous functionality using `XAsyncProvider` and `XAsyncBlock`, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md).  
  
An `XAsyncBlock` must remain in memory for the lifetime of an asynchronous call. However, if the `XAsyncBlock` is dynamically allocated, it can be safely deleted within the completion callback for an asynchronous call.  
  
## Requirements
  
**Header:** XAsync.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncProvider Members](../../xasyncprovider/xasyncprovider_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  