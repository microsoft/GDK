---
author: M-Stahl
title: EnqueueStatus
description: Enqueues a status write.
kindex: EnqueueStatus
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX::EnqueueStatus  

Enqueues a status write. 

## Syntax  
  
```cpp
void EnqueueStatus(  
         IDStorageStatusArrayX *statusArray,  
         UINT32 index  
)  
```  
  
### Parameters  
  
*statusArray*  
Type: IDStorageStatusArrayX 
  
An [IDStorageStatusArrayX](../../IDStorageStatusArrayX/idstoragestatusarrayx.md) object.  
  
*index*  
Type: UINT32  
  
Index of the status entry in the `IDStorageStatusArrayX` object to receive the status.  
  
### Return value  
Type: void
  
## Remarks

The status array is signaled when all enqueued requests between it and the previous status entry or fence complete.

After calling this method, a title thread can poll the `IDStorageStatusArrayX` object as needed. (The status array is undefined until this method is called.) If any failures occurred since the previous status entry, the *HResult* of the enqueued status entry stores the failure code of the first failed request. 

For more information, see the "Notification" and "EnqueueStatus/EnqueueSignal" sections in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::CreateStatusArray](../../IDStorageFactoryX/methods/idstoragefactoryx_createstatusarray.md)  
[IDStorageQueueX::EnqueueSignal](idstoragequeuex_enqueuesignal.md)  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  