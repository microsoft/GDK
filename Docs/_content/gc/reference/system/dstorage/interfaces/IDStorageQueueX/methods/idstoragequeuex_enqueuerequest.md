---
author: M-Stahl
title: EnqueueRequest
description: Enqueues a read request.
kindex: EnqueueRequest
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX::EnqueueRequest  

Enqueues a read request.    

## Syntax  
  
```cpp
void EnqueueRequest(  
         const DSTORAGE_REQUEST *request  
)  
```  
  
### Parameters  
  
*request*  
Type: [DSTORAGE_REQUEST](../../../structs/dstorage_request.md) 
  
The read request to be queued.  
  
### Return value  
Type: void
  
## Remarks

This method enqueues data from *request*. The [DSTORAGE_REQUEST](../../../structs/dstorage_request.md) structure can be reused as soon as the method returns. 

For more information, see the "EnqueueRequest" section of [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md).

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  