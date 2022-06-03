---
author: M-Stahl
title: XGameSave Wrapper Reference (API contents)
description: XGameSave Wrapper Reference
kindex:
- game save, wrappers
- wrappers, game save
ms.author: jgup
ms.topic: navigation
ms.date: 02/23/2020
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameSave Wrapper Reference  

  
  
## Classes  
  
| Classe | Description |  
| --- | --- |  
| [Provider](classes/provider/xgamesave_wrapper_provider.md) | The primary management class for the **XGameSave** wrapper. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [BlobInfo](structs/blobinfo.md) | Contains the name and size of a blob (file) used by XGameSave wrappers. |  
  
## Vectors  
  
| Vector | Description |  
| --- | --- |  
| [BlobData](vectors/blobdata.md) | Basic unit (file or blob) that can written to or read by the XGameSave wrappers. |  
| [BlobInfoSet](vectors/blobinfoset.md) | Vector of BlobInfo structures describing what blobs (files) are contained within a given container. |  
| [BlobNames](vectors/blobnames.md) | Vector of the names of the blobs (files) that are contained within a given container. |  
| [ContainerNames](vectors/containernames.md) | Vector of the names of the containers used by the game. |  
