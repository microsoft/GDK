---
author: M-Stahl
title: XAsyncGetResultSize
description: Returns the required size of the buffer to pass to [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md).
kindex: XAsyncGetResultSize
ms.author: mstahl
ms.topic: reference
edited: 06/19/2019
security: public
applies-to: pc-gdk
---

# XAsyncGetResultSize
  
Returns the required size of the buffer to pass to [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md).  
  
## Syntax
  
```cpp
HRESULT XAsyncGetResultSize(  
         XAsyncBlock* asyncBlock,  
         size_t* bufferSize  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../structs/xasyncblock.md) that was passed to the asynchronous call.  
  
*bufferSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The required size, in bytes, of the buffer needed to hold the results.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
If an asynchronous call returns results, call this function prior to calling [XAsyncGetResult](../../xasyncprovider/functions/xasyncgetresult.md) to specify the size of the buffer required to hold the results. Each asynchronous call that returns results must have a corresponding function that can be called to return the results from that asynchronous call.  
  
For an example of an asynchronous call with a corresponding function to return results, see [XGameSaveGetRemainingQuotaAsync](../../xgamesave/functions/xgamesavegetremainingquotaasync.md) and [XGameSaveGetRemainingQuotaResult](../../xgamesave/functions/xgamesavegetremainingquotaresult.md).  
  
## Requirements
  
**Header:** XAsync.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAsync Members](../xasync_members.md)  
[XAsyncGetStatus](xasyncgetstatus.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
  