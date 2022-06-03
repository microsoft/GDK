---
author: M-Stahl
title: Set up custom provider
description: Provides an example of how to set up a custom async provider.
kindex: Setup Custom Provider
ms.author: chcoope
ms.topic: conceptual
edited: 12/10/2020
security: public
---

# Set up custom provider example

This topic provides an example of how to set up a custom async provider. When writing a custom async provider, async methods are started by a
call to [XAsyncBegin](../../../reference/system/xasyncprovider/functions/xasyncbegin.md). This function has a callback
parameter that implements, for example, the handling of state changes, enqueueing
callbacks, and triggering completion.

```c++
struct Context
{
    uint64_t result;
};

Context* context = new Context{ 0 };
// Assume that the async block is already filled out with the completion callback and task queue.
HRESULT hr = XAsyncBegin(async, context, ProviderFuncIdentity, __FUNCTION__,
    [](XAsyncOp op, const XAsyncProviderData* providerData)
    {
        Context* context =
        reinterpret_cast<Context*>(providerData->context);
        switch (op)
        {
            case XAsyncOp::Begin:
                return XAsyncSchedule(providerData->async, 0);

            case XAsyncOp::Cleanup:
                delete context;
                break;

            case XAsyncOp::GetResult:
                memcpy(providerData->buffer, &context->result, sizeof(uint64_t));
                break;

            case XAsyncOp::DoWork:
                context->result = 12345678;
                XAsyncComplete(providerData->async, S_OK, sizeof(uint64_t));
                break;

            case XAsyncOp::Cancel:
                // This call can't be canceled.
                break;
        }

    return S_OK;
});
```

There's a lot to unpack here, but the basic idea is straightforward:
call `XAsyncBegin`, and give it a [provider callback](../../../reference/system/xasyncprovider/functions/xasyncprovider.md) 
to handle the different state changes. Recall that the async
block contains the task queue to use and an optional implementation of a
completion callback. The callback must then handle the [five different
cases](../../../reference/system/xasyncprovider/enums/xasyncop.md) for the async task's runtime as shown in the following table.

| Provider case | Responsibility                                      |
| ------------- | --------------------------------------------------- |
| `Begin`         | Called immediately by the call to `XAsyncBegin`. This case is responsible for scheduling the async work callback onto the task queue. This is handled by a call to [XAsyncSchedule](../../../reference/system/xasyncprovider/functions/xasyncschedule.md). It enqueues this callback to run again with the `DoWork` case via the task queue's work port.
| `Cleanup`       | Called when the async task is finishing, and any internal data that's created for tracking can be deleted. For the previous example code, this case cleans up the `Context` structure, which was allocated for keeping track of result data.
| `GetResult`     | Called when the user calls [XAsyncGetResult](../../../reference/system/xasyncprovider/functions/xasyncgetresult.md). The case must then write to the output buffer that's passed to the case. The original async result, therefore, must have been saved somewhere. The previous example code saves it in the `Context` structure.<br><br>Asynchronous Microsoft Game Development Kit (GDK) API functions that return data from an async task internally call `XAsyncGetResult` and convert that data to the form that's suitable for the caller. We recommend this for working with results. 
| `DoWork`        | Called via the task queue that has its work port dispatched. This means that the stack frame of this callback is running on the intended thread based on how the task queue was set up. Any work should be performed here.<br><br>In the [XAsyncRun](../../../reference/system/xasync/functions/xasyncrun.md) internal async provider implementation, this is where it executes the passed-in work callback. For custom providers, work can be done directly in the callback or with some custom method to encapsulate the functionality.<br><br>When the work is completed, [XAsyncComplete](../../../reference/system/xasyncprovider/functions/xasynccomplete.md) must be called. This function performs two tasks. First, it specifies if any output data is needed by supplying a data size. If a greater-than-zero value is supplied, an internal buffer is allocated for the `GetResult` case to write to. Second, it enqueues a call to the completion callback to be run on the task queue's completion port. The completion status code passed to `XAsyncComplete` becomes the code that's returned from a call to [XAsyncGetStatus](../../../reference/system/xasync/functions/xasyncgetstatus.md).
| `Cancel`        | Triggered by an outside call to [XAsyncCancel](../../../reference/system/xasync/functions/xasynccancel.md). If this case is unimplemented, as a result, nothing happens. To allow for canceling, the provider must be able to signal to any work being executed to stop. The `DoWork` case must then call `XAsyncComplete` with a status of `E_ABORT`. |

## See also

[XAsyncProvider library overview](async-library-xasyncprovider.md)  

[Set up invocation methods (example)](async-library-xasyncprovider-example-setup-invocation-methods.md)  

[Set up return data (example)](async-library-xasyncprovider-example-setup-return-data.md)  

[Set up Cancelability (example)](async-library-xasyncprovider-example-setup-cancelability.md)  

[XAsyncProvider](../../../reference/system/xasyncprovider/xasyncprovider_members.md)  