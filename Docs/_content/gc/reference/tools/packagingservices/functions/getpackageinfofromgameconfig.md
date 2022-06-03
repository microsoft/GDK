---
author: aablackm
title: GetPackageInfoFromGameConfig
description: Returns the full name and the family name of the package for the specified game configuration file.
kindex: GetPackageInfoFromGameConfig
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetPackageInfoFromGameConfig

Returns the full name and the family name of the package for the specified game configuration file.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT GetPackageInfoFromGameConfig(
         PCWSTR gameConfigPath,
         WCHAR** packageFullName,
         WCHAR** packageFamilyName,
         WCHAR** pParsingError
)
```

<a id="parametersSection"></a>

### Parameters

*gameConfigPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the *MicrosoftGame.config* file.

*packageFullName* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

On return, contains the full name of the package.

*packageFamilyName* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

On return, contains the family name of the package.

*pParsingError* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

In a failure case, contains more information about why the parsing failed.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

The caller must free the returned strings by using `CoTaskMemFree`.

To get the full name of the package for a specified application manifest, call [GetPackageFullNameFromManifest](getpackagefullnamefrommanifest.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  