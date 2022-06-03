---
author: M-Stahl
title: DSTORAGE_PRIORITY
description: Priority levels of a DirectStorage queue.
kindex: DSTORAGE_PRIORITY
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DSTORAGE_PRIORITY  

Priority levels of a DirectStorage queue.    

## Syntax  
  
```cpp
enum DSTORAGE_PRIORITY  : INT8  
{  
    DSTORAGE_PRIORITY_LOW = -1,  
    DSTORAGE_PRIORITY_NORMAL = 0,  
    DSTORAGE_PRIORITY_HIGH = 1,  
    DSTORAGE_PRIORITY_REALTIME = 2,  
    DSTORAGE_PRIORITY_FIRST = DSTORAGE_PRIORITY_LOW,  
    DSTORAGE_PRIORITY_LAST = DSTORAGE_PRIORITY_REALTIME,  
    DSTORAGE_PRIORITY_COUNT = 4  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_PRIORITY_LOW | Lowest priority for a DirectStorage operation. |  
| DSTORAGE_PRIORITY_NORMAL | Majority of requests should be at this priority. |  
| DSTORAGE_PRIORITY_HIGH | Highest priority for a DirectStorage operation. |  
| DSTORAGE_PRIORITY_REALTIME | Same priority as `DSTORAGE_PRIORITY_HIGH` but minimizes latency at the cost of increased CPU load. |  
| DSTORAGE_PRIORITY_FIRST | The lowest priority level; equal to `DSTORAGE_PRIORITY_LOW`. |  
| DSTORAGE_PRIORITY_LAST | The highest priority level; equal to `DSTORAGE_PRIORITY_REALTIME`. |  
| DSTORAGE_PRIORITY_COUNT | The number of priority levels. |  
  
## Remarks  
  
This enumeration is used in the [DSTORAGE_QUEUE_DESC](../structs/dstorage_queue_desc.md) structure.

Priority is enforced by a weighted round-robin algorithm that is based on size of the requests. The difference between `DSTORAGE_PRIORITY_LOW` and `DSTORAGE_PRIORITY_NORMAL` is approximately an order of magnitude, as is the difference between `DSTORAGE_PRIORITY_NORMAL` and `DSTORAGE_PRIORITY_HIGH`.  

All Win32 requests have normal priority (`DSTORAGE_PRIORITY_NORMAL`).

To iterate over the priority levels, use `DSTORAGE_PRIORITY_FIRST`, `DSTORAGE_PRIORITY_LAST`, and `DSTORAGE_PRIORITY_COUNT`. 

For more information, see the "Priority" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  