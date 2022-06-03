---
author: M-Stahl
title: Class contents
description: The primary management class for the **XGameSave** wrapper.
kindex: Provider, Game Save
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider

The primary management class for the **XGameSave** wrapper.

<a id="syntaxSection"></a>

## Syntax

```cpp
class Provider
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Initialize](methods/xgamesave_wrapper_provider_initialize.md) | Intializes the save game wrapper, and synchronizes all of the containers for the specified user. |  
| [QueryContainers](methods/xgamesave_wrapper_provider_querycontainers.md) | Returns a vector of container names that match the supplied name prefix. |  
| [QueryContainerBlobs](methods/xgamesave_wrapper_provider_querycontainerblobs.md) | Returns a vector of [BlobInfo](../../structs/blobinfo.md) objects that identify the blobs (files) in the specified container. |  
| [Load](methods/xgamesave_wrapper_provider_load.md) | Loads the data from the given blob (file), from within the specified container. |  
| [Save](methods/xgamesave_wrapper_provider_save.md) | Saves data to the specified blob (file) within the specified container. |  
| [GetQuota](methods/xgamesave_wrapper_provider_getquota.md) | Returns the amount of data available to store using the save game wrapper. |  
| [Delete(std::string&)](methods/xgamesave_wrapper_provider_delete_string.md) | Deletes a container along with all of its blobs (files). |  
| [Delete(std::string&, std::string&)](methods/xgamesave_wrapper_provider_delete_string_string.md) | Deletes the specified blobs (files) from the specified container. |  
| [Delete(std::string&, BlobNames&)](methods/xgamesave_wrapper_provider_delete_string_blobnames.md) | Deletes one or more blobs (files) from the specified container. |  


<a id="remarksSection"></a>

## Remarks

The **XGameSave** simplified wrapper is a set of API's that enable reading and writing data on behalf of a user, to be persisted across game sessions, and to seemlessly sync with the cloud across multiple devices. The wrapper APIs fall into three catagories:

**Providers**

`gs_provider_t` is the handle that binds a user context to a game save. It's required for API interactions. Each provider can contain multiple containers, and each provider has a default quota of 256 MB. Provider operations include:

* Quota information
* Container management
* Provider Metadata (Service Configuration ID, UserContext)

**Containers**

You can use containers to logically correlate data into a group that can be written to, updated, and read from atomically. Container operations include:

* Queries on container info, and container status
* Queries on container contents
* Atomic updates to container data

**Binary large objects (blobs)**

Blobs contain the data contained within a container. The maximum amount of data that a blob can contain is 16 MB.

* Blob update and delete operations are designed to be atomic, so that a set of changes can be committed in one operation. If any portion fails, then the entire update fails.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  
[Observer Design Pattern](/dotnet/standard/events/observer-design-pattern)  