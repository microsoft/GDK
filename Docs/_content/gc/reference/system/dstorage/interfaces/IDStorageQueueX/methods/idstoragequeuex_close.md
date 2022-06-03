---
author: M-Stahl
title: Close
description: Closes the DirectStorage queue.
kindex: Close
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX::Close  

Closes the DirectStorage queue.  

## Syntax  
  
```cpp
void Close(  
)  
```  
  
### Parameters  
  
This method has no parameters.
  
### Return value  
Type: void
  
## Remarks

This method closes a DirectStorage queue, regardless of the reference count on the `IDStorageQueueX` object. The method blocks until all enqueued reqests either complete or fail. After the method returns, the queue will no longer complete any more requests, even if some are submitted.  

For more information, see the "IDStorageQueueX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md).

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::CreateQueue](../../IDStorageFactoryX/methods/idstoragefactoryx_createqueue.md)  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  