---
author: M-Stahl
title: DSTORAGE_REQUEST_OPTIONS
description: Options for a DirectStorage read request.
kindex: DSTORAGE_REQUEST_OPTIONS
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_REQUEST_OPTIONS  

Options for a DirectStorage read request.    

## Syntax  
  
```cpp
union DSTORAGE_REQUEST_OPTIONS {
    struct {
        UINT64 ZlibDecompress : 1;
        DSTORAGE_BCPACK_MODE BcpackMode : 4;  
        DSTORAGE_SWIZZLE_MODE SwizzleMode : 16;  
        UINT64 DestinationIsPhysicalPages : 1;  
        DSTORAGE_REQUEST_SOURCE_TYPE SourceType : 1;  
        UINT64 SourceIsPhysicalPages : 1;  
        UINT64 Reserved : 40;  
    };
    UINT64 AsUINT64;
};
```
  
### Members  
  
*ZlibDecompress*  
Type: UINT64 : 1  
  
Boolean value indicating whether to perform RFC 1950 decompression.
  
*BcpackMode*  
Type: [DSTORAGE_BCPACK_MODE](../enums/dstorage_bcpack_mode.md) : 4  
  
`DSTORAGE_BCPACK_MODE` value indicating the type of BCPack decompression to perform.
  
*SwizzleMode*  
Type: [DSTORAGE_SWIZZLE_MODE](../enums/dstorage_swizzle_mode.md) : 16  
  
`DSTORAGE_SWIZZLE_MODE` value indicating the type of swizzle operation to perform.
  
*DestinationIsPhysicalPages*  
Type: UINT64 : 1  
  
Boolean value indicating that destination memory is an array of physical pages allocated through [XMemAllocatePhysicalPages (NDA topic)](../../xmem/functions/xmemallocatephysicalpages.md).  
  
*SourceType*  
Type: [DSTORAGE_REQUEST_SOURCE_TYPE](../enums/dstorage_request_source_type.md)  
  
`DSTORAGE_REQUEST_SOURCE_TYPE` value indicating whether the source of the request is a file or a block of memory.  
  
*SourceIsPhysicalPages*  
Type: UINT64  
  
When *SourceType* is `DSTORAGE_REQUEST_SOURCE_MEMORY`, this Boolean value indicates that source memory is an array of physical pages allocated through [XMemAllocatePhysicalPages (NDA topic)](../../xmem/functions/xmemallocatephysicalpages.md). 
  
*Reserved*  
Type: UINT64 : 40  
  
Reserved. Must be zero. 
  
*AsUINT64*  
Type: UINT64  
  
UINT64 representation of the structure.  

## Remarks

This structure is used in the [DSTORAGE_REQUEST](dstorage_request.md) and [DSTORAGE_ERROR_RECORD](dstorage_error_record.md) structures. The structure can be reused as soon as [IDStorageQueueX::EnqueueRequest](../interfaces/IDStorageQueueX/methods/idstoragequeuex_enqueuerequest.md) returns.  

For more information about read requests, see the "EnqueueRequest" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  