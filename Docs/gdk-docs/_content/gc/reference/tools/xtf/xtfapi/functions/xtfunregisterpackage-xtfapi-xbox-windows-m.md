---
author: aablackm
title: XtfUnregisterPackage
description: Unregisters a package deployed to the title scratch drive.
ms.assetid: M:Windows.Xbox.xtfapi.XtfUnregisterPackage(LPCWSTR,LPCWSTR)
kindex: XtfUnregisterPackage
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfUnregisterPackage
  
Unregisters a package deployed to the title scratch drive.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfUnregisterPackage(
         LPCWSTR address,
         LPCWSTR packageFullName
)  
```
  
<a id="parametersSection"></a>
  
### Parameters  
  
*address*  
Type: LPCWSTR  
  
\[in\] The address of the console.  
  
*packageFullName*  
Type: LPCWSTR  
  
\[in\] The full name of the package to unregister.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function unregisters a package deployed to the title scratch drive, such as a package previously deployed by the [XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md) function. This function unregisters and removes all applications associated with the specified package.  
  
For more information about managing applications, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
  
[XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
  