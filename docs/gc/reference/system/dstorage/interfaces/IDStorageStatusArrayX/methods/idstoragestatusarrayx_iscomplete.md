---
author: M-Stahl
title: IsComplete
description: Indicates whether all requests enqueued before the specified status entry have completed.
kindex: IsComplete
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageStatusArrayX::IsComplete  

Indicates whether all requests enqueued before the specified status entry have completed.  

## Syntax  
  
```cpp
bool IsComplete(  
         UINT32 index  
)  
```  
  
### Parameters  
  
*index*  
Type: UINT32  
  
Specifies the index of the status entry to retrieve.  
  
### Return value  
Type: bool
  
Boolean value indicating completion.
  
## Remarks  
  
This method returns a Boolean value that indicates whether all requests that were enqueued before *index* are complete. If any request is not complete, this method returns false. (This is equivalent to `GetHResult(index) != E_PENDING`.)
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageStatusArrayX::GetHResult](idstoragestatusarrayx_gethresult.md)  
[IDStorageStatusArrayX](../idstoragestatusarrayx.md)  
[DStorage](../../../dstorage_members.md)  
  