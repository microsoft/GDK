---
author: M-Stahl
title: XTaskQueueUnregisterMonitor
description: Unregisters a previously registered monitor callback.
kindex: XTaskQueueUnregisterMonitor
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueueUnregisterMonitor
  
Unregisters a previously registered monitor callback.  
  
## Syntax
  
```cpp
void XTaskQueueUnregisterMonitor(  
         XTaskQueueHandle queue,  
         XTaskQueueRegistrationToken token  
)  
```  
  
### Parameters
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  
  
The queue to remove the submit callback from.  
  
*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../structs/xtaskqueueregistrationtoken.md)  
  
The registration token returned from [XTaskQueueRegisterMonitor](xtaskqueueregistermonitor.md).  
  
### Return value
  
Type: void  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
If [XTaskQueueRegisterMonitor](xtaskqueueregistermonitor.md) was previously invoked to register an [XTaskQueueMonitorCallback](xtaskqueuemonitorcallback.md) callback for a task queue, use `XTaskQueueUnregisterMonitor` to unregister the callback. Once unregistered, the callback is no longer invoked when tasks are submitted to the task queue for execution. Unregistering the callback also releases its reference to the task queue handle.  
  > [!NOTE]
> If you call `XTaskQueueRegisterMonitor` to register an `XTaskQueueMonitorCallback` callback with a task queue, you must use `XTaskQueueUnregisterMonitor` to unregister the callback before closing the task queue handle with [XTaskQueueCloseHandle](xtaskqueueclosehandle.md); otherwise, a memory leak can occur. A task queue handle is a shareable resource, and isn't actually destroyed until all references to that handle are released. For more information, see [Async task queue design](../../../../system/overviews/async-task-queue-design.md).  
  
## Requirements
  
**Header:** XTaskQueue.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XTaskQueueRegisterMonitor](xtaskqueueregistermonitor.md)  
[XTaskQueueMonitorCallback](xtaskqueuemonitorcallback.md)  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue design](../../../../system/overviews/async-task-queue-design.md)  
  