---
author: M-Stahl
title: XAsyncComplete
description: Indicates that the callback function an asynchronous provider has completed work and the results can be returned.
kindex: XAsyncComplete
ms.author: mstahl
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XAsyncComplete
  
Indicates that the callback function for an asynchronous provider has completed work and the results can be returned.  
  
## Syntax
  
```cpp
void XAsyncComplete(  
         XAsyncBlock* asyncBlock,  
         HRESULT result,  
         size_t requiredBufferSize  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XAsyncBegin](xasyncbegin.md).  
  
*result* &nbsp;&nbsp;\_In\_  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
The result of the work performed by the callback function. If the work is canceled, set this to `E_ABORT`. If more work needs to be done, set this to `E_PENDING`. Otherwise, set this to the appropriate result code.  
  
*requiredBufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The required size, in bytes, of the data payload to be returned by the callback function. If the callback function doesn't return a data payload, set this value to zero. This parameter is ignored if the callback function returns an error.  
  
### Return value
  
Type: void  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function is called when the callback function has been called to either perform or cancel asynchronous work. The function returns an appropriate result code and, if applicable, information about the data payload. The combination of [XAsyncOp](../enums/xasyncop.md) operation code, asynchronous work, and data payload for the callback function typically determines the values that should be provided for *result* and *requiredBufferSize* when calling this function.  
  
If the callback function has been called with the `XAsyncOp::DoWork` operation code, the callback function should perform asynchronous work. If the callback function has completed all asynchronous work, set *result* to an appropriate error code. If more work needs to be done, set *result* to `E_PENDING`. If the function returns a data payload, set *requiredBufferSize* to the size, in bytes, of the buffer needed to return the data payload; otherwise, set *requiredBufferSize* to zero.  
  
If the callback function has been called with the `XAsyncOp::Cancel` operation code, the callback function should cancel asynchronous work. Set *result* to `E_ABORT` and *requiredBufferSize* to zero.  
  
## Requirements
  
**Header:** XAsyncProvider.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncBegin](xasyncbegin.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  