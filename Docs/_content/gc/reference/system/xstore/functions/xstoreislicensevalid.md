---
author: M-Stahl
title: XStoreIsLicenseValid
description: Checks if the specified license is valid.
kindex: XStoreIsLicenseValid
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreIsLicenseValid  

Checks if the specified license is valid.  

## Syntax  
  
```cpp
bool XStoreIsLicenseValid(  
         const XStoreLicenseHandle storeLicenseHandle  
)  
```  
  
### Parameters  
  
*storeLicenseHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreLicenseHandle  
  
A handle to the license.  
  
  
### Return value
Type: bool
  
Returns true if the license is valid; returns false otherwise.  
  
## Remarks  

This API is safe to call on time-sensitive threads.

See [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) for a usage example. **XStoreIsLicenseValid** is used to determine if a valid license was returned by [XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md). If the license is proven to be valid you may proceed with further setup, like registering license activity based callback functions.  
> [!NOTE]
> This only checks the static license state when it was originally obtained from the XStoreAcquireLicense* APIs.  If you register with [XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md) and the license becomes invalid, you will need to re-acquire a new license to get the correct state before calling this API again.  
  
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

  
  