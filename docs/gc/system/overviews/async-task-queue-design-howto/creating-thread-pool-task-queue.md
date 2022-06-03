---
author: M-Stahl
title: Creating a thread pool task queue
description: Provides an example that shows how to create a task queue that dispatches both work and completion callbacks on the system thread pool.
kindex:
- Async task queue design
- Creating a thread pool task queue
ms.author: jgup
ms.topic: conceptual
edited: '08/11/2020'
security: public
---

# How to: Creating a thread pool task queue

## Example

The following example shows how to create a task queue that dispatches both work and completion callbacks on the system thread pool.

```c++
void CreatingTaskQueue()  
{  
    XTaskQueueHandle queue;  
 
    HRESULT hr = XTaskQueueCreate(  
        XTaskQueueDispatchMode::ThreadPool,  
        XTaskQueueDispatchMode::ThreadPool,  
        &queue);  
 
    if (FAILED(hr))  
    { 
        printf("Creating queue failed: 0x%x\r\n", hr);  
        return;  
    }  
 
    SubmitCallbacks(queue); 
 
    // Wait a while for the callbacks to run.  
    Sleep(1000);  
 
    XTaskQueueTerminate(queue, true, nullptr, nullptr);  
}  
```

## Sample output

```  
Worker invoked on thread 11440. Cancel? 0. 
Completion invoked on thread 11440. Cancel? 0.  
```

## See also

[Designing the task queue](../async-task-queue-design.md)