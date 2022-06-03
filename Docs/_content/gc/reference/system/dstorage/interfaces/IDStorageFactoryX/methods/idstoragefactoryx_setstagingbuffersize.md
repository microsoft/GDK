---
author: M-Stahl
title: SetStagingBufferSize
description: Sets the size of the staging buffer.
kindex: SetStagingBufferSize
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageFactoryX::SetStagingBufferSize

Sets the size of the staging buffer.  

## Syntax

```cpp
HRESULT SetStagingBufferSize(
    UINT32 size
)
```

### Parameters

*size*  
Type: UINT32  
  
Size, in bytes, of the staging buffer.  
  
### Return value  
Type: HRESULT  
  
Standard `HRESULT` error code.  

## Remarks

The staging buffer temporarily stores content loaded from the storage device before it is decrypted or decompressed. If only memory-sourced queues are used, the size of the staging buffer can be zero.

`SetStagingBufferSize` can be called only when no [IDStorageQueueX](../../IDStorageQueueX/idstoragequeuex.md) or [IDStorageFileX](../../IDStorageFileX/idstoragefilex.md) object exists.

In the current preview release, the only valid staging-buffer sizes are enumerated in the `DSTORAGE_STAGING_BUFFER_SIZE` enumeration.

For more information, see the "Staging buffer" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  
  