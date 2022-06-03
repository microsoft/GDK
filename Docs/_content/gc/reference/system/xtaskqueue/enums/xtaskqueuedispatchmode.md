---
author: M-Stahl
title: XTaskQueueDispatchMode
description: Describes how task queue callbacks are processed.
kindex: XTaskQueueDispatchMode
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueueDispatchMode
  
Describes how task queue callbacks are processed.  
  
## Syntax
  
```cpp
typedef enum class XTaskQueueDispatchMode  : uint32_t  
{  
    Manual,  
    ThreadPool,  
    SerializedThreadPool,  
    Immediate  
} XTaskQueueDispatchMode  
```  
  
## Constants
  
| Constant | Description |  
| -------- | ----------- |  
| Manual | Callbacks are not automatically dispatched. Callbacks submitted to a port using this dispatch mode are queued, but must be dispatched manually by [XTaskQueueDispatch](../functions/xtaskqueuedispatch.md).<br/>**Note:** If you have a thread that pumps Windows messages:<ul><li>Do not dispatch callbacks for the work port</li><li>If you dispatch callbacks for the completion port, you must continue to pump Windows messages for the thread</li></ul><br/>For more information, see [Creating a manual task queue](../../../../system/overviews/async-task-queue-design-howto/creating-manual-task-queue.md). |  
| ThreadPool | Callbacks submitted to a port using this dispatch mode are queued and automatically dispatched on the system thread queue. The task queue executes the calls in parallel, taking a call to execute from the task queue in turn as thread pool threads become available.<br/>For more information about creating a thread pool task queue, see [Creating a thread pool task queue](../../../../system/overviews/async-task-queue-design-howto/creating-thread-pool-task-queue.md). |  
| SerializedThreadPool | Callbacks submitted to a port using this dispatch mode are queued and automatically dispatched on the system thread queue. Unlike `ThreadPool`, the task queue executes the calls in serial, one at a time, on the thread pool. |  
| Immediate | Callbacks are not queued at all, but are executed immediately on the thread that submitted them. For an example that implements the immediate dispatch mode, see [Creating a composite task queue](../../../../system/overviews/async-task-queue-design-howto/creating-composite-task-queue.md).|  
  
## Remarks
  
This enumeration is used by [XTaskQueueCreate](../functions/xtaskqueuecreate.md) to specify the dispatch modes for the work and completion ports of a task queue.  
  
The work port and completion port can use different dispatch modes. For example, you can use the thread pool dispatch mode for the work port to automatically queue & execute callbacks in parallel on the system thread queue, and use the manual dispatch mode for the completion port to manually queue & execute callbacks on the Windows message loop thread. For more information, see [Using a task queue with a Windows message loop](../../../../system/overviews/async-task-queue-design-howto/task-queue-windows-msg-loop.md).  
  
## Requirements
  
**Header:** XTaskQueue.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
  