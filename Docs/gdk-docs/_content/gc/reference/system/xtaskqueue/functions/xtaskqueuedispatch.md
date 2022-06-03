---
author: M-Stahl
title: XTaskQueueDispatch
description: Processes an item in the task queue for the given port.
kindex: XTaskQueueDispatch
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueDispatch  

Processes an item in the task queue for the given port.  

## Syntax  
  
```cpp
bool XTaskQueueDispatch(  
         XTaskQueueHandle queue,  
         XTaskQueuePort port,  
         uint32_t timeoutInMs  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to dispatch work on.  


*port* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueuePort](../enums/xtaskqueueport.md)  

  
The port to dispatch.  


*timeoutInMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of milliseconds to wait for work to arrive before returning false. You may pass **INFINITE** to wait forever.  


  
### Return value
Type: bool
  
Returns true if this function dispatched a call or false if it did not. This function will also return false if the queue is terminated, even if **INFINITE** is passed as a timeout.  
  
## Remarks  
  
You can pass a timeout, which will cause **XTaskQueueDispatch** to wait for something to arrive in the queue.  

If a task queue port was created with [XTaskQueueDispatchMode::ThreadPool](../enums/xtaskqueuedispatchmode.md), [XTaskQueueDispatchMode::SerializedThreadPool](../enums/xtaskqueuedispatchmode.md), or [XTaskQueueDispatchMode::Immediate](../enums/xtaskqueuedispatchmode.md), dispatch modes it will dispatch callbacks automatically. For manual dispatch ports you need to call **XTaskQueueDispatch**. **XTaskQueueDispatch** can be called for any dispatch mode but note that a call is always dispatched on the thread that calls **XTaskQueueDispatch**.  
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **Performance Note:**  
Adding an item to a queue needs to be lock and wait free in order to satisfy the performance requirements of upstream code. The following APIs are lock free:  
* [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md)  
* [XTaskQueueSubmitDelayedCallback](xtaskqueuesubmitdelayedcallback.md)  
* [XTaskQueueDispatch](xtaskqueuedispatch.md), provided that 0 is passed for *timeoutInMs*   
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **Performance Note:**  
The amount of time spent by [XTaskQueueDispatch](xtaskqueuedispatch.md) when processing an item from the Work port is variable and dependent on the work being performed.
In some cases the calling thread could block waiting for other system work to complete.

The following example shows how to use the **XTaskQueueDispatch** function to process items in the task queue. 
  
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
  
  