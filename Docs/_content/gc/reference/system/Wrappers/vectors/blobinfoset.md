---
author: M-Stahl
title: BlobInfoSet
description: Vector of BlobInfo structures describing what blobs (files) are contained within a given container.
kindex: BlobInfoSet
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# Microsoft.Xbox.Wrappers.XGameSave.BlobInfoSet  

Vector of [BlobInfo](../structs/blobinfo.md) structures describing what blobs (files) are contained within a given container.

## Syntax  
  
```cpp
typedef std::vector<BlobInfo> BlobInfoSet;
```

  
## Requirements  
  
**Header:** xgamesavewrappers.hpp
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
[Game Saves Simplified Wrapper](../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  
[Provider::QueryContainerBlobs](../classes/provider/methods/xgamesave_wrapper_provider_querycontainerblobs.md)  