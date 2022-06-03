---
author: M-Stahl
title: Initialize
description: Intializes the save game wrapper, and synchronizes all of the containers for the specified user.
kindex: Wrappers.XGameSave.Provider.Initialize
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.Initialize

Intializes the save game wrapper, and synchronizes all of the containers for the specified user.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT Initialize(XUserHandle userHandle,
                   const std::string& serviceConfigurationId);
```

<a id="parametersSection"></a>

### Parameters

*userHandle*&nbsp;&nbsp; \_In\_  
Type: XUserHandle

A handle to the Xbox Live User account.

*serviceConfigurationId*&nbsp;&nbsp;\_In\_  
Type: std::string

The game's Service Configuration ID (SCID).

<a id="retvalSection"></a>

### Return value

Type: HRESULT

This method returns **S_OK** upon success, and the following HRESULT codes upon failure:

- **E_GS_USER_CANCELED**
- **E_GS_USER_NOT_REGISTERED_IN_SERVICE**
- **E_GS_NO_ACCESS**
- **E_GS_NO_SERVICE_CONFIGURATION**

<a id="remarksSection"></a>

## Remarks

You must call this method before you can call any other method from the `Provider` class.

You shouldn't call this method on the game's UI thread because it can block, and then potentially show UI to the user as it synchronizes their game saves.

To load the data from the given blob, from the specified container, call [Load](xgamesave_wrapper_provider_load.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  