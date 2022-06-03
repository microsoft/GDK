---
author: M-Stahl
title: XAsyncGetStatus
description: Returns the status of the asynchronous call, optionally waiting for it to complete.
kindex: XAsyncGetStatus
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAsyncGetStatus
  
Returns the status of the asynchronous call, optionally waiting for it to complete.  
  
## Syntax
  
```cpp
HRESULT XAsyncGetStatus(  
         XAsyncBlock* asyncBlock,  
         bool wait  
)  
```  
  
### Parameters
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../structs/xasyncblock.md) that was passed to the asynchronous call.  
  
*wait* &nbsp;&nbsp;\_In\_  
Type: bool  
  
If true, `XAsyncGetStatus` waits until the asynchronous call either completes or is canceled.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
Once the asynchronous call is complete, you can then call [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md) to get the results if the asynchronous call has a resulting data payload. If the asynchronous call doesn't have a resulting data payload, you don't have to call [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md).  
  
**Note:** Both a completion callback and `XAsyncGetStatus` with a wait parameter of true can be used to identify when a call has finished. The ordering of these calls can be ambiguous and as a best practice you should not use both for the same call.
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  