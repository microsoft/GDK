---
author: M-Stahl
title: Query
description: Obtains information about the queue.
kindex: Query
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageQueueX::Query

Obtains information about the queue. 

## Syntax  
  
```cpp
void Query(
    DSTORAGE_QUEUE_INFO *info
)
```  
  
### Parameters  
  
*info* &nbsp;&nbsp;\_Out\_  
Type: [DSTORAGE_QUEUE_INFO](../../../structs/dstorage_queue_info.md) \*  
  
Receives the information about the queue.
  
### Return value  
Type: void
  
## Remarks

Use this method to obtain the [DSTORAGE_QUEUE_DESC](../../../structs/dstorage_queue_desc.md) structure that was used for creation of the queue. [DSTORAGE_QUEUE_INFO](../../../structs/dstorage_queue_info.md) also provides the number of empty slots and the number of entries that need to be enqueued to trigger automatic submission. (Automatic submission occurs when the queue is half full.)
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  