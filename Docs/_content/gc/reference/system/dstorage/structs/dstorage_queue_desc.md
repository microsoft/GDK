---
author: M-Stahl
title: DSTORAGE_QUEUE_DESC
description: Properties of a DirectStorage queue.
kindex: DSTORAGE_QUEUE_DESC
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_QUEUE_DESC  

Properties of a DirectStorage queue.  

## Syntax  
  
```cpp
typedef struct DSTORAGE_QUEUE_DESC {  
    DSTORAGE_REQUEST_SOURCE_TYPE SourceType;  
    UINT16 Capacity;  
    DSTORAGE_PRIORITY Priority;  
    const CHAR *Name;  
} DSTORAGE_QUEUE_DESC  
```
  
### Members  
*SourceType*  
Type: [DSTORAGE_REQUEST_SOURCE_TYPE](../enums/dstorage_request_source_type.md)  

The source type of requests the queue can accept. 
  
*Capacity*  
Type: UINT16  
  
The maximum number of requests this queue can hold. This value must be between the values of `DSTORAGE_MIN_QUEUE_CAPACITY` and `DSTORAGE_MAX_QUEUE_CAPACITY`.  
  
*Priority*  
Type: [DSTORAGE_PRIORITY](../enums/dstorage_priority.md)  
  
The priority of the requests in this queue. 
  
*Name*  
Type: const CHAR \*  
  
The name of the queue. 
  
## Remarks 

This structure is used by the [IDStorageFactoryX::CreateQueue](../interfaces/IDStorageFactoryX/methods/idstoragefactoryx_createqueue.md) method and appears in the [DSTORAGE_QUEUE_INFO](dstorage_queue_info.md) structure. 

The *Name* member is optional and intended for debugging.

For more information, see the "IDStorageQueueX" section in [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  