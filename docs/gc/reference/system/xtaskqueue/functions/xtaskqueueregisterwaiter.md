---
author: M-Stahl
title: XTaskQueueRegisterWaiter
description: Registers a wait handle with a task queue.
kindex: XTaskQueueRegisterWaiter
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueRegisterWaiter  

Registers a wait handle with a task queue.  

## Syntax  
  
```cpp
HRESULT XTaskQueueRegisterWaiter(  
         XTaskQueueHandle queue,  
         XTaskQueuePort port,  
         HANDLE waitHandle,  
         void* callbackContext,  
         XTaskQueueCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to submit the callback to.  


*port* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueuePort](../enums/xtaskqueueport.md)  

  
The port to submit the callback to. Callbacks can be assigned to work or completion ports.  


*waitHandle* &nbsp;&nbsp;\_In\_  
Type: HANDLE  

  
The handle to monitor.  
> [!NOTE]
> This is the wait handle that, when signaled, will cause the callback to be invoked. The wait handle is typically an auto or manual reset event. If the wait handle is manual reset the callback will be invoked repeatedly as long as the event is signaled. If this isn’t what you want, either reset the event while in the callback or unregister the wait callback.  


*callbackContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
An optional context pointer that will be passed to the callback.  


*callback* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueCallback*](xtaskqueuecallback.md)  

  
A pointer to the callback function.  


*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../structs/xtaskqueueregistrationtoken.md)  

  
A registration token. This can be passed to [XTaskQueueUnregisterWaiter](xtaskqueueunregisterwaiter.md) to unregister the wait.  

  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
When the wait handle is satisfied the task queue will invoke the given callback. This provides an efficient way to add items to a task queue in response to handles becomming signaled.  
  
The following example registers a Win32 kernel handle with a task queue. Your callback will be submitted to the queue when the handle becomes signaled. Normally, you would create an auto reset event to use for signaling. If the handle is not auto reset, a new callback will be submitted when the current callback completes for as long as the handle is signaled. 
  
```cpp
void CreatingTaskQueueWaiter()
{
    HANDLE waitEvent = CreateEvent(nullptr, FALSE, FALSE, nullptr);
    if (waitEvent == nullptr)
    {
        printf("Error creating wait handle: %d\r\n", GetLastError());
        return;
    }

    XTaskQueueHandle queue;

    HRESULT hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::ThreadPool,
        XTaskQueueDispatchMode::ThreadPool, 
        &queue);

    if (FAILED(hr))
    {
        printf("Error creating task queue: %x\n", hr);
        CloseHandle(waitEvent);
        return;
    }

    auto callback = [](void*, bool)
    {
        printf("Callback invoked.\r\n");
    };

    XTaskQueueRegistrationToken token;

    hr = XTaskQueueRegisterWaiter(
        queue, 
        XTaskQueuePort::Completion, 
        waitEvent, 
        nullptr, 
        callback, 
        &token);

    if (FAILED(hr))
    {
        printf("Error registering task queue waiter: %x\n", hr);
        CloseHandle(waitEvent);
        XTaskQueueCloseHandle(queue);
        return;
    }

    // Now, whenever our wait event becomes signaled the callback will be called.
    for (uint32_t i = 0; i < 5; i++)
    {
        SetEvent(waitEvent);
        Sleep(100);
    }

    // Note: unregistering the waiter is optional
    XTaskQueueUnregisterWaiter(queue, token);
    XTaskQueueCloseHandle(queue);
    CloseHandle(waitEvent);
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
  
  