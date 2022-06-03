---
author: M-Stahl
title: Submitting callbacks
description: Provides an example that shows how a callback is submitted to either the work port or the completion port of a task queue.
kindex:
- Async task queue design
- Submitting callbacks
ms.author: jgup
ms.topic: conceptual
edited: '08/10/2020'
security: public
---

# How to: Submitting callbacks

## Example

The following example shows how to submit a callback to either the work port
or the completion port of a task queue. First, it submits a work callback. Then, at the end of the work callback, it submits a completion callback. This is typical usage. The `SubmitCallbacks` function is
used in subsequent scenarios for brevity.

```c++
void CALLBACK SampleCompletionCallback(void*, bool cancel)
{
    printf("Completion invoked on thread %d. Cancel? %d.\r\n",
    GetCurrentThreadId(), cancel);
}

void CALLBACK SampleWorkCallback(void* context, bool cancel)
{
    printf("Worker invoked on thread %d. Cancel? %d.\r\n",
    GetCurrentThreadId(), cancel);

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

## See also

[Designing the task queue](../async-task-queue-design.md)