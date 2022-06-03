---
author: M-Stahl
title: DSTORAGE_STATS
description: DirectStorage statistics.
kindex: DSTORAGE_STATS
ms.author: bartoszn
ms.topic: reference
edited: 00/00/0000
security: public
quality: good
---

# DSTORAGE_STATS
  
DirectStorage statistics.  
  
## Syntax
  
```cpp
struct DSTORAGE_STATS
{
    DSTORAGE_PRIORITY_STATS LowPriorityStats;
    DSTORAGE_PRIORITY_STATS NormalPriorityStats;
    DSTORAGE_PRIORITY_STATS HighPriorityStats;
    DSTORAGE_PRIORITY_STATS RealtimePriorityStats;
    UINT8 CurrentOpenVirtualDiskCount;
    UINT8 MaxOpenVirtualDiskCount;
    UINT32 CumulativeOpenVirtualDiskCount;
    UINT32 PendingStorageRequestCount;
    UINT32 TotalStorageRequestCount;
    UINT32 StorageRetries;
    UINT32 StorageErrors;
    UINT32 PendingDecompressionRequestCount;
    UINT32 TotalDecompressionRequestCount;
    UINT32 DecompressionErrors;
    UINT32 StagingBufferStallCount;
    UINT32 CurrentOpenFileCount;
    UINT32 MaxOpenFileCount;
    UINT32 CumulativeOpenFileCount;
    UINT32 CurrentTitleMemoryUsageBytes;
    UINT32 MaxTitleMemoryUsageBytes;
    UINT32 ErrorCount;
};
```
  
### Members
  
*LowPriorityStats*  
Type: [DSTORAGE_PRIORITY_STATS](dstorage_priority_stats.md)  
  
Statistics of the low priority queues.  
  
*NormalPriorityStats*  
Type: [DSTORAGE_PRIORITY_STATS](dstorage_priority_stats.md)  
  
Statistics of the normal priority queues.  
  
*HighPriorityStats*  
Type: [DSTORAGE_PRIORITY_STATS](dstorage_priority_stats.md)  
  
Statistics of the high priority queues.  
  
*RealtimePriorityStats*  
Type: [DSTORAGE_PRIORITY_STATS](dstorage_priority_stats.md)  
  
Statistics of the realtime priority queues.  
  
*CurrentOpenVirtualDiskCount*  
Type: UINT8  
  
The number of currently open virtual disks (game package, DLC packages,
developer scratch, PLS).  
  
*MaxOpenVirtualDiskCount*  
Type: UINT8  
  
The highest number of concurrently opened virtual disks.  
  
*CumulativeOpenVirtualDiskCount*  
Type: UINT32  
  
Cumulative number of opened virtual disks.  
  
*PendingStorageRequestCount*  
Type: UINT32  
  
The number of requests sent by DirectStorage to storage devices that haven't
been completed by the hardware yet.  
  
*TotalStorageRequestCount*  
Type: UINT32  
  
The total number of requests sent by DirectStorage to storage devices.  
  
*StorageRetries*  
Type: UINT32  
  
The number of storage device retries.  
  
*StorageErrors*  
Type: UINT32  
  
The number of storage device errors.  
  
*PendingDecompressionRequestCount*  
Type: UINT32  
  
The number of currently pending decompression requests.  
  
*TotalDecompressionRequestCount*  
Type: UINT32  
  
The total number of decompression requests.  
  
*DecompressionErrors*  
Type: UINT32  
  
The number of decompression errors.  
  
*StagingBufferStallCount*  
Type: UINT32  
  
The number of stalls caused by a full staging buffer.  
  
*CurrentOpenFileCount*  
Type: UINT32  
  
The number of currently open files.  
  
*MaxOpenFileCount*  
Type: UINT32  
  
The highest number of concurrently opened files.  
  
*CumulativeOpenFileCount*  
Type: UINT32  
  
Cumulative number of opened files.  
  
*CurrentTitleMemoryUsageBytes*  
Type: UINT32  
  
The current DirectStorage memory footprint (including the staging buffer, etc.).  
  
*MaxTitleMemoryUsageBytes*  
Type: UINT32  
  
The highest DirectStorage memory footprint (including the staging buffer, etc.).  
  
*ErrorCount*  
Type: UINT32  
  
The total number of errors.
The error count is incremented every time a request fails for any reason.
Sample errors are: reading data from an invalid offset, storage device errors,
decompression errors, invalid request parameters, etc.  
  
## Remarks
  
This structure is used by the [IDStorageFactoryX1::GetStats](../interfaces/IDStorageFactoryX1/methods/idstoragefactoryx1_getstats.md) method.  
  
## Requirements
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also
[DStorage](../dstorage_members.md)  
  
  