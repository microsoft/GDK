---
author: M-Stahl
title: XTaskQueueGetPort
description: Returns the task queue port handle for the given port.
kindex: XTaskQueueGetPort
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueGetPort  

Returns the task queue port handle for the given port.  

## Syntax  
  
```cpp
HRESULT XTaskQueueGetPort(  
         XTaskQueueHandle queue,  
         XTaskQueuePort port,  
         XTaskQueuePortHandle* portHandle  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The task queue to get the port from.  


*port* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueuePort](../enums/xtaskqueueport.md)  

  
The port to get.  


*portHandle* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueuePortHandle*  

  
The task queue port handle for the given port.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Task queue port handles are owned by the task queue and do not have to be closed. They are used when creating composite task queues.  
  
  
The following example creates a composite queue whose work and completion ports both use the work port of the original queue. A composite task queue is a task queue that is composed of parts from other queues. Composite task queues are useful when one asynchronous task needs to call another, and the completion from that task is an intermediate step that should not waste cycles on the completion thread.   

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.  
  
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
  
  