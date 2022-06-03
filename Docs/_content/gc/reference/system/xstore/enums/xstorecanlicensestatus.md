---
author: M-Stahl
title: XStoreCanLicenseStatus
description: Indicates if a user would be able to license a package.
kindex: XStoreCanLicenseStatus
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanLicenseStatus  

Indicates if a user would be able to license a package.  

## Syntax  
  
```cpp
enum class XStoreCanLicenseStatus  : uint32_t  
{  
    NotLicensableToUser = 0,  
    Licensable = 1,  
    LicenseActionNotApplicableToProduct = 2,
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NotLicensableToUser | The package is not licensable to the user. |  
| Licensable | The package is licensable to the user. |  
| LicenseActionNotApplicableToProduct | The product is not individually licensable. |
  
  
## Remarks

This enum denotes whether or not a package can be licensed as a result of a call to [XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md) or [XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md). The licensable status can be found as a result of their respective return functions.  **XStoreCanLicenseStatus** is a member of the [XStoreCanAcquireLicenseResult](../structs/xstorecanacquirelicenseresult.md) struct.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreCanAcquireLicenseResult](../structs/xstorecanacquirelicenseresult.md)  
[XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md)  
[XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md)  