---
author: aablackm
title: XtfRegisterAllPackagesOnDrive
description: Register all packages deployed on the specified drive.
kindex: XtfRegisterAllPackagesOnDrive
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfRegisterAllPackagesOnDrive
  
Register all packages deployed on the specified drive.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfRegisterAllPackagesOnDrive(
         LPCWSTR address,
         DWORD drive,
         LPBSTR pbstrPackageList
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: LPCWSTR  
  
\[in\] The address of the console.  
  
*drive*  
Type: DWORD  
  
\[in\] The drive to register the packages on. This parameter accepts the following values:
  
| Value | Description |
| ----- | ----------- |
| 0 | Retail drive |  
| 1 | Development drive |  
| 2 - 8 | External drive 1 through external drive 7 |  
  
*pbstrPackageList*  
Type: LPBSTR  
  
\[out\] Information about the packages and apps that were registered.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function registers all packages deployed on the specified drive, such as an external drive, and provides a stringified JSON object in *pbstrPackageList*. The JSON object is an array that provides the package full name and the apps, including the Application User Model IDs (AUMIDs), for each registered package.  
  
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
  