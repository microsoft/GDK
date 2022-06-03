---
author: M-Stahl
title: Error handling in the Microsoft Game Development Kit
description: Describes how to handle error results in the Microsoft Game Development Kit (GDK).
kindex: Error handling
ms.author: kevinasg
ms.topic: conceptual
edited: 04/08/2020
security: public
---

# Error handling in the Microsoft Game Development Kit

The Microsoft Game Development Kit (GDK) is built from many technologies, both new and existing. These technologies include many classic Win32-style APIs, COM APIs, DirectX graphics APIs, and others, which already have standard error-handling methods defined. As a result, how to handle errors varies based on the specific technology.

Most Microsoft Game Development Kit (GDK) APIs return an [HRESULT](/windows/win32/debug/error-handling) value, although some APIs might still require the use of classic Win32 or COM error handling.

For the most part, the Microsoft Game Development Kit (GDK) APIs are designed to be "exception free," but games can still use C++ exception handling if they choose. This is often a good choice for handling unrecoverable errors that require a fast fail. It's also a good idea to continue using "exception-safe" coding styles that work with and without C++ exceptions in the code.

* [Handling HRESULTS from the Microsoft Game Development Kit (GDK) APIs](#new-apis)
* [Handling HRESULTS from Xbox Live APIs](#xbl-apis)
* [Handling errors with the new asynchronous model](#async-apis)
* [Classic Win32 error handling and COM error handling](#classic-apis)

<a name="new-apis"></a>

## Handling HRESULTS from the Microsoft Game Development Kit (GDK) APIs

The majority of Microsoft Game Development Kit (GDK) APIs return an `HRESULT` value to indicate success or failure of the API call. You can use the `SUCCEEDED(hr)` or `FAILED(hr)` macros to handle success or errors that can be recovered from. For special handling for specific error cases, you can check the `HRESULT` return value to determine how to handle the error.
> [!NOTE]
> Generally, success is indicated by `S_OK`, but there are other valid success return values, including `S_FALSE`. While this value isn't commonly used in modern COM APIs, we still recommend that you avoid using `hr == S_OK` and instead use `SUCCEEDED(hr)`.

The Microsoft Game Development Kit (GDK) defines a set of custom error codes in the *XgameErr.h* file. For more information, see [Error codes](../../reference/errorcodes.md).

Many Microsoft Game Development Kit (GDK) APIs use the Windows Implementation Library (WIL) to wrap errors that are returned from internal Win32 or COM calls. To learn more about how WIL wraps errors to return an `HRESULT`, see [Error handling helpers](https://github.com/microsoft/wil/wiki/Error-handling-helpers).

<a name="xbl-apis"></a>

## Handling HRESULTS from Xbox Live APIs

For a list of possible `HRESULTS` that are returned from Xbox Live calls, see [Xbox Live HRESULT Error Codes](../../reference/live/xbl-hresult-error-codes.md).

You can also pass the `HRESULT` value to [XblGetErrorCondition](../../reference/live/xsapi-c/errors_c/functions/xblgeterrorcondition.md) to group error conditions into groups of related errors, which you can then take action on. The error groups are defined in the [XblErrorCondition](../../reference/live/xsapi-c/errors_c/enums/xblerrorcondition.md) enumeration.

<a name="async-apis"></a>

## Handling errors with the new asynchronous model

The Microsoft Game Development Kit (GDK) introduces a new C style async model, described in [Asynchronous Programming Model](async-programming-model.md). In the async model, there are typically pairs of APIs that you call, for example, [XGameUiShowTextEntryAsync](../../reference/system/xgameui/functions/xgameuishowtextentryasync.md) and [XGameUiShowTextEntryResult](../../reference/system/xgameui/functions/xgameuishowtextentryresult.md).

### Submitting the async task

The `...Async` API is called to queue up the function call on another thread. One of the parameters that's passed to the async call is an [XAsyncBlock](../../reference/system/xasync/structs/xasyncblock.md) structure, which may optionally contain a user-specified callback function. If present, this function is called when the async task is completed. [XAsyncBlock](../../reference/system/xasync/structs/xasyncblock.md) can also optionally specify a specific task queue to use for the async queueing. To track the progress of the call, you can use [XAsyncBlock](../../reference/system/xasync/structs/xasyncblock.md).

The `...Async` function returns an `HRESULT` code, which indicates if the API was able to queue the task.

The most common `HRESULTS` returns from an async API call are the following:

* `S_OK`: Indicates that the task was successfully added to the task queue
* `E_NO_TASK_QUEUE`: Indicates that the process task queue has been disabled (set to `null`) and that [XAsyncBlock](../../reference/system/xasync/structs/xasyncblock.md) didn't specify a task queue

### Checking the progress of an async task

You can call [XAsyncGetStatus](../../reference/system/xasync/functions/xasyncgetstatus.md) to check on the status of an async task by passing in the [XAsyncBlock](../../reference/system/xasync/structs/xasyncblock.md) that was used in the async API call. You can also pass in an optional Boolean value that indicates if [XAsyncGetStatus](../../reference/system/xasync/functions/xasyncgetstatus.md) waits for the async task to be completed or canceled.

The most common `HRESULTS` that are returned from an [XAsyncGetStatus](../../reference/system/xasync/functions/xasyncgetstatus.md) call are the following:

* `S_OK`: The async task was successfully completed.
* `E_PENDING`: The async task is still queued or is in progress.
* `E_ABORT`: The async task was canceled.
* `E_INVALIDARG`: The async block is invalid.
* Other: If the async task fails, this indicates that the `HRESULT` error code was returned by the async task. For a list of possible values, check the specific API documentation or see [Error codes](../../reference/errorcodes.md).

### Checking the result of an async task

If you've specified a callback in the async block, then in the callback function you can check the result of the async call by calling the matching `...Result` API. The `HRESULT` return value should match what would be returned by calling [XAsyncGetStatus](../../reference/system/xasync/functions/xasyncgetstatus.md). If you call the API in the callback, you shouldn't get `E_PENDING` as a return value. However, if you call the API outside the callback, you should check the return value to ensure that the task isn't still in progress.

<a name="classic-apis"></a>

## Classic Win32 error handling and COM error handling

For Win32 APIs that don't return an `HRESULT` value, check the documentation to see how the return value indicates an error (typically by returning zero). You can then retrieve the most recent error code by calling the [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) API. Note that you can convert a classic Win32 error code to an `HRESULT` by using the [HRESULT_FROM_WIN32](/windows/win32/api/winerror/nf-winerror-hresult_from_win32) macro.

For more information about error handling in Win32 APIs, see [Error Handling](/windows/win32/debug/error-handling).

For information about handling COM errors, see [Error Handling in COM](/windows/win32/com/error-handling-in-com).