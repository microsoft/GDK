---
author: M-Stahl
title: XStoreGetUserPurchaseIdResultSize
description: Gets the size of the result returned by [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md).
kindex: XStoreGetUserPurchaseIdResultSize
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGetUserPurchaseIdResultSize  
  
Gets the size of the result returned by [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md).  

## Syntax  
  
```cpp
HRESULT XStoreGetUserPurchaseIdResultSize(  
         XAsyncBlock* async,  
         size_t* size  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
*size* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
On success returns the size of the result that will be returned by [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md).    
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the size of the purchase ID when [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md) was called. As such, this function should be called after [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md) has been called, usually in the context of a callback function. See [XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreGetUserPurchaseIdAsync](xstoregetuserpurchaseidasync.md)  
[XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md)  