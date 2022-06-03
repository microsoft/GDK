---
author: aablackm
title: XtfGetTitleOSFourPartVersion
description: Gets version information about the Game OS for the currently running title.
kindex: XtfGetTitleOSFourPartVersion
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfGetTitleOSFourPartVersion
  
Gets version information about the Game OS for the currently running title.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetTitleOSFourPartVersion(
         PCWSTR address,
         UINT32* flags,
         FourPartVersion* version
)
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*flags*  
Type: UINT32\*  
  
\[out\] A bitwise-OR combination of flags that provide additional information about the Game OS. This parameter supports the following flags:
  
| Flag | Value | Description |  
| ---- | ----- | ----------- |  
| XTF_CACHED_TITLE_OS_IS_FALLBACK | 0x0001 | Indicates that this Game OS is the fallback OS, which cannot be deleted or replaced. |
  
*version*  
Type: [FourPartVersion](../structs/fourpartversion-xtfapi-xbox-windows-s.md)\*  
  
\[out\] The four-part version number of the Game OS.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to return version information about the Game OS for the currently running title. If there is no Game OS currently running, an error occurs. You can also use the [XtfGetCachedTitleOSVersions](xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md) function to return version information about other Game OS versions cached on the console. For more information about managing provisioned Game OS files, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Provision (xbprovision.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md)  
[XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  