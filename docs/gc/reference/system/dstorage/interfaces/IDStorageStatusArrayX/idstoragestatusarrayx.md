---
author: M-Stahl
title: IDStorageStatusArrayX (Interface contents)
description: Represents an array of status entries for the preceding read requests.
kindex: IDStorageStatusArrayX
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageStatusArrayX  

Represents an array of status entries for the preceding read requests. 

## Syntax  
  
```cpp  
class IDStorageStatusArrayX : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [GetHResult](methods/idstoragestatusarrayx_gethresult.md) | Returns the HRESULT code of the first failed request between the specified status entry and the previous status entry or fence. |  
| [IsComplete](methods/idstoragestatusarrayx_iscomplete.md) | Indicates whether all requests enqueued before the specified status entry have completed. |  

  
## Remarks  

A status entry receives completion status for all enqueued requests between it and the previous status entry or fence. 

The status entry can be enqueued again only after all requests enqueued before the status entry complete (that is, `IsComplete()` for the entry returns true). 

For more information, see the "EnqueueStatus/EnqueueSignal" section in [DirectStorage overview](../../../../../system/overviews/directstorage/directstorage-overview.md). 

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Libbrary:** dstorage.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX::EnqueueStatus](../IDStorageQueueX/methods/idstoragequeuex_enqueuestatus.md)  
[DStorage](../../dstorage_members.md)  
  