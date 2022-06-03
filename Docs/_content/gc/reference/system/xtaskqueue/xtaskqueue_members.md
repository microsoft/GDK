---
author: M-Stahl
title: XTaskQueue (API contents)
description: XTaskQueue APIs
kindex: XTaskQueue
ms.author: mstahl
ms.topic: navigation
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueue  

XTaskQueue APIs
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XTaskQueueCallback](functions/xtaskqueuecallback.md) | A callback that is invoked by the task queue. |  
| [XTaskQueueCloseHandle](functions/xtaskqueueclosehandle.md) | Closes the task queue. |  
| [XTaskQueueCreate](functions/xtaskqueuecreate.md) | Creates a task queue, which can be used to queue and dispatch calls. |  
| [XTaskQueueCreateComposite](functions/xtaskqueuecreatecomposite.md) | Creates a task queue composed of ports of other task queues. |  
| [XTaskQueueDispatch](functions/xtaskqueuedispatch.md) | Processes an item in the task queue for the given port. |  
| [XTaskQueueDuplicateHandle](functions/xtaskqueueduplicatehandle.md) | Duplicates a XTaskQueueHandle object. |  
| [XTaskQueueGetCurrentProcessTaskQueue](functions/xtaskqueuegetcurrentprocesstaskqueue.md) | Obtains a handle to the process task queue, or nullptr if there is no process task queue. |  
| [XTaskQueueGetPort](functions/xtaskqueuegetport.md) | Returns the task queue port handle for the given port. |  
| [XTaskQueueMonitorCallback](functions/xtaskqueuemonitorcallback.md) | A callback that is invoked by the task queue whenever a task is submitted for execution. |  
| [XTaskQueueRegisterMonitor](functions/xtaskqueueregistermonitor.md) | Registers a callback that will be invoked whenever a callback is submitted to this queue. |  
| [XTaskQueueRegisterWaiter](functions/xtaskqueueregisterwaiter.md) | Registers a wait handle with a task queue. |  
| [XTaskQueueSetCurrentProcessTaskQueue](functions/xtaskqueuesetcurrentprocesstaskqueue.md) | Sets the given task queue as the process wide task queue. |  
| [XTaskQueueSubmitCallback](functions/xtaskqueuesubmitcallback.md) | Submits a callback to the queue for the given port. |  
| [XTaskQueueSubmitDelayedCallback](functions/xtaskqueuesubmitdelayedcallback.md) | Submits a callback to the queue for the given port. |  
| [XTaskQueueTerminate](functions/xtaskqueueterminate.md) | Terminates a task queue by canceling all pending items and preventning new items from being queued. |  
| [XTaskQueueTerminatedCallback](functions/xtaskqueueterminatedcallback.md) | A callback that is invoked when a task queue is terminated. |  
| [XTaskQueueUnregisterMonitor](functions/xtaskqueueunregistermonitor.md) | Unregisters a previously registered monitor callback. |  
| [XTaskQueueUnregisterWaiter](functions/xtaskqueueunregisterwaiter.md) | Unregisters a previously registered task queue waiter. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XTaskQueueRegistrationToken](structs/xtaskqueueregistrationtoken.md) | A token returned when registering a callback, to identify the registration. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XTaskQueueDispatchMode](enums/xtaskqueuedispatchmode.md) | Describes how task queue callbacks are processed. |  
| [XTaskQueuePort](enums/xtaskqueueport.md) | Declares which port of a task queue to dispatch or submit callbacks to. |  
  
  
## See also  

[System API reference](../gc-reference-system-toc.md)  
[Asynchronous Programming Design Goals and Improvements](../../../system/overviews/async-whitepaper.md)  
[Asynchronous Programming Model](../../../system/overviews/async-programming-model.md)  
[Async Task Queue design](../../../system/overviews/async-task-queue-design.md)  
  
  