---
author: M-Stahl
title: Using a task queue waiter
description: Provides an example that shows how to use a task queue waiter. You can register a Win32 kernel handle with a task queue. Your callback will be submitted to the queue when the handle becomes signaled.
kindex:
- Async task queue design
- Using a task queue waiter
ms.author: jgup
ms.topic: conceptual
edited: '08/13/2020'
security: public
---

# How to: Using a task queue waiter

## Example

You can register a Win32 kernel handle with a task queue. Your callback will be submitted to the queue when the handle becomes signaled. Typically, you would create an auto-reset event to use for signaling. If the handle isn't auto-reset, a new callback is submitted when the current callback is completed for as long as the handle is signaled.

The following example shows how to use a task queue waiter.

```c++
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
  
    // Now, whenever our wait event becomes signaled, the callback will be called.  
    for (uint32_t i = 0; i < 5; i++)  
    {  
        SetEvent(waitEvent);  
        Sleep(100);  
    }  
  
    // Note: Unregistering the waiter is optional.  
    XTaskQueueUnregisterWaiter(queue, token);  
    XTaskQueueCloseHandle(queue);  
    CloseHandle(waitEvent);  
}  
```

## Sample output

```
Callback invoked.  
Callback invoked.  
Callback invoked.  
Callback invoked.  
Callback invoked.  
```

## See also

[Designing the task queue](../async-task-queue-design.md)