---
author: M-Stahl
title: XTaskQueueCreate
description: Creates a task queue, which can be used to queue and dispatch calls.
kindex: XTaskQueueCreate
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueCreate  

Creates a task queue, which can be used to queue and dispatch calls.  

## Syntax  
  
```cpp
HRESULT XTaskQueueCreate(  
         XTaskQueueDispatchMode workDispatchMode,  
         XTaskQueueDispatchMode completionDispatchMode,  
         XTaskQueueHandle* queue  
)  
```  
  
### Parameters  
  
*workDispatchMode* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueDispatchMode](../enums/xtaskqueuedispatchmode.md)  

  
The dispatch mode for the "work" port of the queue.  


*completionDispatchMode* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueDispatchMode](../enums/xtaskqueuedispatchmode.md)  

  
The dispatch mode for the "completion" port of the queue.  


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
  
For most scenarios, you create a task queue with the **XTaskQueueCreate** API. If you are chaining multiple asynchronous calls together, however, sometimes it is useful to create a composite queue via [XTaskQueueCreateComposite](xtaskqueuecreatecomposite.md). Consider an API whose implementation needs to invoke another API that uses a task queue. You may want to redirect the completion callback of the API so it doesn’t tie up the completion thread of the caller. In this case, you can create a composite task queue whose work and completion ports are built from the work port of another queue.  

The following example creates a task queue that dispatches both work and completion callbacks on the system thread pool.  

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.

```cpp
void CreatingTaskQueue()
{
    XTaskQueueHandle queue;
    HRESULT hr = XTaskQueueCreate(XTaskQueueDispatchMode::ThreadPool, XTaskQueueDispatchMode::ThreadPool, &queue);
    if (FAILED(hr))
    {
        printf("Creating queue failed: 0x%x\r\n", hr);
        return;
    }

    SubmitCallbacks(queue);

    // Wait a while for the callbacks to run
    Sleep(1000);

    XTaskQueueTerminate(queue, true, nullptr, nullptr);
}
``` 
  
The following example creates a manually-pumped task queue. It creates two STL threads that dispatch calls for both the work and completion ports. 
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.  

```cpp
void CreatingTaskQueueWithManualThreads()
{
    // Create a manual task queue
    XTaskQueueHandle queue;
    HRESULT hr = XTaskQueueCreate(XTaskQueueDispatchMode::Manual, XTaskQueueDispatchMode::Manual, &queue);
    if (FAILED(hr))
    {
        printf("Creating queue failed: 0x%x\r\n", hr);
        return;
    }

    // We create threads to pump the queue: one for the work port
    // and one for the completion port.
    std::thread workThread([queue]
    {
        while (XTaskQueueDispatch(queue, XTaskQueuePort::Work, INFINITE));
    });

    std::thread completionThread([queue]
    {
        while (XTaskQueueDispatch(queue, XTaskQueuePort::Completion, INFINITE));
    });

    SubmitCallbacks(queue);

    // Wait a while for the callbacks to run
    Sleep(1000);

    // Terminating the queue will cause a waiting DispatchTaskQueue to return
    // false.  
    XTaskQueueTerminate(queue, true, nullptr, nullptr);

    workThread.join();
    completionThread.join();
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
  
  