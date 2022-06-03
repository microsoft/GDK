---
author: M-Stahl
title: IDStorageQueueX (Interface contents)
description: Represents a DirectStorage queue.
kindex: IDStorageQueueX
ms.author: mstahl
ms.topic: reference
edited: 04/24/2020
security: public
---

# IDStorageQueueX  

Represents a DirectStorage queue.
  
## Syntax  
  
```cpp  
class IDStorageQueueX : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [CancelRequestsWithTag](methods/idstoragequeuex_cancelrequestswithtag.md) | Attempts to cancel a group of previously enqueued read requests. |  
| [Close](methods/idstoragequeuex_close.md) | Closes the DirectStorage queue. |  
| [EnqueueRequest](methods/idstoragequeuex_enqueuerequest.md) | Enqueues a read request. |  
| [EnqueueSignal](methods/idstoragequeuex_enqueuesignal.md) | Enqueues a fence write. |  
| [EnqueueStatus](methods/idstoragequeuex_enqueuestatus.md) | Enqueues a status write. |  
| [GetErrorEvent](methods/idstoragequeuex_geterrorevent.md) | Obtains an event to wait on. |  
| [RetrieveErrorRecord](methods/idstoragequeuex_retrieveerrorrecord.md) | Retrieves an error record. |  
| [Submit](methods/idstoragequeuex_submit.md) | Submits enqueued requests to DirectStorage. |  
| [Query](methods/idstoragequeuex_query.md) | Obtains information about the queue. |  


## Remarks

A DirectStorage queue holds entries until the title calls [Submit](methods/idstoragequeuex_submit.md) on the queue. All entries in a DirectStorage queue complete in the order they are enqueued. 

For more information, see the "IDStorageQueueX" section in [DirectStorage overview](../../../../../system/overviews/directstorage/directstorage-overview.md). 

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::CreateQueue](../IDStorageFactoryX/methods/idstoragefactoryx_createqueue.md)  
[DStorage](../../dstorage_members.md)  
  