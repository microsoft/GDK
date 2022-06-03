---
author: M-Stahl
title: XStoreCanAcquireLicenseResult
description: Gets the result of a call to [XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md) or [XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md).
kindex: XStoreCanAcquireLicenseResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanAcquireLicenseResult  

Gets the result of a call to [XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md) or [XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md).  

## Syntax  
  
```cpp
typedef struct XStoreCanAcquireLicenseResult {  
    char licensableSku[SKU_ID_SIZE];  
    XStoreCanLicenseStatus status;  
} XStoreCanAcquireLicenseResult  
```
  
### Members  
  
*licensableSku*  
Type: char[SKU_ID_SIZE]  
  
The SKU the user would be able to license.  
  
*status*  
Type: [XStoreCanLicenseStatus](../enums/xstorecanlicensestatus.md)  
  
Indicates if a user would be able to license a package.  
  
## Remarks
  
While this struct contains the results of [XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md) or [XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md) the struct is actually populated in their results functions which are [XStoreCanAcquireLicenseForPackageResult](../functions/xstorecanacquirelicenseforpackageresult.md) and [XStoreCanAcquireLicenseForStoreIdResult](../functions/xstorecanacquirelicenseforstoreidresult.md) respectively. **XStoreCanAcquireLicenseResult** is retrieved from [XStoreCanAcquireLicenseForPackageResult](../functions/xstorecanacquirelicenseforpackageresult.md). **XStoreCanAcquireLicenseResult** is retrieved from [XStoreCanAcquireLicenseForStoreIdResult](../functions/xstorecanacquirelicenseforstoreidresult.md).
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreCanAcquireLicenseForStoreIdAsync](../functions/xstorecanacquirelicenseforstoreidasync.md)  
[XStoreCanAcquireLicenseForPackageAsync](../functions/xstorecanacquirelicenseforpackageasync.md)  
[XStoreCanAcquireLicenseForPackageResult](../functions/xstorecanacquirelicenseforpackageresult.md)  
[XStoreCanAcquireLicenseForStoreIdResult](../functions/xstorecanacquirelicenseforstoreidresult.md)  
  