---
author: aablackm
title: ValidateSchemaForManifest
description: Parses a manifest and validates the schema.
kindex: ValidateSchemaForManifest
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# ValidateSchemaForManifest

Parses a manifest and validates the schema.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT ValidateSchemaForManifest(
         PCWSTR manifestPath,
         WCHAR** pParsingError
)
```

<a id="parametersSection"></a>

### Parameters

*manifestPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the manifest.

*pParsingError* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*

On return, contains descriptions of any parsing errors.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

To determine whether the manifest is a Microsoft Game Development Kit (GDK) manifest, call [GetIsGameCorePartition](getisgamecorepartition.md).

To validate the schema of a game configuration file, call [PackagingValidateGameConfig](packagingvalidategameconfig.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  