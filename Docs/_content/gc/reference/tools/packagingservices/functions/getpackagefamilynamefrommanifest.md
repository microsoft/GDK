---
author: aablackm
title: GetPackageFamilyNameFromManifest
description: Returns the family name of the package for the specified application manifest.
kindex: GetPackageFamilyNameFromManifest
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetPackageFamilyNameFromManifest

Returns the family name of the package for the specified application manifest.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT GetPackageFamilyNameFromManifest(
         PCWSTR manifestPath,
         WCHAR** packageFamilyName
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*packageFamilyName* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

On return, contains the package family name.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

The caller must free the returned string by using `CoTaskMemFree`.

To determine the full name of a package by specifying the package name, the package version, the package architecture, the package resource ID, and the package publisher, call [GetPackageFullNameFromInfo](getpackagefullnamefrominfo.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  