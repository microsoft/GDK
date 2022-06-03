---
author: aablackm
title: GetIsTitlePartition
description: Indicates whether the specified manifest is an ERA manifest.
kindex: GetIsTitlePartition
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# GetIsTitlePartition

Indicates whether the specified manifest is an ERA manifest.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT GetIsTitlePartition(
         PCWSTR manifestPath,
         BOOL* pIsTitlePartition
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*pIsTitlePartition* &nbsp;&nbsp;\_Out\_  
Type: BOOL\*

On return, indicates whether the specified manifest is an ERA manifest.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

To determine whether the specified manifest is a Microsoft Game Development Kit (GDK) manifest, call [GetIsGameCorePartition](getisgamecorepartition.md).

To determine the family name of a package for a specified application manifest, call [GetPackageFamilyNameFromManifest](getpackagefamilynamefrommanifest.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  