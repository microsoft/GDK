---
author: M-Stahl
title: XStoreRegisterPackageLicenseLost
description: Registers a callback for the license lost event.
kindex: XStoreRegisterPackageLicenseLost
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreRegisterPackageLicenseLost  

Registers a callback for the license lost event.  This can be used to register for licenses obtained for both Durables with a package through [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) and Durables without a package (aka Durable add-ons) obtained through [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).

## Syntax  
  
```cpp
HRESULT XStoreRegisterPackageLicenseLost(  
         XStoreLicenseHandle licenseHandle,  
         XTaskQueueHandle queue,  
         void* context,  
         XStorePackageLicenseLostCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*licenseHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreLicenseHandle  
  
The license handle to register the callback for.  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  
  
Async queue to handle asynchronous work.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Title defined  context to pass to the callback.  
  
*callback* &nbsp;&nbsp;\_In\_  
Type: XStorePackageLicenseLostCallback*  
  
The callback to register.  
  
*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  
  
On success contains a token used to identify the callback.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This function registers the callback function defined by [XStorePackageLicenseLostCallback](xstorepackagelicenselostcallback.md). The registered function will be called when the next game license change event occurs. The registered function will not be called by the act of registration. Most commonly this function will fire when the user exceeds their concurrency limits for the specified package. This usually occurs when the user opens the package on an additional roaming device. In order to avoid a memory leak you must call [XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md) when you are finished with the callback function.

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
[XStorePackageLicenseLostCallback](xstorepackagelicenselostcallback.md)  
[XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md)  
  
  