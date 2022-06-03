---
author: M-Stahl
title: XStoreGetUserPurchaseIdResult
description: Gets the result of a call to [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md).
kindex: XStoreGetUserPurchaseIdResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGetUserPurchaseIdResult  
  
Gets the result of a call to [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreGetUserPurchaseIdResult(  
         XAsyncBlock* async,  
         size_t size,  
         char* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*size* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the array passed into **result**.  
  
*result* &nbsp;&nbsp;\_Out\_writes\_z\_(size)  
Type: char*  
  
On success contains the retrieved purchase ID.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md), as well as the purchase ID that was called for if the execution was successful. As such, this function should be called after [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md) has been called, usually in the context of a callback function.  

See [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md)  
[XStoreGetUSerPurchaseIdResultSize](xstoregetuserpurchaseidresultsize.md)

  
  