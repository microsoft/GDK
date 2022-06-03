---
author: M-Stahl
title: XAsyncProvider
description: A callback function that implements the async call.
kindex: XAsyncProvider
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
security: public
applies-to: pc-gdk
---

# XAsyncProvider
  
Represents the callback function of an asynchronous call for an asynchronous provider.  
  
## Syntax
  
```cpp
HRESULT XAsyncProvider(  
         XAsyncOp op,  
         const XAsyncProviderData* data  
)  
```  
  
### Parameters
  
*op* &nbsp;&nbsp;\_In\_  
Type: [XAsyncOp](../enums/xasyncop.md)  
  
The operation code to be performed by the callback function.  
  
*data* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncProviderData*](../structs/xasyncproviderdata.md)  
  
A pointer to the [XAsyncProviderData](../structs/xasyncproviderdata.md) structure used to store data for and track the asynchronous call.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
The `XAsyncProvider` callback function is implemented by an asynchronous provider to perform asynchronous work. The callback function for an asynchronous provider is called repeatedly by the XAsync API, and what that callback function should do for each call is determined by the [XAsyncOp](../enums/xasyncop.md) operation code specified in *op* for each call. Data used by the callback function for each call, including the [XAsyncBlock](../../xasync/structs/xasyncblock.md) used to track that callback function, is specified in *data*.  
  
The callback function should implement only those operation codes from `XAsyncOp` needed to perform asynchronous work. For example, an asynchronous provider that performs non-cancelable asynchronous I/O work which doesn't require cleanup only needs to implement `XAsyncOp::GetResult` in the callback function for that asynchronous provider.  
  
For an example of an asynchronous provider that implements the `DoWork`, `GetResult`, and `Cleanup` operation codes from `XAsyncOp` and returns a data payload, see the "Async Library" section in [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md#heading-7).  
  
## Requirements  
  
**Header:** XAsyncProvider.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncOp](../enums/xasyncop.md)  
[XAsyncProviderData](../structs/xasyncproviderdata.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  