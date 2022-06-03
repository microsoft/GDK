---
title: Getting started with Xbox services APIs
description: Initializing the gaming runtime, creating XTaskQueue, setting up HttpClient trace, initializing Xbox Services API (XSAPI), and cleaning up XSAPI.
kindex:
- Getting started with Xbox services APIs
- xbox live, getting started
ms.topic: conceptual
author: joannaleecy
ms.author: migreen
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Getting started with Xbox services APIs

## Initialize Gaming Runtime

Xbox services APIs (XSAPI) depend on the Gaming Runtime service. Before calling any XSAPI APIs, you will need to initialize the Gaming Runtime service.

```cpp
#include <XGameRuntimeInit.h>
...
HRESULT hr = XGameRuntimeInitialize();
```

## Optionally create XTaskQueue

Most of the Xbox services APIs are asynchronous APIs, and require the use of a task queue. A task queue is an API for queuing work and completion task callbacks. To learn more about XTaskQueue and different dispatch modes, please refer to [XTaskQueue Overview](../../system/overviews/async-task-queue-design.md)

For example, the following code creates a task queue using a system thread pool:
```cpp
#include <XTaskQueue.h>
...
XTaskQueueHandle queue = nullptr;

HRESULT hr = XTaskQueueCreate(
    XTaskQueueDispatchMode::ThreadPool,
    XTaskQueueDispatchMode::ThreadPool,
    &queue)
```
Make sure to release your acquired task queue handle back to the system when no longer needed:
```cpp
XTaskQueueCloseHandle(queue);
queue = nullptr;
```

If you choose not to create your own task queue, then make sure to pass in nullptr when a queue handle is needed. When nullptr is used, the task system will use ThreadPool by default and can be overridden by calling [XTaskQueueSetCurrentProcessTaskQueue](../../reference/system/xtaskqueue/functions/xtaskqueuesetcurrentprocesstaskqueue.md).

## Optionally set up HttpClient trace

To view additional runtime debug info, make sure to set up HttpClient's Trace functionality.

The following code sets the HttpClient trace level and enables output for debugger info:

```cpp
HCSettingsSetTraceLevel(HCTraceLevel::Verbose);
HCTraceSetTraceToDebugger(true);
```

## Initialize Xbox services API (XSAPI)

Next, you will need to **Initialize XSAPI**, before calling any Xbox services APIs:

```cpp
#include <xsapi-c/services-c.h>
...
XblInitArgs xblArgs = {};
xblArgs.queue = queue; // TODO: Only include this line if you've choosen to create your own XTaskQueue. Otherwise, by default, this line is not needed.
xblArgs.scid = "00000000-0000-0000-0000-000000000000"; // TODO: Add your scid here;

HRESULT hr = XblInitialize(&xblArgs);
if (FAILED(hr))
{
    // TODO: Handle failure
}
```

## Sign-in the user to Xbox Live

Most of the Xbox services APIs require the user to sign-in to Xbox Live first.  
To sign-in a user to Xbox Live, please see the code example of the [XUserAddAsync API](../../system/overviews/user/xuser_howto_best_practice_signing_in.md) API.

## Create an XboxLiveContext

An XboxLiveContext object represents the service context associated to a given user.

Most Xbox services APIs require you to pass in an XboxLiveContextHandle representing the context of the calling user.  
To create an Xbox Live context, use the [XblContextCreateHandle API](../../reference/live/xsapi-c/xbox_live_context_c/functions/xblcontextcreatehandle.md) and pass in the XUserHandle object acquired from the step above.

## Make a service call to Xbox services

Now that you have an XboxLiveContext object associated with the XUserHandle object for the user who has signed-in, you can make service calls to Xbox services.
  
For example, to retrieve the user's friends list, you can:  

```cpp
#include <xsapi-c/services-c.h>
...
auto asyncBlock = std::make_unique<XAsyncBlock>(); 
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*

    XblSocialRelationshipResultHandle relationshipResult{ nullptr };
    HRESULT hr = XblSocialGetSocialRelationshipsResult(asyncBlock, &state.socialResultHandle);

    // Use the result in the game

    XblSocialRelationshipResultCloseHandle(relationshipResult);
};

HRESULT hr = XblSocialGetSocialRelationshipsAsync(
    xboxLiveContext,
    xboxUserId,
    socialRelationshipFilter,
    0,
    0,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
// CODE SNIPPET END
```

## Cleaning up XSAPI

There are two cleanup scenarios to be aware of:
1. Cleaning up XSAPI when the app terminates
1. Cleaning up XSAPI when the app is suspended

In the __*first*__ scenario, there currently is no synchronous __XblCleanup()__ API that you can call, and app termination, by its very lifecycle nature, needs to be handled synchronously and immediately.  Therefore, normal OS-level cleanup -- that happens with process termination of the app -- is relied upon and sufficient for this situation.

In the __*second*__ scenario, the process remains alive but its resources are expected to be freed back to the system.  In this situation, the best practice here is to call __XblCleanupAsync()__ like so:

```cpp
void Game::OnSuspending()
{
  static XAsyncBlock emptyBlock{nullptr, nullptr, nullptr};
  ...
  XblCleanupAsync(&emptyBlock);
}
```

...and then re-initialize and restore the user in your resume logic:

```cpp
void Game::OnResuming()
{
  // re-initialize Live through XblInitialize()
  // restore the logged-in user
}
```