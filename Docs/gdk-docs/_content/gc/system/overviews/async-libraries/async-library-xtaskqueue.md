---
author: M-Stahl
title: XTaskQueue library overview
description: Describes the purpose of the XTaskQueue library and contains examples.
kindex: XTaskQueue Library Overview
ms.author: chcoope
ms.topic: conceptual
edited: 12/11/2020
security: public
---

# XTaskQueue library overview

Use this topic to manage task queues with the XTaskQueue library. This library is responsible for the "when" and
 "where" of running tasks, which is controlled by task queues
 and the methods that  [set up](../../../reference/system/xtaskqueue/functions/xtaskqueuecreate.md),
 [manage](../../../reference/system/xtaskqueue/functions/xtaskqueuedispatch.md), and [control](../../../reference/system/xtaskqueue/functions/xtaskqueueregistermonitor.md) task queues.

Task queues can have two ports set to [different
modes](../../../reference/system/xtaskqueue/enums/xtaskqueuedispatchmode.md) and dispatched on any thread.
[Custom callbacks](../../../reference/system/xtaskqueue/functions/xtaskqueueregisterwaiter.md) can be added to call in
special circumstances for functionality.

Each process has a default task queue that automatically dispatches its tasks concurrently 
in the system thread pool. This task pool is used if no task queue is specified in the
[XAsyncBlock](../../../reference/system/xasync/structs/xasyncblock.md). You can [change or remove](../../../reference/system/xtaskqueue/functions/xtaskqueuesetcurrentprocesstaskqueue.md) 
the default task queue.

For more information about XTaskQueue APIs, see [XTaskQueue](../../../reference/system/xtaskqueue/xtaskqueue_members.md).

## XTaskQueueHandle

When a task queue is created, it’s tracked by an `XTaskQueueHandle` type.
This handle identifies the task queue and is passed to any function in the 
[XTaskQueue library](../../../reference/system/xtaskqueue/xtaskqueue_members.md) that works with task queues. The handle must 
be tracked and closed when it’s no longer using the task queue.

For more information about cleaning up task queues, see [Cleanup task queue](async-library-xtaskqueue-example-cleanup-task-queue.md).

## See also

[Example: Create Task Queue](async-library-xtaskqueue-example-create-task-queue.md)  
[Example: Dispatch Task Queue](async-library-xtaskqueue-example-dispatch-task-queue.md)  
[Example: Cleanup Task Queue](async-library-xtaskqueue-example-cleanup-task-queue.md)  
[XAsync](../../../reference/system/xasync/xasync_members.md)   
[Designing the task queue](../async-task-queue-design.md)  
[XTaskQueue](../../../reference/system/xtaskqueue/xtaskqueue_members.md) 