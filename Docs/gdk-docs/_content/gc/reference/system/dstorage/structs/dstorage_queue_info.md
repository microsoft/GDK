---
author: M-Stahl
title: DSTORAGE_QUEUE_INFO
description: Properties and current state of a DirectStorage queue.
kindex: DSTORAGE_QUEUE_INFO
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_QUEUE_INFO  

Properties and current state of a DirectStorage queue. 

## Syntax  
  
```cpp
struct DSTORAGE_QUEUE_INFO {  
    DSTORAGE_QUEUE_DESC Desc;
    UINT16 EmptySlotCount;
    UINT16 RequestCountUntilAutoSubmit;
}  
```
  
### Members  

*Desc*  
Type: DSTORAGE_QUEUE_DESC

The [DSTORAGE_QUEUE_DESC](dstorage_queue_desc.md) structure used for creation of the queue.

*EmptySlotCount*  
Type: UINT16

The number of available empty slots. If a queue is empty, the number of empty slots equals capacity – 1. The reserved slot distinguishes between empty and full cases.

*RequestCountUntilAutoSubmit*  
Type: UINT16

The number of entries that need to be enqueued to trigger automatic submission. 

## Remarks 

This structure is used by the [IDStorageQueueX::Query](../interfaces/IDStorageQueueX/methods/idstoragequeuex_query.md) method.

If a queue is empty, *EmptySlotCount* equals capacity – 1. The reserved slot distinguishes between empty and full cases.
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX::Query](../interfaces/IDStorageQueueX/methods/idstoragequeuex_query.md)  
[DStorage](../dstorage_members.md)  
  