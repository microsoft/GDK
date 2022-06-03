---
author: M-Stahl
title: Run simple task
description: Provides an example of how to run a simple user task.
kindex: Run Simple Task
ms.author: chcoope
ms.topic: conceptual
edited: 12/14/2020
security: public
---

# Run simple task example

This topic provides an example of how to run a simple user task. Simple tasks can be started with the [XAsyncRun](../../../reference/system/xasync/functions/xasyncrun.md) function.
This function takes the async block as an input and then requires
implementing the work callback as a functor or lambda input. Remember
that the async block specifies the task queue to use and the optional
completion callback.

```c++
XAsyncBlock* async = new XAsyncBlock{};
async->queue = taskQueue;
async->context = contextData;
async->callback = 
    [](XAsyncBlock* async)
    {
        // The optional completion callback.
        delete async;
    }

XAsyncRun(async,
    [](XAsyncBlock* async)->HRESULT
    {
        // The work callback is implemented here.
        return S_OK;
    });
```

This example uses `XAsyncRun`to start a custom, simple
asynchronous task. The async block contains the task queue to use and
the completion callback.
`XAsyncRun` requires a work callback, and 
it has a return value. It's returned from a call to
[XAsyncGetStatus](../../../reference/system/xasync/functions/xasyncgetstatus.md) afterward. Internally, `XAsyncRun` 
has a simple async provider setup to handle the enqueuing of the
specified work callback, the enqueuing of the completion callback in the
async block, and other state changes for the process. This means that no
further code is needed for running simple async tasks&mdash;just set up the
async block and call `XAsyncRun`.

## See also

[XAsync library overview](async-library-xasync.md)  

[Set up async task (example)](async-library-xasync-example-setup-async-task.md)  

[Run Microsoft Game Development Kit (GDK) API task (example)](async-library-xasync-example-run-gdk-task.md)  

[XAsync](../../../reference/system/xasync/xasync_members.md)  