---
author: aablackm
title: XtfGetAumid
description: Gets the application model user ID at an index from a package information object.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetAumid(XtfPackageInfo,UINT32,PWSTR@,UINT32@)
kindex: XtfGetAumid
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfGetAumid

Gets the Application User Model ID (AUMID) at the specified index from a package information object.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetAumid(
         XtfPackageInfo packageInfo,
         UINT32 aumidIndex,
         PWSTR aumid,
         UINT32 *aumidBufferLength
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*packageInfo*  
Type: XtfPackageInfo  
  
\[in\] The pointer to the information object for a package.  
  
*aumidIndex*  
Type: UINT32  
  
\[in\] Index of the AUMID in the package.  
  
*aumid*  
Type: PWSTR  
  
\[out, optional\] The AUMID at the index specified in `aumidIndex` for the package.  
  
*aumidBufferLength*  
Type: UINT32 *  
  
\[in, out\] The length, in **WCHAR**, allocated for `aumid`.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful. If `aumid` is not large enough, this function returns `HRESULT_FROM_WIN32(ERROR_MORE_DATA)` and the required buffer length is returned in `aumidBufferLength`.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to get the AUMID at the index specified in `aumidIndex` from the information object for a registered package. A pointer to a package information object is returned by calling either the [XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md) or [XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md) function to register a package.  
  
Before calling this function, use the [XtfGetcountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md) function to get the count of AUMIDs for the package. If you specify a value in `aumidIndex` that's equal to or greater than the value returned by `XtfGetcountofAppUserModelIds`, an error occurs. Similarly, an error occurs if there's no data to retrieve at the index specified in `aumidIndex`.  
  
You can also use the [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md) function to retrieve the full name of a registered package. For more information about packages, see [Packaging](../../../../../packaging/gc-packaging-toc.md).  
  
<a id="requirements"></a>
  
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
  