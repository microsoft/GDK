---
author: aablackm
title: XtfGetCountofAppUserModelIds
description: Gets the count of application user model IDs from a package information object.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetCountofAppUserModelIds(XtfPackageInfo,UINT32@)
kindex: XtfGetCountofAppUserModelIds
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfGetCountofAppUserModelIds
  
Gets the count of Application User Model IDs (AUMIDs) from a package information object.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetCountofAppUserModelIds(
         XtfPackageInfo packageInfo,
         UINT32 *countOfAUMIDs
)  
```
  
<a id="parametersSection"></a>
  
### Parameters  

*packageInfo*  
Type: XtfPackageInfo  
  
\[in\] The pointer to the information object for a package.  
  
*countOfAUMIDs*  
Type: UINT32 *  
  
\[out\] The number of AUMIDs in the package.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to get the count of AUMIDs available from the information object for a registered package, prior to calling the [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md) function to get the AUMID at a specific index for that package. A pointer to a package information object is returned by calling either the [XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md) or [XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md) function to register a package.  
  
You can also use the [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md) function to retrieve the full name of a registered package. For more information about packages, see [Packaging](../../../../../packaging/gc-packaging-toc.md).  
  
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
  