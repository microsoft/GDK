---
author: aablackm
title: XtfClosePackageInfo
description: Frees a package information object.
ms.assetid: M:Windows.Xbox.xtfapi.XtfClosePackageInfo(XtfPackageInfo)
kindex: XtfClosePackageInfo
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfClosePackageInfo
  
Frees a package information object.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void XtfClosePackageInfo(
         XtfPackageInfo packageInfo
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*packageInfo*  
Type: XtfPackageInfo  
  
\[in\] A pointer to the information object for a package.  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to release the pointer to the information object for a registered package, returned by either the [XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md) or [XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md) function. The information object is used by the [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md), [XtfGetcountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md), and the [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md) functions to retrieve information for a package. For more information about packages, see [Packaging](../../../../../packaging/gc-packaging-toc.md).  
  > [!NOTE]
> You must call this function to release the pointer to an information object for a package. Otherwise, the information object is orphaned and the resources associated with it aren't freed, causing a memory leak.  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  