---
author: aablackm
title: GetIsGameCorePartition
description: Indicates whether the provided manifest is a Microsoft Game Development Kit (GDK) manifest.
kindex: GetIsGameCorePartition
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetIsGameCorePartition

Indicates whether the provided manifest is a Microsoft Game Development Kit (GDK) manifest.

<a id="syntaxSection"></a>

## Syntax
  
```cpp
HRESULT GetIsGameCorePartition(
         PCWSTR manifestPath,
         BOOL* pIsGameCorePartition
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*pIsGameCorePartition* &nbsp;&nbsp;\_Out\_  
Type: BOOL\*

On return, indicates whether the provided manifest is a Microsoft Game Development Kit (GDK) manifest.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

To determine whether the provided manifest is an ERA manifest, call [GetIsTitlePartition](getistitlepartition.md).

To determine the family name of the package for a specified application manifest, call [GetPackageFamilyNameFromManifest](getpackagefamilynamefrommanifest.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  