---
author: aablackm
title: XtfGetPackageFullName
description: Get the full package name from a package information object.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetPackageFullName(XtfPackageInfo,PWSTR@,UINT32@)
kindex: XtfGetPackageFullName
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# XtfGetPackageFullName
  
Gets the full package name from a package information object.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetPackageFullName(
         XtfPackageInfo packageInfo,
         PWSTR packageFullName,
         UINT32 *packageFullNameBufferLength
)  
```
  
<a id="parametersSection"></a>
  
### Parameters  
  
*packageInfo*  
Type: XtfPackageInfo  
  
\[in\] A pointer to the information object for a package.  
  
*packageFullName*  
Type: PWSTR  
  
\[out, optional\] The full name of the package.  
  
*packageFullNameBufferLength*  
Type: UINT32 *  
  
\[in, out\] The length, in `WCHAR`, allocated for `packageFullName`.  
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful. If `packageFullName` is not large enough, this function returns `HRESULT_FROM_WIN32(ERROR_MORE_DATA)` and the required buffer length is returned in `packageFullNameBufferLength`.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to get the full package name from the information object for a registered package. A pointer to a package information object is returned by calling either the [XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md) or [XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md) function to register a package.  
  
You can also use the [XtfGetCountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md) and [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md) functions to retrieve Application User Model IDs (AUMIDs) for a registered package. For more information about packages, see [Packaging](../../../../../packaging/gc-packaging-toc.md).  
  
The full package name is used in the platform lifetime management operations found in the [IXtfApplicationClient](../../xtfapplication/classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) interface.  
  
## Requirements  
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md)  
[XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  