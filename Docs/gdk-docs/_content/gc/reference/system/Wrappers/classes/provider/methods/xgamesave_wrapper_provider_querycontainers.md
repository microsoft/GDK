---
author: M-Stahl
title: QueryContainers
description: Returns a vector of container names that match the supplied name prefix.
kindex: Wrappers.XGameSave.Provider.QueryContainers
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.QueryContainers

Returns a vector of container names that match the supplied name prefix.

<a id="syntaxSection"></a>

## Syntax

```cpp
ContainerNames QueryContainers(const std::string& prefix);
```

<a id="parametersSection"></a>

### Parameters

*prefix*&nbsp;&nbsp; \_In\_  
Type: std::string

The prefix of the name of the containers to search for. If you specify an empty string for the prefix, then this method returns all of the container names.

<a id="retvalSection"></a>

### Return value

Type: ContainerNames

Returns a vector of container names that match the search conditions.

<a id="remarksSection"></a>

## Remarks

If you specify an empty string for the prefix, then this method returns all of the container names.

You can search for a container by specifying its name, instead of a prefix of it.

You must call the [Initialize](xgamesave_wrapper_provider_initialize.md) method before you can call any other method from the `Provider` class.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  