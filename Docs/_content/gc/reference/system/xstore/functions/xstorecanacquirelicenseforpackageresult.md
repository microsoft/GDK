---
author: M-Stahl
title: XStoreCanAcquireLicenseForPackageResult
description: Gets the results for a call to [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md).
kindex: XStoreCanAcquireLicenseForPackageResult
ms.author: shanede
ms.topic: reference
edited: 7/12/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanAcquireLicenseForPackageResult  
  
Gets the results for a call to [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md).  
  
## Syntax  
  
```cpp
HRESULT XStoreCanAcquireLicenseForPackageResult(  
         XAsyncBlock* async,  
         XStoreCanAcquireLicenseResult* storeCanAcquireLicense  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md).
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.
  
*storeCanAcquireLicense* &nbsp;&nbsp;\_Out\_  
Type: [XStoreCanAcquireLicenseResult*](../structs/xstorecanacquirelicenseresult.md)  
  
Structure indicating if a license can be acquired and what SKU the user would be able to license.
  
### Return value
Type: HRESULT
  
HRESULT success or error code.

## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md), as well as the preview license that was called for if the execution was successful.
As such, this function should be called after [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md) has been called, usually in the context of a callback function.
See [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md)
