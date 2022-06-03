---
author: M-Stahl
title: Creating a composite task queue
description: Provides an example that uses the thread pool for work but integrates completion port callbacks into a Win32 WindowProc callback function. This example also demonstrates the correct termination of a task queue when you're integrating it with another threading model.
kindex:
- Async task queue design
- Creating a composite task queue
ms.author: jgup
ms.topic: conceptual
edited: '08/06/2020'
security: public
---

# How to: Creating a composite task queue

## Example

A *composite task queue* is a task queue that's made up of parts from other queues. Composite task queues are useful when one asynchronous task needs to call another, and the completion from that task is an intermediate step that shouldn't waste cycles on the completion thread. In this case, a composite queue can be created. The work and completion ports of this composite queue both use the work port of the original queue.  

The following example uses the thread pool for work but integrates completion port callbacks into a Win32 WindowProc callback function. This example also demonstrates the correct termination of a task queue when you're integrating it with another threading model.

```c++
void CreatingCompositeQueue()  
{  
    XTaskQueueHandle queue;  
  
    HRESULT hr = XTaskQueueCreate(  
        XTaskQueueDispatchMode::ThreadPool,  
        XTaskQueueDispatchMode::Manual,  
        &queue);  
  
    if (FAILED(hr))  
    {  
        printf("Failed to create task queue: 0x%x\r\n", hr);  
        return;  
    }  
  
    XTaskQueuePortHandle workPort;  
  
    // Create a composite queue that uses the work port from  
    // another queue for both the work and the completion ports.  
  
    hr = XTaskQueueGetPort(queue, XTaskQueuePort::Work, &workPort);  
    if (FAILED(hr))  
    {  
        printf("Failed to get work port 0x%x\r\n", hr);  
        XTaskQueueCloseHandle(queue);  
        return;  
    }  
  
    XTaskQueueHandle compositeQueue;  
    hr = XTaskQueueCreateComposite(workPort, workPort, &compositeQueue);  
    if (FAILED(hr))  
    {  
        printf("Failed to create composite queue 0x%x\r\n", hr);  
        XTaskQueueCloseHandle(queue);  
        return;  
    }  
  
    // Use the queue as needed.  
    SubmitCallbacks(compositeQueue);  
  
    // Wait a while for the callbacks to run.  
    Sleep(1000);  
  
    XTaskQueueCloseHandle(compositeQueue);  
    XTaskQueueCloseHandle(queue);  
}  
```

Another technique for this is to create a local queue whose work and completion dispatch types are *immediate*. An immediate dispatch mode doesn’t involve any asynchronous activity at all&mdash;it dispatches callbacks as soon as they're submitted as shown in the following code example.  

```c++
void CreatingImmediateQueue()  
{  
    XTaskQueueHandle queue;  
  
    HRESULT hr = XTaskQueueCreate(  
        XTaskQueueDispatchMode::Immediate,  
        XTaskQueueDispatchMode::Immediate,  
        &queue);  
  
    if (FAILED(hr))  
    {  
        printf("Failed to create task queue: 0x%x\r\n", hr);  
        return;  
    }  
  
    // Use the queue as needed.  
    SubmitCallbacks(queue);  
  
    // Wait a while for the callbacks to run.  
    Sleep(1000);  
  
    XTaskQueueCloseHandle(queue);  
}  
```

## See also

[Designing the task queue](../async-task-queue-design.md)