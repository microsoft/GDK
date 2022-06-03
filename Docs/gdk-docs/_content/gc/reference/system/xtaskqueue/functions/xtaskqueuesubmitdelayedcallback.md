---
author: M-Stahl
title: XTaskQueueSubmitDelayedCallback
description: Submits a callback to the queue for the given port.
kindex: XTaskQueueSubmitDelayedCallback
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueSubmitDelayedCallback  

Submits a callback to the queue for the given port.  

## Syntax  
  
```cpp
HRESULT XTaskQueueSubmitDelayedCallback(  
         XTaskQueueHandle queue,  
         XTaskQueuePort port,  
         uint32_t delayMs,  
         void* callbackContext,  
         XTaskQueueCallback* callback  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to submit the callback to.  


*port* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueuePort](../enums/xtaskqueueport.md)  

  
The port to submit the callback to. Callbacks can be assigned to work or completion ports.  


*delayMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of milliseconds to delay before submitting the callback to the queue.  
> [!NOTE]
> A callback can be submitted to be added to the queue some time in the future. If *delayMs* is non-zero the callback will be placed on a pending list and a timer is initialized with the next closest wait time. When the time elapses, the callback with the next time will be placed on the execution list. The queue will raise a [XTaskQueueMonitorCallback](xtaskqueuemonitorcallback.md), and if the queue is running in a thread pool dispatch mode, thread pool work will be submitted.  


*callbackContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
An optional context pointer that will be passed to the callback.  


*callback* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueCallback*](xtaskqueuecallback.md)  

  
A pointer to the callback function.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  
This callback will be added to the queue after *delayMs* milliseconds.  
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **Performance Note:**  
Adding an item to a queue needs to be lock and wait free in order to satisfy the performance requirements of upstream code. The following APIs are lock free:  
* [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md)  
* [XTaskQueueSubmitDelayedCallback](xtaskqueuesubmitdelayedcallback.md)  
* [XTaskQueueDispatch](xtaskqueuedispatch.md), provided that 0 is passed for *timeoutInMs*   
  
The following example allows callbacks to be submitted in the future by using the **XTaskQueueSubmitDelayedCallback** function. This is a great way to retry a failed call after a short delay; it can also be used as a cheap timer for periodic events.  

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.  

```cpp
void SubmittingDelayedCallback()
{
    XTaskQueueHandle queue;

    HRESULT hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::ThreadPool,
        XTaskQueueDispatchMode::ThreadPool, 
        &queue);

    if (FAILED(hr))
    {
        printf("failed to create task queue: 0x%x\r\n", hr);
        return;
    }

    struct CallContext
    {
        DWORD count;
        XTaskQueueHandle queue;
        XTaskQueueCallback* callback;
    } callContext;

    auto callback = [](void* context, bool cancel)
    {
        CallContext *callContext = static_cast<CallContext*>(context);
        callContext->count++;
        printf("Periodic callback %d\r\n", callContext->count);
        if (callContext->count != 10 && !cancel)
        {
            HRESULT hr = XTaskQueueSubmitDelayedCallback(
                callContext->queue, 
                XTaskQueuePort::Completion, 
                500, 
                callContext, 
                callContext->callback);

            if (FAILED(hr))
            {
                printf("Failed submitting next callback: 0x%x\r\n", hr);
                callContext->count = 10; // Prevent us from waiting forever.
            }
        }
    };

    callContext.count = 0;
    callContext.queue = queue;
    callContext.callback = callback;

    // Use the task queue to make 10 periodic calls
    hr = XTaskQueueSubmitDelayedCallback(
        queue,
        XTaskQueuePort::Completion,
        500,
        &callContext,
        callback);

    if (FAILED(hr))
    {
        printf("Failed submitting delayed callback: 0x%x\r\n", hr);
        XTaskQueueCloseHandle(queue);
        return;
    }

    // Now wait for all the calls to complete.
    while (callContext.count != 10)
    {
        Sleep(1000);
    }

    XTaskQueueTerminate(queue, true, nullptr, nullptr);
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
[Async Task Queue design](../../../../system/overviews/async-task-queue-design.md) 
  
  