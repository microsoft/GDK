---
author: M-Stahl
title: XAsyncProviderData
description: Represents data passed to the callback function of an asynchronous provider.
kindex: XAsyncProviderData
ms.author: mstahl
ms.topic: reference
edited: 03/04/2020
security: public
applies-to: pc-gdk
---

# AsyncProviderData
  
Represents data passed to the callback function of an asynchronous provider.  
  
## Syntax
  
```cpp
typedef struct XAsyncProviderData {  
    XAsyncBlock* async;  
    size_t bufferSize;  
    void* buffer;  
    void* context;  
} XAsyncProviderData  
```
  
### Members
  
*async*  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that holds data for the asynchronous call.  
  
*bufferSize*  
Type: size_t  
  
The size, in bytes, of the result buffer specified in *buffer*. This value is valid only when the callback function is called with an [XAsyncOp::GetResult](../enums/xasyncop.md) operation code, and the value will be equal to or greater than the value specified for the *requiredBufferSize* parameter of the corresponding [XAsyncComplete](../functions/xasynccomplete.md) function call.  
  
*buffer*  
Type: void*  
  
A pointer to the result buffer for the callback function. This value is valid only when the callback function is called with an [XAsyncOp::GetResult](../enums/xasyncop.md) operation code.  
  
*context*  
Type: void*  
  
A context pointer passed to the callback function when [XAsyncBegin](../functions/xasyncbegin.md) was called.  
  
## Remarks
  
This structure represents data passed to the callback function for an asynchronous provider. The data in this structure can change each time the callback function is called. The callback function is repeatedly called to perform asynchronous work determined by the [XAsyncOp](../enums/xasyncop.md) operation code specified for each call, and the data in this structure can also change with each call. The values for *buffer* and *bufferSize* are valid only when the callback function is called with the `XAsyncOp::GetResult` operation code. The value for *context* is valid when the callback function is called with any operation code, but should be freed only when the callback function is called with the `XAsyncOp::Cleanup` operation code.  
  
For an example of a callback function that interacts with `XAsyncProviderData` when performing asynchronous work for the `GetResult`, and `Cleanup` operation codes from `XAsyncOp`, see the "Async Library" section in [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md#heading-7).  
  
## Requirements
  
**Header:** XAsyncProvider.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncComplete](../functions/xasynccomplete.md)  
[XAsyncBegin](../functions/xasyncbegin.md)  
[XAsyncOp](../enums/xasyncop.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  