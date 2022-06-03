---
author: M-Stahl
title: QueryContainerBlobs
description: Returns a vector of [BlobInfo](../../../structs/blobinfo.md) objects that identify the blobs (files) in the specified container.
kindex: Wrappers.XGameSave.Provider.QueryContainerBlobs
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.QueryContainerBlobs

Returns a vector of [BlobInfo](../../../structs/blobinfo.md) objects that identify the blobs (files) in the specified container.

<a id="syntaxSection"></a>

## Syntax

```cpp
BlobInfoSet QueryContainerBlobs(const std::string& containerName);
```

<a id="parametersSection"></a>

### Parameters

*containerName*&nbsp;&nbsp; \_In\_  
Type: std::string

The name of the container to query.

<a id="retvalSection"></a>

### Return value

Type: BlobInfoSet

Returns a [BlobInfoSet](../../../vectors/blobinfoset.md) object, which is a vector of BlobInfo objects.

<a id="remarksSection"></a>

## Remarks

Each `BlobInfo` structure contains the name and size of one blob in the container.

You must call the [Initialize](xgamesave_wrapper_provider_initialize.md) method before you can call any other method from the `Provider` class.

To return a vector of container names that match the supplied name prefix, call [QueryContainers](xgamesave_wrapper_provider_querycontainers.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  
[BlobInfo](../../../structs/blobinfo.md)  
[BlobInfoSet](../../../vectors/blobinfoset.md)  