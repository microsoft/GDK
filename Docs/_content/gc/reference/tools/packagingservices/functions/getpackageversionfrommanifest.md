---
author: aablackm
title: GetPackageVersionFromManifest
description: Returns the version of the package for the specified application manifest.
kindex: GetPackageVersionFromManifest
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetPackageVersionFromManifest

Returns the version of the package for the specified application manifest.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT GetPackageVersionFromManifest(
         PCWSTR manifestPath,
         UINT64* packageVersion
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*packageVersion* &nbsp;&nbsp;\_Out\_  
Type: UINT64\*
  
On return, contains the version of the package.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

To determine whether the manifest is a Microsoft Game Development Kit (GDK) manifest, call [GetIsGameCorePartition](getisgamecorepartition.md).

To parse the manifest and validate the schema, call [ValidateSchemaForManifest](validateschemaformanifest.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  