---
author: M-Stahl
title: XAsyncRun
description: Asynchronously runs the specified callback function.
kindex: XAsyncRun
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
security: public
applies-to: pc-gdk
---

# XAsyncRun
  
Asynchronously runs the specified callback function.  
  
## Syntax
  
```cpp
HRESULT XAsyncRun(  
         XAsyncBlock* asyncBlock,  
         XAsyncWork* work  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../structs/xasyncblock.md) that is used to track the asynchronous call.  
  
*work* &nbsp;&nbsp;\_In\_  
Type: [XAsyncWork*](xasyncwork.md)  
  
A pointer to a callback function to run asynchronously.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
`XAsyncRun` is a helper function that asynchronously runs the callback function specified in *work*. You can use the `XAsyncBlock` specified in *asyncBlock* to cancel or get the status of the callback function. `XAsyncRun` internally uses the following `XAsyncProvider` functions to run and track the callback function:  
  
* [XAsyncBegin](../../xasyncprovider/functions/xasyncbegin.md)  
* [XAsyncComplete](../../xasyncprovider/functions/xasynccomplete.md)  
* [XAsyncSchedule](../../xasyncprovider/functions/xasyncschedule.md)  
  
For more information about implementing your own asynchronous functionality with `XAsyncProvider` and `XAsyncBlock`, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md).  
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncProvider Members](../../xasyncprovider/xasyncprovider_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  