---
author: M-Stahl
title: GetStats
description: Gets DirectStorage statistics.
kindex: GetStats
ms.author: bartoszn
ms.topic: reference
edited: 00/00/0000
security: public
quality: good
---

# IDStorageFactoryX1::GetStats  

Gets the DirectStorage statistics. The statistics do not include Win32 file IO.  

## Syntax  
  
```cpp
void GetStats(  
    DSTORAGE_STATS *stats  
)  
```
  
### Parameters  
  
*stats*  
Type: [DSTORAGE_STATS](../../../structs/dstorage_stats.md) \*  
  
Pointer to a structure that will receive the DirectStorage statistics.  
  
### Return value  
Type: void  
  
## Remarks  

This function can be used to integrate DirectStorage with existing diagnostic and telemetry pipelines. It does minimal processing and thus can be called often. The statistics do not include Win32 file IO operations.  

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX1](../idstoragefactoryx1.md)  
[DStorage](../../../dstorage_members.md)  
[DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md)  