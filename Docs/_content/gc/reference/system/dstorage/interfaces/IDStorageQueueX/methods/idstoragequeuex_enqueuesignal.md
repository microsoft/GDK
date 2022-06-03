---
author: M-Stahl
title: EnqueueSignal
description: Enqueues a fence write.
kindex: EnqueueSignal
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX::EnqueueSignal  

Enqueues a fence write.  

## Syntax  
  
```cpp
void EnqueueSignal(  
         ID3D12Fence *fence,  
         UINT64 value  
)  
```  
  
### Parameters  
  
*fence*  
Type: ID3D12Fence 
  
An `ID3D12Fence` to enqueue. 
  
*value*  
Type: UINT64  
  
The value to write to the fence.  
  
### Return value  
Type: void
  
## Remarks

The fence is signaled when all enqueued requests between the fence and the previous fence or status entry complete.

A title thread can wait for the fence or poll the fence. The GPU can also poll the fence. 

For more information, see the "Notification" and "EnqueueStatus/EnqueueSignal" sections in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX::EnqueueStatus](idstoragequeuex_enqueuestatus.md)  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  