---
author: M-Stahl
title: Set up async task
description: Provides an example of how to set up async tasks.
kindex: Setup Async Task
ms.author: chcoope
ms.topic: conceptual
edited: 12/11/2020
security: public
---

# Set up async task example

This topic provides an example of how to set up async tasks. Set up an [XAsyncBlock](../../../reference/system/xasync/structs/xasyncblock.md) for the async task that will run.
These async blocks can't be shared between multiple active async tasks.
However, they can be reused for a different task after the original task is finished. A
simple pattern is to just dynamically allocate the block for each call,
and then release it when the call is finished in the completion callback.

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
```

The parameter for the completion callback is the async block that was previously created. This allows for the context to be accessed and cast to the proper type for usage as both input and output, if you want to do so.

## See also

[XAsync library overview](async-library-xasync.md)  

[Run simple task (example)](async-library-xasync-example-run-simple-task.md)  

[Run Microsoft Game Development Kit (GDK) API task (example)](async-library-xasync-example-run-gdk-task.md)  

[XAsync](../../../reference/system/xasync/xasync_members.md)  