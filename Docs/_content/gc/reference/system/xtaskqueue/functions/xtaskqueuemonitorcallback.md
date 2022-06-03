---
author: M-Stahl
title: XTaskQueueMonitorCallback
description: A callback that is invoked by the task queue whenever a task is submitted for execution.
kindex: XTaskQueueMonitorCallback
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueueMonitorCallback
  
A callback that is invoked by the task queue whenever a task is submitted for execution.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void XTaskQueueMonitorCallback(  
         void* context,  
         XTaskQueueHandle queue,  
         XTaskQueuePort port  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void\*  
  
A context pointer that was passed to [XTaskQueueRegisterMonitor](xtaskqueueregistermonitor.md).  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  
  
The task queue to which the task was submitted.  
  
*port* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueuePort](../enums/xtaskqueueport.md)  
  
The port to which the task was submitted.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
`XTaskQueueMonitorCallback` represents a callback intended for use with the [XTaskQueueRegisterMonitor](xtaskqueueregistermonitor.md) function. If an `XTaskQueueMonitorCallback` callback is registered with a task queue, this callback is invoked whenever a task is submitted to a task queue by either [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) or [XTaskQueueSubmitDelayedCallback](xtaskqueuesubmitdelayedcallback.md). For more information about implementing an `XTaskQueueMonitorCallback` callback, see [How to: Using events to control manual queue dispatching](../../../../system/overviews/async-task-queue-design-howto/control-manual-queue-dispatching.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XTaskQueue.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
[XTaskQueue Library Overview](../../../../system/overviews/async-libraries/async-library-xtaskqueue.md)  
[XTaskQueue members](../xtaskqueue_members.md)  
  