---
author: M-Stahl
title: XTaskQueueSetCurrentProcessTaskQueue
description: Sets the given task queue as the process wide task queue.
kindex: XTaskQueueSetCurrentProcessTaskQueue
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueSetCurrentProcessTaskQueue  

Sets the given task queue as the process wide task queue.  

## Syntax  
  
```cpp
void XTaskQueueSetCurrentProcessTaskQueue(  
         XTaskQueueHandle queue  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to set up as the default task queue for the procces.  


  
### Return value
Type: void
  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The queue can be set to nullptr, in which case [XTaskQueueGetCurrentProcessTaskQueue](xtaskqueuegetcurrentprocesstaskqueue.md) will also return nullptr. The provided queue will have its handle duplicated and any existing process task queue will have its handle closed.  
  
The following example replaces the default process task queue. This task queue uses the thread pool for both work and completion dispatching. Microsoft Game Development Kit (GDK) APIs that take task queue parameters all accept **nullptr** and substitute the process task queue. The process task queue can also be set to **nullptr**, in which case Microsoft Game Development Kit (GDK) APIs that require a task queue parameter will error with E_NO_TASK_QUEUE if null was provided. This allows Microsoft Game Development Kit (GDK) APIs to function with defaults while still allowing tight control over task queue handles if needed.  

```cpp
void UsingProcessTaskQueue()
{
    XTaskQueueHandle queue = nullptr;
	XTaskQueueGetCurrentProcessTaskQueue(&queue);

    auto callback = [](void*, bool)
    {
        printf("Work callback invoked.\r\n");
    };

    HRESULT hr = XTaskQueueSubmitCallback(
        queue, XTaskQueuePort::Work, 
        nullptr, callback);

    if (FAILED(hr))
    {
        printf("Failed to submit callback: %x\r\n", hr);
        return;
    }

    // You can replace the process task queue.
    hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::Manual, 
        XTaskQueueDispatchMode::Manual, 
        &queue);

    if (FAILED(hr))
    {
        printf("Failed to create new task queue: %x\r\n", hr);
        return;
    }
}
```
   

## Requirements  
  
**Header:** XTaskQueue.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md)  
  
  