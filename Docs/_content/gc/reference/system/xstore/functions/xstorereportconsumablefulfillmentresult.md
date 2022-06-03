---
author: M-Stahl
title: XStoreReportConsumableFulfillmentResult
description: Gets the results of a call to [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md).
kindex: XStoreReportConsumableFulfillmentResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreReportConsumableFulfillmentResult  

Gets the results of a call to [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md).  For more information see [Consumable-based ecosystems](../../../../commerce/fundamentals/xstore-consumable-based-ecosystems.md) for more information on implementing and using consumable products.

## Syntax  
  
```cpp
HRESULT XStoreReportConsumableFulfillmentResult(  
         XAsyncBlock* async,  
         XStoreConsumableResult* consumableResult  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*consumableResult* &nbsp;&nbsp;\_Out\_  
Type: [XStoreConsumableResult*](../structs/xstoreconsumableresult.md)  
  
On success contains a structure indicating the current quantity of the consumable.   
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md). As such, this function should be called after [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md) for a usage example.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreReportConsumableFulfillmentAsync](xstorereportconsumablefulfillmentasync.md)  
  