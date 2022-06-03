---
author: M-Stahl
title: XAsyncGetResult
description: Returns the results of an asynchronous call from an asynchronous provider.
kindex: XAsyncGetResult
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
security: public
applies-to: pc-gdk
---

# XAsyncGetResult
  
Returns the results of an asynchronous call from an asynchronous provider.  
  
## Syntax
  
```cpp
HRESULT XAsyncGetResult(  
         XAsyncBlock* asyncBlock,  
         const void* identity,  
         size_t bufferSize,  
         void* buffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XAsyncBegin](xasyncbegin.md) for the asynchronous call.  
  
*identity* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. A pointer to an arbitrary token that can be used to identify the asynchronous call. If a value was specified for the *identity* parameter of the corresponding [XAsyncBegin](xasyncbegin.md) call, the same pointer must be specified here.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size, in bytes, of the result buffer specified in *buffer*.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_opt\_(bufferSize, \*bufferUsed)  
Type: void*  
  
A pointer to the result buffer.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Optional. A pointer that contains the number of bytes written to the result buffer specified in *buffer*. This value is defined as the value of the *requiredResultSize* parameter, specified by the asynchronous provider when [XAsyncComplete](xasynccomplete.md) was invoked.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
If the asynchronous call has a data payload, invoke this function to return the data payload. You don't need to invoke this function if the asynchronous call doesn't have a data payload. If this function is invoked for an asynchronous call that doesn't have a data payload, the function returns the error code `E_NOT_SUPPORTED`.  
  
If a value was specified for the *identity* parameter of the [XAsyncBegin](xasyncbegin.md) function for this asynchronous call, that same value must be provided for the *identity* parameter of this function, as well. Otherwise, a call mismatch occurs and the function returns the error code `E_INVALIDARG`.  
  
After this function is completed and results are returned in the result buffer specified in *buffer*, the [XAsyncBlock](../../xasync/structs/xasyncblock.md) specified in *asyncBlock* is completed and no longer associated with the asynchronous call.  
  
## Requirements
  
**Header:** XAsyncProvider.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncBegin](xasyncbegin.md)  
[XAsyncComplete](xasynccomplete.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  