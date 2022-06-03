---
author: M-Stahl
title: XTaskQueueGetCurrentProcessTaskQueue
description: Obtains a handle to the process task queue, or nullptr if there is no process task queue.
kindex: XTaskQueueGetCurrentProcessTaskQueue
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueGetCurrentProcessTaskQueue  

Obtains a handle to the process task queue, or nullptr if there is no process task queue.  

## Syntax  
  
```cpp
bool XTaskQueueGetCurrentProcessTaskQueue(  
         XTaskQueueHandle* queue  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueHandle*  

  
Handle to the process task queue.  


  
### Return value
Type: bool
  
Returns true if there is a process task queue available, or false otherwise.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
By default, there is a process task queue that uses the thread pool for both work and completion ports. You can replace the default process task queue by calling [XTaskQueueSetCurrentProcessTaskQueue](xtaskqueuesetcurrentprocesstaskqueue.md), and you can prevent callers using the process task queue by calling [XTaskQueueSetCurrentProcessTaskQueue](xtaskqueuesetcurrentprocesstaskqueue.md) with a null queue parameter.  

Use [XTaskQueueCloseHandle](xtaskqueueclosehandle.md) to close handle returned from this API.  

  
## Requirements  
  
**Header:** XTaskQueue.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
  
  