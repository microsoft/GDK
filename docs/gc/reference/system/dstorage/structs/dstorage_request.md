---
author: M-Stahl
title: DSTORAGE_REQUEST
description: Represents a DirectStorage read request.
kindex: DSTORAGE_REQUEST
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_REQUEST  

Represents a DirectStorage read request.  

## Syntax  

```cpp
struct DSTORAGE_REQUEST {
    DSTORAGE_REQUEST_OPTIONS Options;

    union
    {
        void *Destination;

        struct
        {
            PULONG_PTR DestinationPageArray;

            UINT16 DestinationPageOffset;
        };
    };

    UINT32 DestinationSize;

    union
    {
        struct
        {
            IDStorageFileX *File;

            UINT64 FileOffset;
        };
        void *Source;

        struct
        {
            PULONG_PTR SourcePageArray;

            UINT16 SourcePageOffset;
        };
    };

    UINT32 SourceSize;

    UINT32 IntermediateSize;

    UINT64 CancellationTag;

    const CHAR *Name;
};
```

### Members  

*Options*  
Type: [DSTORAGE_REQUEST_OPTIONS](dstorage_request_options.md)  

Various options for this request.

*Destination*  
Type: void \*  

Address of the buffer to receive the final result of this request.

*DestinationPageArray*  
Type: PULONG_PTR  

Address of the page array to receive the final result of this request if *DestinationIsPhysicalPages* is specified. Each entry is a 64-KB page number.  

*DestinationPageOffset*  
Type: UINT16  

Offset into the 64-KB page where the destination starts, if *DestinationIsPhysicalPages* is specified.

*DestinationSize*  
Type: UINT32  

The expected size, in bytes, of the final result of this request.  If the request does not include decompression this should be equal to *SourceSize*.  For requests that include decompression, this value will be larger than *SourceSize*.

*File*  
Type: IDStorageFileX \*  

The file to perform this read request from, if *SourceType* is `DSTORAGE_REQUEST_SOURCE_FILE`.

*FileOffset*  
Type: UINT64  

The offset, in bytes, in the file to start the read request at, if *SourceType* is `DSTORAGE_REQUEST_SOURCE_FILE`. If *ZlibDecompress* or *BcpackMode* is specified, the offset must be 16-byte aligned.

**Source*  
Type: void  

Address of the source buffer to be read from, if *SourceType* is `DSTORAGE_REQUEST_SOURCE_MEMORY` and *SourceIsPhysicalPages* is not specified.  

*SourcePageArray*  
Type: PULONG_PTR  

Address of the page array to provide the source buffer to be read from if *SourceType* is `DSTORAGE_REQUEST_SOURCE_MEMORY` and *SourceIsPhysicalPages* is specified. Each entry is a 64-KB page number.  

*SourcePageOffset*  
Type: UINT16  

Offset into the 64-KB page where the source starts, if *SourceType* is `DSTORAGE_REQUEST_SOURCE_MEMORY` and *SourceIsPhysicalPages* is specified.  

*SourceSize*  
Type: UINT32  

Size, in bytes, to be read from the file or memory source.

*IntermediateSize*  
Type: UINT32  

The number of bytes of BCPack compressed data if *ZlibDecompress* and *BcpackMode* are both specified.  

*CancellationTag*  
Type: UINT64  

An arbitrary UINT64 number used for cancellation matching.

**Name*  
Type: const CHAR  

Optional name of the request. Used for debugging. If specified, the string should be accessible until the request completes.  

## Remarks

This structure is used by the [IDStorageQueueX::EnqueueRequest](../interfaces/IDStorageQueueX/methods/idstoragequeuex_enqueuerequest.md) method. The structure can be reused as soon as `EnqueueRequest` returns.

For more information, see the "EnqueueRequest" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).

## Requirements  

**Header:** dstorage_xs.h  

**Supported platforms:** Xbox Series consoles  

## See also  
[DStorage](../dstorage_members.md)  