---
author: M-Stahl
title: SetCpuAffinity
description: Sets a CPU affinity mask for DirectStorage.
kindex: SetCpuAffinity
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX::SetCpuAffinity  

Sets a CPU affinity mask for DirectStorage. 

## Syntax  
  
```cpp
HRESULT SetCpuAffinity(  
         UINT64 affinity  
)  
```  
  
### Parameters  
  
*affinity*  
Type: UINT64  
  
The CPU affinity mask.    
  
### Return value  
Type: HRESULT
  
Standard HRESULT error code.
  
## Remarks

DirectStorage normally performs work in the calling thread. However, some work can't be performed in the calling thread. To restrict such work to a specified set of CPU cores, set a CPU affinity mask. 

For more information, see "SetCPUAffinity" in the "IDStorageFileX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  
  