---
author: M-Stahl
title: XStoreQueryConsumableBalanceRemainingResult
description: Retrieves the results of a call to [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md).
kindex: XStoreQueryConsumableBalanceRemainingResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryConsumableBalanceRemainingResult  
    
Retrieves the results of a call to [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md).  
  
## Syntax  
  
```cpp
HRESULT XStoreQueryConsumableBalanceRemainingResult(  
         XAsyncBlock* async,  
         XStoreConsumableResult* consumableResult  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*consumableResult* &nbsp;&nbsp;\_Out\_  
Type: [XStoreConsumableResult*](../structs/xstoreconsumableresult.md)  
  
On success contains the result of the call to [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md).  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md), as well as the remaining consumable balance called for if the execution was successful. As such, this function should be called after [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryConsumableBalanceRemainingAsync](xstorequeryconsumablebalanceremainingasync.md)  