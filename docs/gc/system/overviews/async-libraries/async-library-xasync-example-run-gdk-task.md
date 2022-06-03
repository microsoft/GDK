---
author: M-Stahl
title: Run Microsoft Game Development Kit (GDK) API task
description: Provides an example of how to run a Microsoft Game Development Kit (GDK) API task.
kindex: Run Microsoft Game Development Kit (GDK) API Task
ms.author: chcoope
ms.topic: conceptual
edited: 12/09/2020
security: public
---

# Run Microsoft Game Development Kit API task example

This topic provides an example of how to run a Microsoft Game Development Kit (GDK) API task. Async Microsoft Game Development Kit (GDK) API functions internally implement the work callback. However, it still runs as directed by the task queue as specified in the
async block. Running these methods requires the async block and
whatever parameters are needed for the API.

```c++
// Set up the async block and completion callback.
XAsyncBlock* async = new XAsyncBlock{};
async->queue = taskQueue;
async->context = nullptr;
async->callback = [](XAsyncBlock* async)
{
    XUserHandle newUser = nullptr;
    HRESULT result = XUserAddResult(async, &newUser);
    // Handle the completion callback.
    delete async;
};

// Start the async call.
HRESULT hr = XUserAddAsync(XUserAddOptions::None, async);
if (FAILED(hr))
{
    delete async;
}
```

This code doesn't differ much from the code to [run generic tasks](async-library-xasync-example-run-simple-task.md).
Instead of using [XAsyncRun](../../../reference/system/xasync/functions/xasyncrun.md) with a work callback, you call
into the API that you want to use. The async block is set up
in the same way. The difference there is that [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) 
has data to be retrieved from the call that's done in the
completion callback with [XUserAddResult](../../../reference/system/xuser/functions/xuseraddresult.md).

## See also

[XAsync library overview](async-library-xasync.md)  

[Set up async task (example)](async-library-xasync-example-setup-async-task.md)  

[Run simple task (example)](async-library-xasync-example-run-simple-task.md)  

[XAsync](../../../reference/system/xasync/xasync_members.md)  