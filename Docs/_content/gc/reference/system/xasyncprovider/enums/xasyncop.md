---
author: M-Stahl
title: XAsyncOp
description: Represents an operation code for an asynchronous provider.
kindex: XAsyncOp
ms.author: mstahl
ms.topic: reference
edited: 03/04/2020
security: public
applies-to: pc-gdk
---

# XAsyncOp
  
Represents an operation code for an asynchronous provider.  
  
## Syntax
  
```cpp
enum class XAsyncOp  : uint32_t  
{  
    Begin,  
    DoWork,  
    GetResult,  
    Cancel,  
    Cleanup  
}  
```  
  
## Constants
  
| Constant | Description |
| --- | --- |
| Begin | The asynchronous provider is invoked with this operation code when [XAsyncBegin](../functions/xasyncbegin.md) is invoked.<br/>If this operation code is implemented, the asynchronous provider should start their asynchronous work, by either calling [XAsyncSchedule](../functions/xasyncschedule.md) or starting an external asynchronous process such as overlapped I/O.<br/>![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif)**Note:** Asynchronous work performed for this operation code must not block the thread. |  
| DoWork | The asynchronous provider is invoked with this operation code when [XAsyncSchedule](../functions/xasyncschedule.md) has been called to schedule work.<br/>If this operation code is implemented, the asynchronous provider should perform their asynchronous work and then call [XAsyncComplete](../functions/xasynccomplete.md), specifying the data payload size in *requiredBufferSize*. If additional work needs to be done the asynchronous provider can schedule it and then call `XAsyncComplete`, specifying the error code E_PENDING in *result*. |  
| GetResult | The asynchronous provider is invoked with this operation code after an asynchronous call completes and the user needs to get the resulting data payload.<br/>The values for the *buffer* and *bufferSize* fields of [XAsyncProviderData](../structs/xasyncproviderdata.md) have been validated. |  
| Cancel | The asynchronous provider is invoked with this operation code when the asynchronous work should be canceled.<br/>The asynchronous provider should cancel all asynchronous work and then call [XAsyncComplete](../functions/xasynccomplete.md), specifying the error code E_ABORT in *result*. |  
| Cleanup | The asynchronous provider is invoked with this operation code when the asynchronous call is either completed or canceled and data in the context can be cleaned up. |  
  
## Remarks
  
The [XAsyncProvider](../functions/xasyncprovider.md) callback function for an asynchronous provider is called repeatedly, and what that asynchronous provider should do for each call is determined by the operation code specified for each call. `XAsyncOp` represents the operation codes that can be implemented by an asynchronous provider.  
An asynchronous provider should implement only those operation codes from `XAsyncOp` needed to perform asynchronous work. For example, an asynchronous provider that performs non-cancelable asynchronous I/O work which doesn't require cleanup only needs to implement `XAsyncOp::GetResult`.  
  
For an example of an asynchronous provider that implements the `DoWork`, `GetResult`, and `Cleanup` operation codes from `XAsyncOp`, see the "Async Library" section in [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md#heading-7).  
  
## Requirements
  
**Header:** XAsyncProvider.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProviderData](../structs/xasyncproviderdata.md)  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  