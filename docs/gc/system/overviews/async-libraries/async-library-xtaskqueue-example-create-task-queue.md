---
author: M-Stahl
title: Create task queue
description: Provides an example of how to create a task queue.
kindex: Create Task Queue
ms.author: chcoope
ms.topic: conceptual
edited: 12/15/2020
security: public
---

# Create task queue example

This topic provides an example of how to create a task queue. Simply call [XTaskQueueCreate](../../../reference/system/xtaskqueue/functions/xtaskqueuecreate.md), 
pass in the [modes](../../../reference/system/xtaskqueue/enums/xtaskqueuedispatchmode.md) for each port, and then save the created handle.

```c++
XTaskQueueHandle taskQueue1;
HRESULT hr = XTaskQueueCreate(
    XTaskQueueDispatchMode::ThreadPool,
    XTaskQueueDispatchMode::Manual,
    &taskQueue1);

XTaskQueueHandle taskQueue2;
hr = XTaskQueueCreate(
    XTaskQueueDispatchMode::Immediate,
    XTaskQueueDispatchMode::SerializedThreadPool,
    &taskQueue2);
```

If there isn't an error with the return code, the task queue is now
represented by the returned `XTaskQueueHandle`.

## See also

[XTaskQueue library overview](async-library-xtaskqueue.md)  

[Dispatch task queue (example)](async-library-xtaskqueue-example-dispatch-task-queue.md)  

[Clean up task queue (example)](async-library-xtaskqueue-example-cleanup-task-queue.md)  

[Designing the task queue](../async-task-queue-design.md)  

[XTaskQueue](../../../reference/system/xtaskqueue/xtaskqueue_members.md)  