---
author: M-Stahl
title: Generic async task wrapper
description: Provides an example of how to write a generic async task wrapper.
kindex: Generic Async Task Wrapper
ms.author: chcoope
ms.topic: conceptual
edited: 12/11/2020
security: public
---

# Generic async task wrapper

This topic provides an example of a generic async task wrapper. Instead of manually setting up async blocks and calling [XAsyncRun](../../reference/system/xasync/functions/xasyncrun.md) 
for each task, create a `RunTask` wrapper to simplify this
process. By using this wrapper, you can specific a task queue, a work, and an optional completion callback.

```c++
void RunTask(XTaskQueueHandle taskQueue,
    std::function<void()> workCallback,
    std::function<void()> completionCallback)
{
    struct RunTaskContext
    {
        std::function<void()> workCallback;
        std::function<void()> completionCallback;
    };

    RunTaskContext* context = new RunTaskContext();
    context->workCallback = workCallback;
    context->completionCallback = completionCallback;
    XAsyncBlock* async = new XAsyncBlock{};
    async->queue = taskQueue;
    async->context = context;
    async->callback = [](XAsyncBlock* async)
    {
        RunTaskContext* context = static_cast<RunTaskContext*>(async->context);
        context->completionCallback();
        delete context;
        delete async;
    };

    // Callback passed to XAsyncRun is the work callback
    XAsyncRun(async,
        [](XAsyncBlock* async)->HRESULT
        {
            RunTaskContext* context = static_cast<RunTaskContext*>(async->context);
            context->workCallback();
            return S_OK;
        });
}
```

The previous sample implements a function that takes an async block and two
callbacks: one work and one completion. You can write a version to
just take a work callback, because the completion callback is optional.

It uses the standard pattern to setup an async block, setup context
data, and call [XAsyncRun](../../reference/system/xasync/functions/xasyncrun.md). `RunTask` encapsulates the boilerplate 
code, creating a simple standalone task function. Simple data capturing passes to the callbacks without context parameters by using `std::function`.

```c++
RunTask(taskQueue,
    []()
    {
        // Work Callback
    },
    []()
    {
        // Completion Callback
    });
```

## See also

[Asynchronous programming overview](async-toc.md)  
[XAsync](../../reference/system/xasync/xasync_members.md)   
[XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md)