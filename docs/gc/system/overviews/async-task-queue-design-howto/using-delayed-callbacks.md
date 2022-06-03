---
author: M-Stahl
title: Using delayed callbacks
description: Provides an example that shows how to use delayed callbacks, invoking 10 callbacks once every 500 ms. Use a task queue to submit callbacks in the future by using the `XTaskQueueSubmitDelayedCallback` API. In this way, you can retry a failed call after a short delay, or use it as a cheap timer for periodic events.
kindex:
- Async task queue design
- Using delayed callbacks
ms.author: jgup
ms.topic: conceptual
edited: '08/12/2020'
security: public
---

# How to: Using delayed callbacks

## Example

Use a task queue to submit callbacks in the future by using the `XTaskQueueSubmitDelayedCallback` API. In this way, you can retry a failed call after a short delay, or use it as a cheap timer for periodic events. 

The following example invokes 10 callbacks once every 500 ms.

```c++
void SubmittingDelayedCallback()  
{  
    XTaskQueueHandle queue;  
  
    HRESULT hr = XTaskQueueCreate(  
        XTaskQueueDispatchMode::ThreadPool,  
        XTaskQueueDispatchMode::ThreadPool,  
        &queue);  
  
    if (FAILED(hr))  
    {  
        printf("Failed to create task queue: 0x%x\r\n", hr);  
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
                callContext->count = 10; // Prevents us from waiting forever.  
            }  
        }  
    };  
  
    callContext.count = 0;  
    callContext.queue = queue;  
    callContext.callback = callback;  
  
    // Use the task queue to make 10 periodic calls.  
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
  
    // Now, wait for all of the calls to be completed.  
    while (callContext.count != 10)  
    {  
        Sleep(1000);  
    }  
  
    XTaskQueueTerminate(queue, true, nullptr, nullptr);  
    XTaskQueueCloseHandle(queue);  
}  
```

## Sample Output

```
Periodic callback 1  
Periodic callback 2  
Periodic callback 3  
Periodic callback 4  
Periodic callback 5  
Periodic callback 6  
Periodic callback 7  
Periodic callback 8  
Periodic callback 9  
Periodic callback 10  
```

## See also  

[Designing the task queue](../async-task-queue-design.md)  