---
author: aablackm
title: PackagingValidateGameConfig
description: Validates the schema of a game configuration file.
kindex: PackagingValidateGameConfig
ms.author: scotmi
ms.topic: reference
edited: 03/29/2021
security: public
---

# PackagingValidateGameConfig

Validates the schema of a game configuration file.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT PackagingValidateGameConfig(
         PCWSTR gameConfigPath,
         WCHAR** pValidationWarnings
)
```

<a id="parametersSection"></a>

### Parameters

*gameConfigPath* &nbsp;&nbsp;\_In\_  
Type: PCWSTR

The path to the *MicrosoftGame.config* file.

*pValidationWarnings* &nbsp;&nbsp;\_Out\_  
Type: WCHAR\*\*
  
On return, contains any warnings for the parts of the configuration file that were validated.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` if successful. Otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

Validation includes verifying the following conditions.

- No more than one non-developer executable is listed.
- All specified executable files are present.

To validate the schema of a manifest, call [ValidateSchemaForManifest](validateschemaformanifest.md).

For more information about packaging, see [Overview of packaging](../../../../packaging/overviews/packaging.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** packagingservices.h

**Library:** packagingservices.lib

**Supported platforms:** Windows (for Xbox console tools)

<a id="seealsoSection"></a>

## See also

[PackagingServices](../packagingservices_members.md)  