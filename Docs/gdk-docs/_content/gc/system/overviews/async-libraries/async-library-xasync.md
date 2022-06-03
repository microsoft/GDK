---
author: M-Stahl
title: XAsync library overview
description: Describes the purpose of the XAsync library and contains examples for usage.
kindex: XAsync Library Overview
ms.author: chcoope
ms.topic: conceptual
edited: 11/25/2020
security: public
---

# XAsync library overview

The [XAsync](../../../reference/system/xasync/xasync_members.md) library provides methods and data that define async tasks and their callbacks. The main async primitive, [XAsyncBlock](../../../reference/system/xasync/structs/xasyncblock.md), is defined in this library. It’s a
requirement for all async tasks.

Beyond the async block, this library provides methods to [start basic async calls](../../../reference/system/xasync/functions/xasyncrun.md), [get async task status](../../../reference/system/xasync/functions/xasyncgetstatus.md), and [attempt to cancel tasks](../../../reference/system/xasync/functions/xasynccancel.md).

<a id="xasyncblock"></a>

## XAsyncBlock

The [XAsyncBlock](../../../reference/system/xasync/structs/xasyncblock.md) is the main async primitive that contains members that are used for implementing the completion callback, providing data to the completion callback, and choosing a task queue to run in.

The async block also contains private data that's used internally by the system for runtime behavior. As a result, this block can’t be shared between multiple active tasks. The system uses this data to identify the async call while the call is active.

```c++
struct XAsyncBlock
{
    /// <summary>
    /// The queue to queue the call on.
    /// </summary>
    XTaskQueueHandle queue;
    
    /// <summary>
    /// Optional context pointer to pass to the callback.
    /// </summary>
    void* context;
    
    /// <summary>
    /// Optional callback that is invoked when the call completes.
    /// </summary>
    XAsyncCompletionRoutine* callback;
    
    /// <summary>
    /// Internal use only.
    /// </summary>
    unsigned char internal[sizeof(void*) * 4];
};
```

## See also

[Setup async task](async-library-xasync-example-setup-async-task.md)  
[Run simple task](async-library-xasync-example-run-simple-task.md)  
[Run Microsoft Game Development Kit API task](async-library-xasync-example-run-gdk-task.md)  
[XAsync system API contents](../../../reference/system/xasync/xasync_members.md)  