---
author: M-Stahl
title: DSTORAGE_PRIORITY_STATS
description: DirectStorage per priority statistics.
kindex: DSTORAGE_PRIORITY_STATS
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
struct DSTORAGE_PRIORITY_STATS {
    UINT32 CurrentQueueCount;
    UINT32 MaxQueueCount;
    UINT32 CumulativeQueueCount;
    UINT32 TotalStatusCount;
    UINT32 TotalFenceCount;
    UINT32 PendingRequestCount;
    UINT32 TotalRequestCount;
    UINT64 TotalRequestSourceByteCount;
    UINT64 TotalRequestDestinationByteCount;
};
```
  
### Members
  
*CurrentQueueCount*  
Type: UINT32  
  
The number of currently open queues.  
  
*MaxQueueCount*  
Type: UINT32  
  
The highest number of concurrently opened queues.  
  
*CumulativeQueueCount*  
Type: UINT32  
  
Cumulative number of opened queues.  
  
*TotalStatusCount*  
Type: UINT32  
  
The total number of status requests.  
  
*TotalFenceCount*  
Type: UINT32  
  
The total number of fence requests.  
  
*PendingRequestCount*  
Type: UINT32  
  
The number of currently pending requests. A request is considered
to be in a pending state when the DirectStorage subsystem has started
processing it, but the request hasn't been completed yet.
A [IDStorageQueueX::Submit](../interfaces/IDStorageQueueX/methods/idstoragequeuex_submit.md) call is a signal for
the DirectStorage to start processing requests in the given queue. There might
be a delay between a [IDStorageQueueX::Submit](../interfaces/IDStorageQueueX/methods/idstoragequeuex_submit.md) call
and when a request is considered pending if lower level DirectStorage resources
are busy.
  
*TotalRequestCount*  
Type: UINT32  
  
The total number of submitted requests.  
  
*TotalRequestSourceByteCount*  
Type: UINT64  
  
The sum of requests' source sizes.  
  
*TotalRequestDestinationByteCount*  
Type: UINT64  
  
The sum of requests' destination sizes.  
  
## Remarks
  
This structure is returned as part of the [DSTORAGE_STATS](dstorage_stats.md) used by the [IDStorageFactoryX1::GetStats](../interfaces/IDStorageFactoryX1/methods/idstoragefactoryx1_getstats.md) method.  
  
## Requirements
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also
[DStorage](../dstorage_members.md)  
  
  