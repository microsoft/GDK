---
author: M-Stahl
title: XStoreAcquireLicenseForPackageResult
description: Retrieves the results of a call to [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md).
kindex: XStoreAcquireLicenseForPackageResult
ms.author: shanede
ms.topic: reference
edited: 07/21/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreAcquireLicenseForPackageResult


Retrieves the results of a call to [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreAcquireLicenseForPackageResult(  
         XAsyncBlock* async,  
         XStoreLicenseHandle* storeLicenseHandle  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

The XAsyncBlock passed to [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md).
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  

*storeLicenseHandle* &nbsp;&nbsp;\_Out\_  
Type: XStoreLicenseHandle*  

On success contains the handle to the store license.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  

This function is safe to call on a time-sensitive thread.

This result function allows you to retrieve the execution results of [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md), as well as the license that was called for if the execution was successful.
As such, this function should be called after [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) has been called, usually in the context of a callback function.
See [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XStore](../xstore_members.md)  
[XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md)  
[XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md)  
[XStoreIsLicenseValid](xstoreislicensevalid.md)  
[XStoreCloseLicenseHandle](xstorecloselicensehandle.md)  
[XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md)  
[XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md)