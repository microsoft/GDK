---
author: M-Stahl
title: XStoreShowRedeemTokenUIResult
description: Gets the results of a call to [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md).
kindex: XStoreShowRedeemTokenUIResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowRedeemTokenUIResult  

Gets the results of a call to [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreShowRedeemTokenUIResult(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  

E_ABORT indicates that the user canceled the purchase flow.  

## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md). As such, this function should be called after [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md) has been called, usually in the context of a callback function. This function can be particularly useful in figuring out why UI wasn't shown in cases of failure.  
  
See [XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreShowRedeemTokenUIAsync](xstoreshowredeemtokenuiasync.md)  
  