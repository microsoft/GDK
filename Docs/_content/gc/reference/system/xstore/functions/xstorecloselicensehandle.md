---
author: M-Stahl
title: XStoreCloseLicenseHandle
description: Closes the specified store license handle.
kindex: XStoreCloseLicenseHandle
ms.author: shanede
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCloseLicenseHandle  

Closes the specified store license handle.  

## Syntax  
  
```cpp
void XStoreCloseLicenseHandle(  
         XStoreLicenseHandle storeLicenseHandle  
)  
```  
  
### Parameters  
  
*storeLicenseHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreLicenseHandle  
  
The handle to close.  
  
### Return value
Type: void
  
## Remarks  
  
This function is safe to call on a time-sensitive thread.
  
This function closes the **XStoreLicenseHandle** returned by [XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md). Make sure to close each **XStoreLicenseHandle** when it is no longer being used to avoid a memory leak. See [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) for a usage example.  
  
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
  
  