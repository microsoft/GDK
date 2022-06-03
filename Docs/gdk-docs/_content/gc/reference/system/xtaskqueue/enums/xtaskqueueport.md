---
author: M-Stahl
title: XTaskQueuePort
description: Declares which port of a task queue to dispatch or submit callbacks to.
kindex: XTaskQueuePort
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueuePort
  
Declares which port of a task queue to dispatch or submit callbacks to.  
  
## Syntax
  
```cpp
enum class XTaskQueuePort  : uint32_t  
{  
    Work,  
    Completion  
}  
```  
  
## Constants
  
| Constant | Description |  
| -------- | ----------- |  
| Work | The work port for the task queue. |  
| Completion | The completion port for the task queue. |  
  
## Remarks
  
This enumeration identifies the port of a task queue on which to perform an action, such as submitting a callback or getting a port handle. The work port and completion port of a task queue can have independent dispatch modes, and tasks can be submitted to either port. For an example, see [Submitting callbacks](../../../../system/overviews/async-task-queue-design-howto/submitting-callbacks.md).  
  
## Requirements
  
**Header:** XTaskQueue.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XTaskQueueDispatch](../functions/xtaskqueuedispatch.md)  
[XTaskQueueGetPort](../functions/xtaskqueuegetport.md)  
[XTaskQueueMonitorCallback](../functions/xtaskqueuemonitorcallback.md)  
[XTaskQueueRegisterWaiter](../functions/xtaskqueueregisterwaiter.md)  
[XTaskQueueSubmitCallback](../functions/xtaskqueuesubmitcallback.md)  
[XTaskQueueSubmitDelayedCallback](../functions/xtaskqueuesubmitdelayedcallback.md)  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
  