---
author: M-Stahl
title: Duplicating a task queue handle
description: Provides an example that shows how to duplicate a task queue handle. If you have long-running work, you might want to duplicate the task queue handle for the duration of the work. In this way, anyone calling `XTaskQueueCloseHandle` won’t close the queue while you still need it.
kindex:
- Async task queue design
- Duplicating a task queue handle
ms.author: jgup
ms.topic: conceptual
edited: '08/10/2020'
security: public
---

# How to: Duplicating a task queue handle

## Example

If you have long-running work, you might want to duplicate the task queue handle for the duration of the work. In this way, anyone calling `XTaskQueueCloseHandle` won’t close the queue while you still need it. This is shown in the following example.

```c++
void DuplicatingTaskQueueHandle() 
{ 
    XTaskQueueHandle queue; 
 
    HRESULT hr = XTaskQueueCreate( 
        XTaskQueueDispatchMode::Manual,  
        XTaskQueueDispatchMode::Manual,  
        &queue); 
 
    if (FAILED(hr)) 
    { 
        printf("Failed to create task queue: 0x%x\r\n", hr); 
        return; 
    } 
 
    class LongRunningWork 
    { 
    public: 
        HRESULT Initialize(XTaskQueueHandle queue) 
        { 
            return XTaskQueueDuplicateHandle(queue, &m_queue); 
        } 
         
        ~LongRunningWork() 
        { 
            if (m_queue != nullptr) 
            { 
                XTaskQueueCloseHandle(m_queue); 
            } 
        } 
 
    private: 
        XTaskQueueHandle m_queue = nullptr; 
    }; 
 
    LongRunningWork work; 
    hr = work.Initialize(queue); 
     
    // Note that the queue handle for LongRunningWork is still valid. 
    XTaskQueueCloseHandle(queue); 
 
    if (FAILED(hr)) 
    { 
        printf("Failed to duplicate queue handle: 0x%x\r\n", hr); 
    } 
} 
```

## See also

[Designing the task queue](../async-task-queue-design.md)