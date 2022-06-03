---
author: M-Stahl
title: XTaskQueueCreateComposite
description: Creates a task queue composed of ports of other task queues.
kindex: XTaskQueueCreateComposite
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueCreateComposite  

Creates a task queue composed of ports of other task queues.  

## Syntax  
  
```cpp
HRESULT XTaskQueueCreateComposite(  
         XTaskQueuePortHandle workPort,  
         XTaskQueuePortHandle completionPort,  
         XTaskQueueHandle* queue  
)  
```  
  
### Parameters  
  
*workPort* &nbsp;&nbsp;\_In\_  
Type: XTaskQueuePortHandle  

  
The port to use for queuing work callbacks.  


*completionPort* &nbsp;&nbsp;\_In\_  
Type: XTaskQueuePortHandle  

  
The port to use for queuing completion callbacks.  


*queue* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueHandle*  

  
The newly created queue.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Task queues are reference counted objects. Release the reference by calling [XTaskQueueCloseHandle](xtaskqueueclosehandle.md).  
  
  
A task queue has work and completion ports and tasks can be queued to either port. Each port can be configured with its own dispatch mode.  
  
For most scenarios, you create a task queue with the [XTaskQueueCreate](xtaskqueuecreate.md) API. If you are chaining multiple asynchronous calls together, however, sometimes it is useful to create a composite queue via **XTaskQueueCreateComposite**. Consider an API whose implementation needs to invoke another API that uses a task queue. You may want to redirect the completion callback of the API so it doesn’t tie up the completion thread of the caller. In this case, you can create a composite task queue whose work and completion ports are built from the work port of another queue.  
  
The following example creates a composite task queue.  
  
```cpp
void CreatingCompositeQueue()
{
    XTaskQueueHandle queue;

    HRESULT hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::ThreadPool, 
        XTaskQueueDispatchMode::Manual, 
        &queue);

    if (FAILED(hr))
    {
        printf("failed to create task queue: 0x%x\r\n", hr);
        return;
    }

    XTaskQueuePortHandle workPort;

    // Create a composite queue that uses the work port from
    // another queue for both work and completion ports.

    hr = XTaskQueueGetPort(queue, XTaskQueuePort::Work, &workPort);
    if (FAILED(hr))
    {
        printf("failed to get work port 0x%x\r\n", hr);
        XTaskQueueCloseHandle(queue);
        return;
    }

    XTaskQueueHandle compositeQueue;
    hr = XTaskQueueCreateComposite(workPort, workPort, &compositeQueue);
    if (FAILED(hr))
    {
        printf("failed to create composiute queue 0x%x\r\n", hr);
        XTaskQueueCloseHandle(queue);
        return;
    }

    // Use the queue as needed
    SubmitCallbacks(compositeQueue);

    // Wait a while for the callbacks to run
    Sleep(1000);

    XTaskQueueCloseHandle(compositeQueue);
    XTaskQueueCloseHandle(queue);
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
  
  