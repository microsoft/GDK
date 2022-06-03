---
author: M-Stahl
title: XStoreShowPurchaseUIResult
description: Gets the results of a call to [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md).
kindex: XStoreShowPurchaseUIResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowPurchaseUIResult  

Gets the results of a call to [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreShowPurchaseUIResult(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  

S_OK indicates that the purchase was completed, but you should always refresh the user's licenses and collections data before granting access to the content

E_ABORT indicates that the user canceled the purchase flow.
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md). As such, this function should be called after [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md) has been called, usually in the context of a callback function. This function can be particularly useful in figuring out why UI wasn't shown in cases of failure.  
  
See [XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreShowPurchaseUIAsync](xstoreshowpurchaseuiasync.md)  
  