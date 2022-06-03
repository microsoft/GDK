---
author: M-Stahl
title: GetHResult
description: Returns the HRESULT code of the first failed request between the specified status entry and the previous status entry or fence.
kindex: GetHResult
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageStatusArrayX::GetHResult  

Returns the HRESULT code of the first failed request between the specified status entry and the previous status entry or fence.  

## Syntax  
  
```cpp
HRESULT GetHResult(  
         UINT32 index  
)  
```  
  
### Parameters  
  
*index*  
Type: UINT32  
  
Specifies the index of the status entry to retrieve.  
  
### Return value  
Type: HRESULT
  
HRESULT code of the requests.
  
## Remarks  
  
* If any requests have not completed yet, the return value is `E_PENDING`. 
* If all requests have completed and one or more failures occurred, the return value is the failure code of the first failed request between the specified status entry and the previous status entry or fence. 
* If all requests have completed successfully, the return value is `S_OK`. 
 
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageStatusArrayX::IsComplete](idstoragestatusarrayx_iscomplete.md)  
[IDStorageStatusArrayX](../idstoragestatusarrayx.md)  
[DStorage](../../../dstorage_members.md)  
  