---
author: M-Stahl
title: Creating a manual task queue
description: Provides an example that shows how to create a manually pumped task queue. It creates two STL threads that dispatch calls for both the work port and the completion port.
kindex:
- Async task queue design
- Creating a manual task queue
ms.author: jgup
ms.topic: conceptual
edited: 01/21/2021
security: public
---

# How to: Creating a manual task queue

## Example

You might want to explicitly control the threads that are used for task queue work and completions. In these 
cases, create a *manual task queue* and dispatch the calls yourself. If you're using manual task queues,
you must ensure that they also pump the Windows message queue.

The following example shows how to create a manually pumped task queue. It creates two STL
threads that dispatch calls for both the work port and the completion port.

```c++
void CreatingTaskQueueWithManualThreads() 
{  
    // Create a manual task queue.  
    XTaskQueueHandle queue;  
  
    HRESULT hr = XTaskQueueCreate(  
        XTaskQueueDispatchMode::Manual,  
        XTaskQueueDispatchMode::Manual,  
        &queue);  
  
    if (FAILED(hr))  
    {  
        printf("Creating queue failed: 0x%x\r\n", hr);  
        return;  
    }  
  
    // We create threads to pump the queue: one thread for the work port  
    // and one thread for the completion port.  
    std::thread workThread([queue]  
    {  
        // XTaskQueueDispatch returns false when there's nothing to  
        // dispatch. Here, we wait forever for something new to come  
        // in. This will return false only if the queue is being  
        // terminated.  
        while (XTaskQueueDispatch(queue, XTaskQueuePort::Work, INFINITE));  
    });  
  
    std::thread completionThread([queue]  
    {  
        // XTaskQueueDispatch returns false when there's nothing to  
        // dispatch. Here, we wait forever for something new to come  
        // in. This will return false only if the queue is being  
        // terminated.  
        while (XTaskQueueDispatch(queue, XTaskQueuePort::Completion, INFINITE));  
    });  
  
    SubmitCallbacks(queue);  
  
    // Wait a while for the callbacks to run.  
    Sleep(1000);  
  
    // Terminating the queue will cause a waiting XTaskQueueDispatch to return  
    // false.  
    XTaskQueueTerminate(queue, true, nullptr, nullptr);  
  
    workThread.join();  
    completionThread.join();  
}  
```

## See also

[Designing the task queue](../async-task-queue-design.md)