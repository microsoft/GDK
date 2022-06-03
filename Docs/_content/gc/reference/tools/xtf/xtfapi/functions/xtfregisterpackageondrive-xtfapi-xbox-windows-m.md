---
author: aablackm
title: XtfRegisterPackageOnDrive
description: Registers a package deployed on the specified drive.
kindex: XtfRegisterPackageOnDrive
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfRegisterPackageOnDrive
  
Registers a package deployed on the specified drive.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfRegisterPackageOnDrive(
         LPCWSTR address,
         PCWSTR packageFullName,
         DWORD drive,
         XtfPackageInfo* packageInfo
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: LPCWSTR  
  
\[in\] The address of the console.  
  
*packageFullName*  
Type: PCWSTR  
  
\[in\] The package full name of the package to register.  
  
*drive*  
Type: DWORD  
  
\[in\] The drive to register the package on. This parameter accepts the following values:
  
| Value | Description |
| ----- | ----------- |
| 0 | Retail drive |  
| 1 | Development drive |  
| 2 - 8 | External drive 1 through external drive 7 |  
  
*packageInfo*  
Type: XtfPackageInfo\*  
  
\[out\] Package information object about the package that was registered.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function registers a package deployed to a specified drive, such as an external drive, and provides package information as an `XtfPackageInfo` object reference. Use the [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md), [XtfGetCountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md), and [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md) functions to get the package full name and Application User Model IDs (AUMIDs) for the registered package from the `XtfPackageInfo` object. Use [XtfClosePackageInfo](xtfclosepackageinfo-xtfapi-xbox-windows-m.md) to free the `XtfPackageInfo` object when you are done with it.  
  
For more information about managing applications, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  