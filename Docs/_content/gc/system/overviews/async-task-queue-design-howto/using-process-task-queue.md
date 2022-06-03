---
author: M-Stahl
title: Using the process task queue
description: Provides an example that shows how to use the process task queue. The default process task queue uses the thread pool for both work and completion dispatching.
kindex:
- Async task queue design
- using the process task queue
ms.author: jgup
ms.topic: conceptual
edited: '08/12/2020'
security: public
---

# How to: Using the process task queue

## Example

The default *process task queue* uses the thread pool for both work and completion dispatching. Microsoft Game Development Kit (GDK) APIs that take task queue parameters all accept `nullptr` and substitute the process task queue. It can be replaced. The process task queue can also be set to `nullptr`. In this case, Microsoft Game Development Kit (GDK) APIs that require a task queue parameter will error with `E_NO_TASK_QUEUE`. This allows the Microsoft Game Development Kit (GDK) APIs to function with defaults while still allowing tight control over task queue handles, if needed.

The following example shows how to use the process task queue.

```c++  
void UsingProcessTaskQueue()  
{  
    XTaskQueueHandle queue = GetCurrentProcessTaskQueue();  
  
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
  
    XTaskQueueSetCurrentProcessTaskQueue(queue);  
  
    XTaskQueueHandle processQueue;  
    XTaskQueueGetCurrentProcessTaskQueue(&processQueue);  
    printf("Process task queue: %p. Our queue: %p\r\n",  
        processQueue, queue);  
    XTaskQueueCloseHandle(processQueue);  
  
    // You can set the process queue to nullptr to force everyone to pass a queue  
    // as a parameter.  
    XTaskQueueSetCurrentProcessTaskQueue(nullptr);  
    XTaskQueueGetCurrentProcessTaskQueue(&processQueue);  
    printf("Process task queue: %p.\r\n",  
        processQueue);  
}  
```

## See also

[Designing the task queue](../async-task-queue-design.md)