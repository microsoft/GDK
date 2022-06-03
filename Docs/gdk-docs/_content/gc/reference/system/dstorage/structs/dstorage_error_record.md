---
author: M-Stahl
title: DSTORAGE_ERROR_RECORD
description: Detailed record of a failed DirectStorage request.
kindex: DSTORAGE_ERROR_RECORD
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_ERROR_RECORD  

Detailed record of a failed DirectStorage request.  

## Syntax  

```cpp
typedef struct DSTORAGE_ERROR_RECORD {  
    UINT32 FailureCount;  
    struct   
    {  
        HRESULT HResult ;  
        DSTORAGE_COMMAND_TYPE CommandType;  
        union  
        {  
            struct   
            {  
                DSTORAGE_REQUEST_OPTIONS Options;  
                void *Destination;  
                UINT32 DestinationSize;  
                WCHAR Filename[MAX_PATH];  
                UINT64 FileOffset;  
                void *Source;  
                UINT32 SourceSize;  
                UINT64 CancellationTag;  
                CHAR Name[DSTORAGE_REQUEST_MAX_NAME];  
            } Request;  
            struct   
            {  
                IDStorageStatusArrayX *StatusArray;  
                UINT32 Index;  
            } Status;  
            struct   
            {  
                ID3D12Fence *Fence;  
                UINT64 Value;  
            } Signal;  
        };  
    } FirstFailure;  
} DSTORAGE_ERROR_RECORD  
```

### Members  

*FailureCount*  
Type: UINT32  

The number of failed requests in the queue since the last `RetrieveErrorRecord` call.  

*HResult*  
Type: HRESULT  

The HRESULT code of the failure.

*CommandType*  
Type: [DSTORAGE_COMMAND_TYPE](../enums/dstorage_command_type.md)  

Type of the enqueue request that caused the failure.  

*Options*  
Type: [DSTORAGE_REQUEST_OPTIONS](dstorage_request_options.md)  

Various options of the failed request.  

*Destination*  
Type: void \*  

Address of the buffer to receive the final result of the failed request.  

*DestinationSize*  
Type: UINT32  

Expected size, in bytes, of the final result of the failed request, as passed in as part of the initial request.  

*Filename*  
Type: WCHAR[MAX_PATH]  

The name of the file that the request targeted.  

*FileOffset*  
Type: UINT64  

The offset, in bytes, in the file to the start of the failed read request.  

**Source*  
Type: void  

For a memory-sourced request, the address of the buffer to read from.  

*SourceSize*  
Type: UINT32  

The number of bytes to read from the source.

*CancellationTag*  
Type: UINT64  

An arbitrary UINT64 number used for cancallation matching.

*Name*  
Type: CHAR[DSTORAGE_REQUEST_MAX_NAME]  

Name of the request.  

**StatusArray*  
Type: IDStorageStatusArrayX  

For a status write request, the [IDStorageStatusArrayX](../interfaces/IDStorageStatusArrayX/idstoragestatusarrayx.md) object.    

*Index*  
Type: UINT32  

For a status write request, the index of the status entry in the `IDStorageStatusArrayX` object to receive the status.  

**Fence*  
Type: ID3D12Fence  

For a fence write request, the `ID3D12Fence` object.

*Value*  
Type: UINT64  

For a fence write request, the value to write to the fence.  

## Remarks

This structure is used by the [IDStorageQueueX::RetrieveErrorRecord](../interfaces/IDStorageQueueX/methods/idstoragequeuex_retrieveerrorrecord.md) method.

If *CommandType* is `DSTORAGE_COMMAND_TYPE_NONE`, the remaining data is undefined.

For more information, see the "GetErrorEvent/RetrieveErrorRecord" section in [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).

## Requirements  

**Header:** dstorage_xs.h  

**Supported platforms:** Xbox Series consoles  

## See also  
[DStorage](../dstorage_members.md)  