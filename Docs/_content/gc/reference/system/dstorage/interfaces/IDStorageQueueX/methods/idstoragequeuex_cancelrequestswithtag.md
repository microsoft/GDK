---
author: M-Stahl
title: CancelRequestsWithTag
description: Attempts to cancel a group of previously enqueued read requests.
kindex: CancelRequestsWithTag
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX::CancelRequestsWithTag  

Attempts to cancel a group of previously enqueued read requests.  

## Syntax  
  
```cpp
void CancelRequestsWithTag(  
         UINT64 mask,  
         UINT64 value  
)  
```  
  
### Parameters  
  
*mask*  
Type: UINT64  
  
The mask for the cancellation formula.  
  
*value*  
Type: UINT64  
  
The value for the cancellation formula.  
  
### Return value  
Type: void
  
## Remarks  

All previously enqueued requests whose *CancellationTag* matches the formula `(CancellationTag & mask) == value` will be cancelled. 

A cancellation request might or might not be able to cancel a read request. A cancelled request is not counted as a failure in either [IDStorageStatusArrayX](../../IDStorageStatusArrayX/idstoragestatusarrayx.md) or [DSTORAGE_ERROR_RECORD](../../../structs/dstorage_error_record.md). 

This method cancels requests that were enqueued before the method was called. Requests enqueued after the method returns are not affected.

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Whether requests enqueued by another thread *during* the method call are cancelled is undefined. 

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  