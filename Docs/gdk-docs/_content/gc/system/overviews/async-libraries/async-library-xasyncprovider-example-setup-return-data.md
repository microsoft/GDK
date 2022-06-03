---
author: M-Stahl
title: Set up return data
description: Provides an example of how to set up return data that’s from a custom provider.
kindex: Setup Return Data
ms.author: chcoope
ms.topic: conceptual
edited: 12/11/2020
security: public
---

# Set up return data example

This topic provides an example of how to set up return data. If there's custom return data, support it by 
using the provider and a custom method so that you can retrieve the created data.

```c++
// Provider Callback
[](XAsyncOp op, const XAsyncProviderData* providerData)
{
    switch(op)
    {
    case XAsyncOp::GetResult:
        memcpy(providerData->buffer, &context->result, sizeof(uint64_t));
        break;

    case XAsyncOp::DoWork:
        context->result = 12345678;
        XAsyncComplete(providerData->async, S_OK, sizeof(uint64_t));
        break;

    // Other cases..
    }
}
```

As explained in the [setup example](async-library-xasyncprovider-example-setup-custom-provider.md), the provider must first 
add support for return data by specifying a buffer
size in [XAsyncComplete](../../../reference/system/xasyncprovider/functions/xasynccomplete.md) and filling it out in the
`GetResult` case. After support is added, add a method to
retrieve the result for the caller.

```c++
HRESULT CustomProviderMethodAsyncResult(XAsyncBlock* async, uint64_t* outResult)
{
    return XAsyncGetResult(async, CustomProviderMethodAsync,
        sizeof(uint64_t), outResult, nullptr);
}
```

You can call [XAsyncGetResult](../../../reference/system/xasyncprovider/functions/xasyncgetresult.md), but the previous method creates a 
readable pairing between the custom provider
method. It automatically converts to the data type that’s needed for
the async result. This method is also safe to use within any completion
callback to gather results from the work.

## See also

[XAsyncProvider library overview](async-library-xasyncprovider.md)  
[Set up custom provider (example)](async-library-xasyncprovider-example-setup-custom-provider.md)  
[Setup invocation methods (example)](async-library-xasyncprovider-example-setup-invocation-methods.md)  
[Set up cancelability (example)](async-library-xasyncprovider-example-setup-cancelability.md)  
[XAsyncProvider](../../../reference/system/xasyncprovider/xasyncprovider_members.md)  