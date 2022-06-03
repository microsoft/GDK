---
author: M-Stahl
title: Clean up task queue
description: Provides an example of how to clean up a task queue when it's no longer needed.
kindex: Clean up Task Queue
ms.author: chcoope
ms.topic: conceptual
edited: 12/15/2020
security: public
---

# Clean up task queue example

This topic provides an example of how to clean up a task queue when it's no longer needed to avoid leaking resources. However, a task queue can't just immediately be released. It must first be terminated, flushed to
ensure that anything enqueued to it has been run, and then released. 

The [terminate call](../../../reference/system/xtaskqueue/functions/xtaskqueueterminate.md) can be set to wait or return
immediately. If a callback isn't waiting, it can optionally be specified
to be notified when the termination completely finishes. If there are
any [manual ports](../../../reference/system/xtaskqueue/enums/xtaskqueuedispatchmode.md), they must continue to be dispatched until
the [dispatch function](../../../reference/system/xtaskqueue/functions/xtaskqueuedispatch.md) returns.

```c++
XTaskQueueTerminate(taskQueue, false, nullptr, nullptr);
bool result;
do
{
    result = XTaskQueueDispatch(taskQueue, XTaskQueuePort::Completion, INFINITE);
} while (result == true);
XTaskQueueCloseHandle(taskQueue);
```

This example terminates the task queue but doesn't wait by using the 
[XTaskQueueTerminate](../../../reference/system/xtaskqueue/functions/xtaskqueueterminate.md) wait parameter. 
The `terminate` call adds one callback to each port to detect when the queue
is emptied. To account for this and any previously enqueued callbacks,
`dispatch` is continually called until it returns `false`.

## See also

[XTaskQueue library overview](async-library-xtaskqueue.md)  

[Create task queue (example)](async-library-xtaskqueue-example-create-task-queue.md)  

[Dispatch task queue (example)](async-library-xtaskqueue-example-dispatch-task-queue.md)  

[Designing the task queue](../async-task-queue-design.md)  

[XTaskQueue](../../../reference/system/xtaskqueue/xtaskqueue_members.md)  