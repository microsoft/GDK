---
author: M-Stahl
title: Delete(std::string&)
description: Deletes a container along with all of its blobs (files).
kindex: Wrappers.XGameSave.Provider.Delete(std::string&)
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.delete(std::string&)

Deletes a container along with all of its blobs (files).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT Delete(const std::string& containerName);
```

<a id="parametersSection"></a>

### Parameters

*containerName*&nbsp;&nbsp; \_In\_  
Type: std::string

The name of the container to delete.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

This method returns **S_OK** upon success, or an error code otherwise.

<a id="remarksSection"></a>

## Remarks

You must call the [Initialize](xgamesave_wrapper_provider_initialize.md) method before you can call any other method from the `Provider` class.

To delete a single blob from a container, use [Delete(std::string&, std::string&)](xgamesave_wrapper_provider_delete_string_string.md).

To delete one or more blobs from a container, use [Delete(std::string&, BlobNames&)](xgamesave_wrapper_provider_delete_string_blobnames.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  