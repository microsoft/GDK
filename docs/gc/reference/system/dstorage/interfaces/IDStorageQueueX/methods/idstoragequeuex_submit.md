---
author: M-Stahl
title: Submit
description: Submits enqueued requests to DirectStorage.
kindex: Submit
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageQueueX::Submit  

Submits enqueued requests to DirectStorage.  

## Syntax  
  
```cpp
void Submit(  
)  
```  
  
### Parameters  
  
This method has no parameters. 
  
### Return value  
Type: void

## Remarks

This method submits requests from the queue to the hardware. Using `Submit` enables the title to control when the CPU cost occurs for transition between the title and the kernal. 

For more information, see the "EnqueueRequest" and "EnqueueStatus/EnqueueSignal" sections of [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  