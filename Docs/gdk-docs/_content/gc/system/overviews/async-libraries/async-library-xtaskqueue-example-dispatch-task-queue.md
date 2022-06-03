---
author: M-Stahl
title: Dispatch task queue
description: Provides an example of how to dispatch a task queue.
kindex: Dispatch Task Queue
ms.author: chcoope
ms.topic: conceptual
edited: 12/16/2020
security: public
---

# Dispatch task queue example

This topic provides an example of how to dispatch a task queue. Dispatching a task queue is necessary for each [manual](../../../reference/system/xtaskqueue/enums/xtaskqueuedispatchmode.md) port. How and
when the ports are [dispatched](../../../reference/system/xtaskqueue/functions/xtaskqueuedispatch.md) determines the threaded and
concurrent behavior of the enqueued callbacks.

```c++
std::thread dispatherThread = std::thread(
    [taskQueue]()
    {
        while (true)
        {
            bool processed = XTaskQueueDispatch(taskQueue,
                XTaskQueuePort::Completion, INFINITE);

            if (!processed)
            {
                // The task queue has been terminated, so return.
                break;
            }
        }
    });
```

This example shows an extra thread being spawned to constantly dispatch
the completion port of the passed-in task queue until it's
terminated.

## See also

[XTaskQueue library overview](async-library-xtaskqueue.md)  

[Create task queue (example)](async-library-xtaskqueue-example-create-task-queue.md)  

[Clean up task queue (example)](async-library-xtaskqueue-example-cleanup-task-queue.md)  

[Designing the task queue](../async-task-queue-design.md)  

[XTaskQueue](../../../reference/system/xtaskqueue/xtaskqueue_members.md)  