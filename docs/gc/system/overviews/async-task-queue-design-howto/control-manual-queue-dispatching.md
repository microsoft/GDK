---
author: M-Stahl
title: Using events to control manual queue dispatching
description: Provides an example that shows how to use a task queue to signal a condition variable when it has items to dispatch.
kindex:
- Async task queue design
- Using events to control manual queue dispatching
ms.author: jgup
ms.topic: conceptual
edited: '08/06/2020'
security: public
---

# How to: Using events to control manual queue dispatching

## Example

A game might want to share threads that it uses for the task queue with other work in the game. The following example shows how to use a task queue to signal a condition variable when it has items to dispatch.

```c++
// We use condition variables to signal when there's something for us  
// in the queue and a bool to signal when we want the whole thing to close.  
// Keep all this in a struct for convenient access.  
struct QueueControl  
{  
    std::condition_variable workActivity;  
    std::mutex workMutex;  
    std::condition_variable completionActivity;  
    std::mutex completionMutex;  
    bool terminate = false;  
} queueControl;  
  
void CALLBACK TaskQueueNewItemSubmitted(  
    void* context, XTaskQueueHandle, XTaskQueuePort port)  
{  
    // A new callback has been submitted. Notify the correct condition variable.  
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
    // Create a manual task queue.  
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
  
    // Listen to callback-submitted notifications to signal  
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
  
    // Wait a while for the callbacks to run.  
    Sleep(1000);  
  
    XTaskQueueTerminate(queue, true, nullptr, nullptr);  
  
    queueControl.terminate = true; 
    queueControl.workActivity.notify_all(); 
    queueControl.completionActivity.notify_all();  
  
    workThread.join();  
    completionThread.join();  
}  
```

## See also

[Designing the task queue](../async-task-queue-design.md)