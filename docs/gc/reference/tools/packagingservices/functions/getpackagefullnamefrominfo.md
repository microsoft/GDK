---
author: aablackm
title: GetPackageFullNameFromInfo
description: Returns the full name of the package that matches the specified information.
kindex: GetPackageFullNameFromInfo
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetPackageFullNameFromInfo

Returns the full name of the package that matches the specified information.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT GetPackageFullNameFromInfo(
         PCWSTR packageName,
         PCWSTR packageVersion,
         PCWSTR packageArchitecture,
         PCWSTR packageResourceId,
         PCWSTR packagePublisher,
         WCHAR** packageFullName
)
```

<a id="parametersSection"></a>

### Parameters

*packageName* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The package name.

*packageVersion* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The package version.

*packageArchitecture* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The package architecture.

*packageResourceId* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The package resource ID.

*packagePublisher* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The package publisher.

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

To get the family name of the package for a specified application manifest, call [GetPackageFamilyNameFromManifest](getpackagefamilynamefrommanifest.md)

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  