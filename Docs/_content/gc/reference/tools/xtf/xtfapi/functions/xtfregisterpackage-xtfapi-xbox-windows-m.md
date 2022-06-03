---
author: aablackm
title: XtfRegisterPackage
description: Registers a package deployed to the title scratch drive.
ms.assetid: M:Windows.Xbox.xtfapi.XtfRegisterPackage(LPCWSTR,LPCWSTR,XtfPackageInfo@)
kindex: XtfRegisterPackage
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfRegisterPackage
  
Registers a package deployed to the title scratch drive.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfRegisterPackage(
         LPCWSTR address,
         LPCWSTR titleScratchRelativePath,
         XtfPackageInfo* packageInfo
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: LPCWSTR  
  
\[in\] The address of the console.  
  
*titleScratchRelativePath*  
Type: LPCWSTR  
  
\[in\] The relative path on the title scratch drive of the package to register.  
  
*packageInfo*  
Type: XtfPackageInfo\*
  
\[out\] Package information object about the package that was registered.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function registers a package deployed to the title scratch drive and provides package information as an `XtfPackageInfo` object reference. Use the [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md), [XtfGetCountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md), and [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md) functions to get the package full name and Application User Model IDs (AUMIDs) for the registered package from the `XtfPackageInfo` object. Use [XtfClosePackageInfo](xtfclosepackageinfo-xtfapi-xbox-windows-m.md) to free the `XtfPackageInfo` object when you are done with it.  
  
You can also use [XtfUnregisterPackage](xtfunregisterpackage-xtfapi-xbox-windows-m.md) to unregister a package. For more information about managing applications, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  