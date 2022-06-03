---
author: M-Stahl
title: XTaskQueueSubmitCallback
description: Submits a callback to the queue for the given port.
kindex: XTaskQueueSubmitCallback
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueSubmitCallback  

Submits a callback to the queue for the given port.  

## Syntax  
  
```cpp
HRESULT XTaskQueueSubmitCallback(  
         XTaskQueueHandle queue,  
         XTaskQueuePort port,  
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
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **Performance Note:**  
Adding an item to a queue needs to be lock and wait free in order to satisfy the performance requirements of upstream code. The following APIs are lock free:  
* [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md)  
* [XTaskQueueSubmitDelayedCallback](xtaskqueuesubmitdelayedcallback.md)  
* [XTaskQueueDispatch](xtaskqueuedispatch.md), provided that 0 is passed for *timeoutInMs*   
  
The following example demonstrates how a callback is submitted to either the work or completion port of a task queue. It first submits a work callback, and then at the end of the work callback it submits a completion callback, which will be typical.
  
```cpp
void CALLBACK SampleCompletionCallback(void*, bool cancel)
{
    printf("Completion invoked on thread %d.  Cancel? %d.\r\n", GetCurrentThreadId(), cancel);
}

void CALLBACK SampleWorkCallback(void* context, bool cancel)
{
    printf("Worker invoked on thread %d. Cancel? %d.\r\n", GetCurrentThreadId(), cancel);
    XTaskQueueHandle queueFromContext = static_cast<XTaskQueueHandle>(context);

    HRESULT hrCompletion = XTaskQueueSubmitCallback(
        queueFromContext, 
        XTaskQueuePort::Completion, 
        nullptr, 
        SampleCompletionCallback);

    if (FAILED(hrCompletion))
    {
        printf("Error 0x%x submitting completion.\r\n", hrCompletion);
    }
}

void SubmitCallbacks(XTaskQueueHandle queue)
{
    HRESULT hrWork = XTaskQueueSubmitCallback(
        queue, 
        XTaskQueuePort::Work, 
        queue, 
        SampleWorkCallback);

    if (FAILED(hrWork))
    {
        printf("Error 0x%x submitting work.\r\n", hrWork);
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
[Async Task Queue design](../../../../system/overviews/async-task-queue-design.md) 
  
  