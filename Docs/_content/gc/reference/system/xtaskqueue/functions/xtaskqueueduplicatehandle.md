---
author: M-Stahl
title: XTaskQueueDuplicateHandle
description: Duplicates a XTaskQueueHandle object.
kindex: XTaskQueueDuplicateHandle
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueDuplicateHandle  

Duplicates a XTaskQueueHandle object.  

## Syntax  
  
```cpp
HRESULT XTaskQueueDuplicateHandle(  
         XTaskQueueHandle queueHandle,  
         XTaskQueueHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*queueHandle* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to reference.  


*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueHandle*  

  
The duplicated queue handle.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  
Use [XTaskQueueCloseHandle](xtaskqueueclosehandle.md) to close the **XTaskQueueHandle** object.  
  
The following example demonstrates how to duplicate a task queue handle. If you have long-running work, you might want to duplicate the task queue handle for the duration of that work. This prevents anyone that calls the [XTaskQueueCloseHandle](xtaskqueueclosehandle.md) function from closing the queue while you still need it. 

```cpp
void DuplicatingTaskQueueHandle()
{
    XTaskQueueHandle queue;

    HRESULT hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::Manual, 
        XTaskQueueDispatchMode::Manual, 
        &queue);

    if (FAILED(hr))
    {
        printf("failed to create task queue: 0x%x\r\n", hr);
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
    
    // Note that LongRunningWork's queue handle is still valid.
    XTaskQueueCloseHandle(queue);

    if (FAILED(hr))
    {
        printf("Failed to duplicate queue handle: 0x%x\r\n", hr);
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
  
  