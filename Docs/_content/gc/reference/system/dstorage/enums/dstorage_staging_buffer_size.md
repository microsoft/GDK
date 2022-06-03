---
author: M-Stahl
title: DSTORAGE_STAGING_BUFFER_SIZE
description: Valid staging buffer sizes.
kindex: DSTORAGE_STAGING_BUFFER_SIZE
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_STAGING_BUFFER_SIZE  

Valid staging buffer sizes.    

## Syntax  
  
```cpp
enum DSTORAGE_STAGING_BUFFER_SIZE  : UINT32  
{  
    DSTORAGE_STAGING_BUFFER_SIZE_0 = 0,  
    DSTORAGE_STAGING_BUFFER_SIZE_32MB = 32 * 1048576,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_STAGING_BUFFER_SIZE_0 | Zero bytes. |  
| DSTORAGE_STAGING_BUFFER_SIZE_32MB | 32 MB. |  
  
## Remarks  

This enumeration is used by the [IDStorageFactoryX::SetStagingBufferSize](../interfaces/IDStorageFactoryX/methods/idstoragefactoryx_setstagingbuffersize.md) method. 

The staging buffer temporarily stores content loaded from the storage device before it is decrypted or decompressed. If only memory-sourced queues are used, the size of the staging buffer can be zero. 

For more information, see the "Staging buffer" section in [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
   
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  