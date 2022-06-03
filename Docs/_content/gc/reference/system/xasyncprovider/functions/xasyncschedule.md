---
author: M-Stahl
title: XAsyncSchedule
description: Schedules work for the callback function of an asynchronous provider.
kindex: XAsyncSchedule
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAsyncSchedule
  
Schedules work for the callback function of an asynchronous provider.  
  
## Syntax
  
```cpp
HRESULT XAsyncSchedule(  
         XAsyncBlock* asyncBlock,  
         uint32_t delayInMs  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XAsyncBegin](xasyncbegin.md) for the asynchronous call.  
  
*delayInMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
How long the system should wait, in milliseconds, before scheduling the asynchronous call with the asynchronous queue.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
This function is optional, and provides more control over scheduling asynchronous work for an asynchronous provider. If the asynchronous work can be done through a system-managed asynchronous mechanism, such as [overlapped I/O](/windows/win32/api/minwinbase/ns-minwinbase-overlapped?redirectedfrom=MSDN), you don't need to call this function.  
  
If asynchronous work should be scheduled after a delay, specify in *delayInMs* the number of milliseconds that [XAsyncSchedule](xasyncschedule.md) should wait before it schedules asynchronous work.  
  
For an example of an asynchronous provider that uses `XAsyncSchedule` to schedule asynchronous work, see the "Async Library" section in [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md#heading-7).  
  
## Requirements  
  
**Header:** XAsyncProvider.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsyncProvider Members](../xasyncprovider_members.md)  
[XAsyncBegin](xasyncbegin.md)  
[XAsyncSchedule](xasyncschedule.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  