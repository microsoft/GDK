---
title: Making async calls in the XSAPI C API
description: Making asynchronous calls using the XSAPI C API.
ms.date: 06/10/2018
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one, developer program,
author: joannaleecy
ms.author: joanlee
security: public
applies-to: pc-gdk
---

# Making async calls in the XSAPI C API

An **asynchronous API** is an API that returns quickly but starts an **asynchronous task** and the result is returned after the task is finished.

Traditionally, games have had little control over which thread executes the **asynchronous task** and which thread returns the results when using a **completion callback**.
Some games are designed so that a section of the heap is only touched by a single thread to avoid any need for thread synchronization.
If the **completion callback** isn't called from a thread the game controls, updating shared state with the result of an **asynchronous task** will require thread synchronization.

The XSAPI C API exposes a new asynchronous C API that gives developers direct thread control when
making an **asynchronous API** call, such as **XblSocialGetSocialRelationshipsAsync()**, **XblProfileGetUserProfileAsync()** and **XblAchievementsGetAchievementsForTitleIdAsync()**.

Here is a basic example calling the **XblProfileGetUserProfileAsync** API:

```cpp
 XAsyncBlock* asyncBlock = new XAsyncBlock();
    asyncBlock->queue = GlobalState()->queue;
    asyncBlock->context = nullptr;
    asyncBlock->callback = [](XAsyncBlock* asyncBlock)
    {
        XblUserProfile profile = { 0 };
        HRESULT hr = XblProfileGetUserProfileResult(asyncBlock, &profile);
        delete asyncBlock;
    };

    HRESULT hr = XblProfileGetUserProfileAsync(GlobalState()->xboxLiveContext, GlobalState()->xboxUserId, asyncBlock);
```

To understand this calling pattern, you will need to understand how to use the **XAsyncBlock** and the **XTaskQueueHandle**.

* The **XAsyncBlock** carries all of the information pertaining to the **asynchronous task** and **completion callback**.

* The **XTaskQueueHandle** allows you to determine which thread executes the **asynchronous task** and which thread calls the XAsyncBlock's **completion callback**.

## The **XAsyncBlock**

Let's take a look at the **XAsyncBlock** in detail.
It is a struct defined as follows:

```cpp
typedef struct XAsyncBlock
{
    /// <summary>
    /// The queue to queue the call on
    /// </summary>
    XTaskQueueHandle queue;

    /// <summary>
    /// Optional context pointer to pass to the callback
    /// </summary>
    void* context;

    /// <summary>
    /// Optional callback that will be invoked when the call completes
    /// </summary>
    XAsyncCompletionRoutine* callback;

    /// <summary>
    /// Internal use only
    /// </summary>
    unsigned char internal[sizeof(void*) * 4];
};
```

The **XAsyncBlock** contains:

* *queue* - an XTaskQueueHandle which is a handle repesenting information about where to run a piece of work. If this is not set, a default queue will be used.

* *context* - allows you to pass data to the callback function.

* *callback* - an optional callback function that will be called after the asynchronous work has been done.  If you don't specify a callback, you can wait for the **XAsyncBlock** to complete with **XAsyncGetStatus** and then get the results.

You should create a new XAsyncBlock on the heap for each async API you call.
The XAsyncBlock must live until the XAsyncBlock's completion callback is called and then it can be deleted.

> **Important:**  
> An **XAsyncBlock** must remain in memory until the **asynchronous task** completes. If it is dynamically allocated, it can be deleted inside the XAsyncBlock's **completion callback**.

### Waiting for an **asynchronous task**

You can tell an **asynchronous task** is complete a number of different ways:

* The XAsyncBlock's **completion callback** is called.
* Call **XAsyncGetStatus** with true to wait until it completes.

With **XAsyncGetStatus**, the **asynchronous task** is considered complete after the XAsyncBlock's **completion callback** executes however the XAsyncBlock's **completion callback** is optional.

Once the **asynchronous task** is complete, you can get the results.


### Getting the result of the **asynchronous task**

To get the result, most **asynchronous API** functions have a corresponding \[Name of Function\]Result function to receive the result of the asynchronous call.

In our example code, **XblProfileGetUserProfileAsync** has a corresponding **XblProfileGetUserProfileResult** function.
You can use this function to retrieve the result of the function and act accordingly.

For full details on retrieving results, see the documentation of each **asynchronous API** function.

## The **XTaskQueueHandle**

The **XTaskQueueHandle** allows you to determine which thread executes the **asynchronous task** and which thread calls the XAsyncBlock's **completion callback**.

You can control which thread performs these operation by setting a *dispatch mode*.
There are three dispatch modes available:

* *Manual* - The manual queue are not automatically dispatched.  It is up to the developer to dispatch them on any thread they want. This can be used to assign either the work or callback side of an async call to a specific thread.  This is discussed in more detail below.

* *Thread Pool* - Dispatches using a thread pool.  The thread pool invokes the calls in parallel, taking a call to execute from the queue in turn as threadpool threads become available.  This is the easist to use, but gives you the least amount of control over which thread is used.

* *Serialized Thread Pool* - Dispatches using a thread pool.  The thread pool invokes the calls in serial, taking a call to execute from the queue in turn as the single threadpool thread becomes available.

* *Immediate* - Immediately dispatches the queued work on the thread from which it was submitted.

To create a new **XTaskQueueHandle** you will need to call **XTaskQueueCreate**.
For example:

```cpp
STDAPI XTaskQueueCreate(
    _In_ XTaskQueueDispatchMode workDispatchMode,
    _In_ XTaskQueueDispatchMode completionDispatchMode,
    _Out_ XTaskQueueHandle* queue
    ) noexcept;
```

This function takes two `XTaskQueueDispatchMode` parameters.
There are three possible values for `XTaskQueueDispatchMode`:

```cpp
/// <summary>
/// Describes how task queue callbacks are processed.
/// </summary>
enum class XTaskQueueDispatchMode : uint32_t
{
    /// <summary>
    /// Callbacks are invoked manually by XTaskQueueDispatch
    /// </summary>
    Manual,

    /// <summary>
    /// Callbacks are queued to the system thread pool and will
    /// be processed in order by the thread pool across multiple thread
    /// pool threads.
    /// </summary>
    ThreadPool,
    
    /// <summary>
    /// Callbacks are queued to the system thread pool and
    /// will be processed one at a time.
    /// </summary>
    SerializedThreadPool,
    
    /// <summary>
    /// Callbacks are not queued at all but are dispatched
    /// immediately by the thread that submits them.
    /// </summary>
    Immediate
};
```

**workDispatchMode** determines the dispatch mode for the thread which handles the async work, while **completionDispatchMode** determines the dispatch mode for the thread which handles the completion of the async operation.

Once you have created your **XTaskQueueHandle** simply add it to the **XAsyncBlock** to control threading on your work and completion functions.
When you are finished using the **XTaskQueueHandle**, typically when the game is ending, you can close it with **XTaskQueueCloseHandle**:

```cpp
STDAPI_(void) XTaskQueueCloseHandle(
    _In_ XTaskQueueHandle queue
    ) noexcept;
```

**Call Sample**:
  
```cpp
XTaskQueueCloseHandle(queue);
```

### Manually dispatching an **XTaskQueueHandle**

If you used the manual queue dispatch mode for an **XTaskQueueHandle** work or completion queue, you will need to manually dispatch.
Let us say that an **XTaskQueueHandle** was created where both the work queue and the completion queue are set to dispatch manually like so:

```cpp
XTaskQueueHandle queue = nullptr;
HRESULT hr = XTaskQueueCreate(
    XTaskQueueDispatchMode::Manual,
    XTaskQueueDispatchMode::Manual,
    &queue);
```

In order to dispatch work that has been assigned **XTaskQueueDispatchMode::Manual** you will have to dispatch it with the **XTaskQueueDispatch** function.

```cpp
STDAPI_(bool) XTaskQueueDispatch(
    _In_ XTaskQueueHandle queue,
    _In_ XTaskQueuePort port,
    _In_ uint32_t timeoutInMs
    ) noexcept;
```

**Call Sample**

```cpp
HRESULT hr = XTaskQueueDispatch(queue, XTaskQueuePort::Completion, 0);
```

* *queue* - which queue to dispatch work on.
* *port* - an instance of the **XTaskQueuePort** enum.
* *timeoutInMs* - a uint32_t for the timeout in milliseconds.

There are two callback types defined by the **XTaskQueuePort** enum:

```cpp
/// <summary>
/// Declares which port of a task queue to dispatch or submit
/// callbacks to.
/// </summary>
enum class XTaskQueuePort : uint32_t
{
    /// <summary>
    /// Work callbacks
    /// </summary>
    Work,

    /// <summary>
    /// Completion callbacks after work is done
    /// </summary>
    Completion
};
```

### When to call **XTaskQueueDispatch**

In order to check when the queue has received a new item you can call **XTaskQueueRegisterMonitor** to set an event handler to let your code know that either work or completions are ready to be dispatched.

```cpp
STDAPI XTaskQueueRegisterMonitor(
    _In_ XTaskQueueHandle queue,
    _In_opt_ void* callbackContext,
    _In_ XTaskQueueMonitorCallback* callback,
    _Out_ XTaskQueueRegistrationToken* token
    ) noexcept;
```

**XTaskQueueRegisterMonitor** takes the following parameters:

* *queue* - the async queue you are submitting the callback for.
* *callbackContext* - a pointer to data that should be passed to the submit callback.
* *callback* - the function that will be invoked when a new callback is submitted to the queue.
* *token* - a token that will be used in a later call to **XTaskQueueUnregisterMonitor** to remove the callback.

For example, here is a call to **XTaskQueueRegisterMonitor**:

`XTaskQueueRegisterMonitor(queue, nullptr, HandleAsyncQueueCallback, &m_callbackToken);`

The corresponding **XTaskQueueMonitorCallback** callback might be implemented as follows:

```cpp
void CALLBACK HandleAsyncQueueCallback(
    _In_opt_ void* context,
    _In_ XTaskQueueHandle queue,
    _In_ XTaskQueuePort port)
{
    switch (port)
    {
    case XTaskQueuePort::Work:
        {
            std::lock_guard<std::mutex> lock(g_workReadyMutex);
            g_workReady = true;
        }

        g_workReadyConditionVariable.notify_one(); // (std::condition_variable)
        break;
    }
}
```

Then in a background thread, you can listen for this condition variable to wake up and call **XTaskQueueDispatch**.

```cpp
void BackgroundWorkThreadProc(XTaskQueueHandle queue)
{
    while (true)
    {
        {
            std::unique_lock<std::mutex> cvLock(g_workReadyMutex);
            g_workReadyConditionVariable.wait(cvLock, [] { return g_workReady; });

            if (g_stopBackgroundWork)
            {
                break;
            }

            g_workReady = false;
        }

        bool workFound = false;
        do
        {
            workFound = XTaskQueueDispatch(queue, XTaskQueuePort::Work, 0);
        } while (workFound);
    }
    
    XTaskQueueCloseHandle(queue);
}
```

## See also

[Introduction to the XSAPI C APIs](live-xsapi-flat-c.md)

[XSAPI reference](../../../reference/live/xsapi-c/atoc-xsapi-c.md)

[libHttpClient](../../../reference/live/httpclient/atoc-httpclient.md)
