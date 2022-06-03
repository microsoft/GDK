---
author: M-Stahl
title: Set up invocation methods
description: Provides an example of how to set up invocation methods for a custom provider.
kindex: Setup Invocation Methods
ms.author: chcoope
ms.topic: conceptual
edited: 12/10/2020
security: public
---

# Set up invocation methods example

This topic provides an example of how to set up invocation methods for a custom provider. When working with custom async providers, it's best to use invocation
methods so that the provider can be reused as needed.

```c++
HRESULT CustomProviderMethodAsync(XAsyncBlock* async)
{
    // Set up the context for your method.
    void* context;
    HRESULT hr = XAsyncBegin(async, context, CustomProviderMethodAsync, __FUNCTION__,
        [](XAsyncOp op, const XAsyncProviderData* providerData)
        {
            // Provider cases are handled here.
            return S_OK;
        });
    return hr;
}
```

This example shows how all asynchronous Microsoft Game Development Kit (GDK) methods are implemented and 
allows for reuse of the provider. If the `DoWork` case is highly
specific, it becomes a specialized asynchronous function. To make
it generic, allow the `DoWork` case to be customized in some way.

## See also

[XAsyncProvider library overview](async-library-xasyncprovider.md)  

[Set up custom provider (example)](async-library-xasyncprovider-example-setup-custom-provider.md)  

[Set up return data (example)](async-library-xasyncprovider-example-setup-return-data.md)  

[Set up cancelability (example)](async-library-xasyncprovider-example-setup-cancelability.md)  

[XAsyncProvider](../../../reference/system/xasyncprovider/xasyncprovider_members.md)  