---
author: M-Stahl
title: IDStorageFactoryX (Interface contents)
description: Represents the static DirectStorage factory object.
kindex: IDStorageFactoryX
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX  

Represents the static DirectStorage factory object.

## Syntax  
  
```cpp  
class IDStorageFactoryX : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [CreateQueue](methods/idstoragefactoryx_createqueue.md) | Creates a DirectStorage queue object. |  
| [CreateStatusArray](methods/idstoragefactoryx_createstatusarray.md) | Creates a DirectStorage status array object. |  
| [OpenFile](methods/idstoragefactoryx_openfile.md) | Opens a file for DirectStorage access. |  
| [SetCpuAffinity](methods/idstoragefactoryx_setcpuaffinity.md) | Sets a CPU affinity mask for DirectStorage. |  
| [SetDebugFlags](methods/idstoragefactoryx_setdebugflags.md) | Sets flags used to control the debug layer. |  
| [SetStagingBufferSize](methods/idstoragefactoryx_setstagingbuffersize.md) | Sets the size of the staging buffer. |  


## Remarks  

Use the DirectStorage factory object to create DirectStorage queues, open files for DirectStorage access, and perform global operations. 
  
To obtain a pointer to the `IDStorageFactoryX` singleton, use [DStorageGetFactory](../../functions/dstoragegetfactory.md).  

For more information, see the "IDStorageFactoryX" section of [DirectStorage overview](../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorageGetFactory](../../functions/dstoragegetfactory.md)  
[DStorage](../../dstorage_members.md)  
  