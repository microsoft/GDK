---
author: M-Stahl
title: XTaskQueueRegisterMonitor
description: Registers a callback that will be invoked whenever a callback is submitted to this queue.
kindex: XTaskQueueRegisterMonitor
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueRegisterMonitor  

Registers a callback that will be invoked whenever a callback is submitted to this queue.  

## Syntax  
  
```cpp
HRESULT XTaskQueueRegisterMonitor(  
         XTaskQueueHandle queue,  
         void* callbackContext,  
         XTaskQueueMonitorCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to register the submit callback to.  


*callbackContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
An optional context pointer to be passed to the submit callback.  


*callback* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueMonitorCallback*](xtaskqueuemonitorcallback.md)  

  
A callback that will be invoked when a new callback is submitted to the queue.  


*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../structs/xtaskqueueregistrationtoken.md)  

  
A token used when calling [XTaskQueueUnregisterMonitor](xtaskqueueunregistermonitor.md) to remove the callback.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The following example shows how a task queue can be used to signal a condition variable when it has items to dispatch. An application might use this to share threads it uses for the task queue with other work in the application.  
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.  

```cpp
// We will use condition variables to signal when there is something for us 
// in the queue and a bool to signal when we want the whole thing to close.
// Keep all this in a struct for convenient access
struct QueueControl
{
    std::condition_variable workActivity;
    std::mutex workMutex;
    std::condition_variable completionActivity;
    std::mutex completionMutex;
    bool terminate = false;
} queueControl;

void CALLBACK TaskQueueNewItemSubmitted(void* context, XTaskQueueHandle, XTaskQueuePort port)
{
    // A new callback has been submitted. notify the correct condition variable
    QueueControl* queueControl = static_cast<QueueControl*>(context);
    switch (port)
    {
    case XTaskQueuePort::Work:
        queueControl->workActivity.notify_all();
        break;

    case XTaskQueuePort::Completion:
        queueControl->completionActivity.notify_all();
        break;
    }
}

void CreatingTaskQueueWithManualSignaling()
{
    // Create a manual task queue
    XTaskQueueHandle queue;
    HRESULT hr = XTaskQueueCreate(
        XTaskQueueDispatchMode::Manual, 
        XTaskQueueDispatchMode::Manual, 
        &queue);

    if (FAILED(hr))
    {
        printf("Creating queue failed: 0x%x\r\n", hr);
        return;
    }

    // Listen to callback submitted notifications to signal
    // our condition variable.
    XTaskQueueRegistrationToken token;
    hr = XTaskQueueRegisterMonitor(
        queue, &queueControl, 
        TaskQueueNewItemSubmitted, &token);

    std::thread workThread([&]()
    {
        std::unique_lock<std::mutex> lock(queueControl.workMutex);
        while (!queueControl.terminate)
        {
            queueControl.workActivity.wait(lock);
            XTaskQueueDispatch(queue, XTaskQueuePort::Work, 0);
        }
    });

    std::thread completionThread([&]()
    {
        std::unique_lock<std::mutex> lock(queueControl.completionMutex);
        while (!queueControl.terminate)
        {
            queueControl.completionActivity.wait(lock);
            XTaskQueueDispatch(queue, XTaskQueuePort::Completion, 0);
        }
    });

    SubmitCallbacks(queue);

    // Wait a while for the callbacks to run
    Sleep(1000);

    XTaskQueueTerminate(queue, true, nullptr, nullptr);

    queueControl.terminate = true;
    queueControl.workActivity.notify_all();
    queueControl.completionActivity.notify_all();

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
  
  