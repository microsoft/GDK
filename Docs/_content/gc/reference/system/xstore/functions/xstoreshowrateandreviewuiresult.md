---
author: M-Stahl
title: XStoreShowRateAndReviewUIResult
description: Gets the result of a call to [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md).
kindex: XStoreShowRateAndReviewUIResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowRateAndReviewUIResult  

Gets the result of a call to [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreShowRateAndReviewUIResult(  
         XAsyncBlock* async,  
         XStoreRateAndReviewResult* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*result* &nbsp;&nbsp;\_Out\_  
Type: [XStoreRateAndReviewResult*](../structs/xstorerateandreviewresult.md)  
  
On success contains the result of the call to [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md).  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md). As such, this function should be called after [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md) has been called, usually in the context of a callback function. This function can be particularly useful in figuring out why UI wasn't shown in cases of failure.  

See [XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreShowRateAndReviewUIAsync](xstoreshowrateandreviewuiasync.md)  
  