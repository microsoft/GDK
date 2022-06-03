---
author: M-Stahl
title: Set up cancelability
description: Provides an example of how to set up cancelability in a custom provider callback.
kindex: Setup Cancelability
ms.author: chcoope
ms.topic: conceptual
edited: 12/14/2020
security: public
---

# Set up cancelability example

This topic provides an example of how to set up cancelability in a custom provider callback. Basic async methods that are started with [XAsyncRun](../../../reference/system/xasync/functions/xasyncrun.md) can't be
canceled. Cancelability support can be manually added when you're using a
custom provider. After support is added, [XAsyncCancel](../../../reference/system/xasync/functions/xasynccancel.md)
triggers the `Cancel` case.

```c++
// Provider callback.
[](XAsyncOp op, const XAsyncProviderData* providerData)
{
    switch(op)
    {
        case XAsyncOp::DoWork:
        {
            bool canceled = false;
            while (true)
            {
                DWORD waitResult = WaitForSingleObject(callData->cancelEvent, 0);
                if (waitResult != WAIT_TIMEOUT)
                {
                    canceled = true;
                    break;
                }

                // Continue doing normal work. Should break if completed.
            }

            if (canceled)
            {
                XAsyncComplete(providerData->async, E_ABORT, 0);
            }
            else
            {
                XAsyncComplete(providerData->async, S_OK, 0);
            }

            break;
        }
        
        case XAsyncOp::Cancel:
            SetEvent(callData->cancelEvent);
            break;

        // Other cases.
    }
}
```

In these provider cases, cancelability support is added by using a
Windows event. It's set if the `Cancel` case is called, and the
`DoWork` case ends with a call to [XAsyncComplete](../../../reference/system/xasyncprovider/functions/xasynccomplete.md) with
the `E_ABORT` status. Any method can be used to signal the cancel. However, 
an event is a simple way to signal the cancel that's supported on any Microsoft Game Development Kit (GDK) platform that can be targeted.

To trigger the `Cancel` case, call `XAsyncCancel` 
with the async block for the task, shown as follows.

```c++
XAsyncCancel(async);
```

## See also

[XAsyncProvider library overview](async-library-xasyncprovider.md)  

[Set up custom provider (example)](async-library-xasyncprovider-example-setup-custom-provider.md)  

[Set up invocation methods (example)](async-library-xasyncprovider-example-setup-invocation-methods.md)  

[Set up return data (example)](async-library-xasyncprovider-example-setup-return-data.md)  

[XAsyncProvider](../../../reference/system/xasyncprovider/xasyncprovider_members.md)  