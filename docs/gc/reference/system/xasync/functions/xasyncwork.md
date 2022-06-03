---
author: M-Stahl
title: XAsyncWork
description: Represents the callback function invoked by [XAsyncRun](xasyncrun.md).
kindex: XAsyncWork
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
security: public
applies-to: pc-gdk
---

# XAsyncWork
  
Represents the callback function invoked by [XAsyncRun](xasyncrun.md).  
  
## Syntax
  
```cpp
HRESULT XAsyncWork(  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to a copy of the [XAsyncBlock](../structs/xasyncblock.md) that was passed to [XAsyncRun](xasyncrun.md).  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
A pointer to a copy of the [XAsyncBlock](../structs/xasyncblock.md) that was passed to [XAsyncRun](xasyncrun.md) is used to allow the system to ensure that the pointer always exists and is valid for the callback.  
  
When using the [XAsyncRun](xasyncrun.md) helper function to asynchronously run a callback function, you specify an `XAsyncWork` pointer for the callback function to be invoked. `XAsyncRun` then uses [XAsyncProvider](../../xasyncprovider/xasyncprovider_members.md) functionality to run the callback function.  
  
For more information about `XAsyncProvider` functionality, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md).  
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncRun](xasyncrun.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  