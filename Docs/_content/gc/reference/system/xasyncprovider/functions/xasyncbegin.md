---
author: M-Stahl
title: XAsyncBegin
description: Initializes an [XAsyncBlock](../../xasync/structs/xasyncblock.md) and begins asynchronous work by an asynchronous provider.
kindex: XAsyncBegin
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAsyncBegin
  
Initializes an [XAsyncBlock](../../xasync/structs/xasyncblock.md) and begins asynchronous work by an asynchronous provider.  
  
## Syntax
  
```cpp
HRESULT XAsyncBegin(  
         XAsyncBlock* asyncBlock,  
         void* context,  
         const void* identity,  
         const char* identityName,  
         XAsyncProvider* provider  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that holds data for the asynchronous call.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. A context pointer to be stored in the [XAsyncProviderData](../structs/xasyncproviderdata.md) object passed to the [XAsyncProvider](xasyncprovider.md) callback function.  
  
*identity* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. A pointer to an arbitrary token that can be used to identify the asynchronous call.  
  
*identityName* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  
  
Optional. An string that names the function providing the asynchronous call. The value of this parameter is typically set to the `__FUNCTION__` compiler macro.  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: [XAsyncProvider](xasyncprovider.md)*  
  
A pointer to the [XAsyncProvider](xasyncprovider.md) callback function to invoke for the asynchronous call.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
`XAsyncBegin` is invoked to indicate that the asynchronous provider should begin asynchronous work. After `XAsyncBegin` is invoked, other [XAsyncProvider](../xasyncprovider_members.md) functions, such as [XAsyncGetResult](xasyncgetresult.md) will provide meaningful data.  
  
When `XAsyncBegin` is invoked, the callback function specified in *provider* is invoked, specifying [XAsyncOp::Begin](../enums/xasyncop.md) in the *op* parameter of [XAsyncProvider](xasyncprovider.md). If the callback function implements this operation code, it should start its asynchronous work by either calling [XAsyncSchedule](xasyncschedule.md) or through exterior means. After `XAsyncBegin` returns, it is assumed that the callback function has started asynchronous work on a system-defined thread.  
  > [!NOTE]
> The callback function specified in *provider* is processed synchronously in the `XAsyncBegin` call chain. Asynchronous work performed by the callback function must not block the thread.  
  
You can use the *identity* and *identityName* parameters to identify and manage mismatched `XAsyncOp::Begin` and `XAsyncOp::GetResult` calls to the callback function. Typically, the value of *identity* is set to the function pointer of the function that invoked `XAsyncBegin`, and the value of *identityName* is set to the `__FUNCTION__` compiler macro.  
  
## Requirements
  
**Header:** XAsyncProvider.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncProviderData](../structs/xasyncproviderdata.md)  
[XAsyncProvider](xasyncprovider.md)  
[XAsyncGetResult](xasyncgetresult.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  