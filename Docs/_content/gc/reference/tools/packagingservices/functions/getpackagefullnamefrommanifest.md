---
author: aablackm
title: GetPackageFullNameFromManifest
description: Returns the full name of the package for the specified application manifest.
kindex: GetPackageFullNameFromManifest
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetPackageFullNameFromManifest

Returns the full name of the package for the specified application manifest.

<a id="syntaxSection"></a>

## Syntax
  
```cpp
HRESULT GetPackageFullNameFromManifest(
         PCWSTR manifestPath,
         WCHAR** packageFullName
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*packageFullName* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

On return, contains the full name of the package.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

The caller must free the returned string by using `CoTaskMemFree`.

To get the full name and the family name of the package for the specified game configuration, call [GetPackageInfoFromGameConfig](getpackageinfofromgameconfig.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  