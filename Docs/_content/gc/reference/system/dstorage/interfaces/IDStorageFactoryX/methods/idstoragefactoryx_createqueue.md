---
author: M-Stahl
title: CreateQueue
description: Creates a DirectStorage queue object.
kindex: CreateQueue
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX::CreateQueue  

Creates a DirectStorage queue object.  

## Syntax  
  
```cpp
HRESULT CreateQueue(  
         const DSTORAGE_QUEUE_DESC *desc,  
         REFIID riid,  
         void **ppv  
)  
```  
  
### Parameters  
  
*desc*  
Type: [DSTORAGE_QUEUE_DESC](../../../structs/dstorage_queue_desc.md) \*  
  
Descriptor that specifies the properties of the queue.    
  
*riid*  
Type: REFIID  
  
Specifies the DirectStorage queue interface, such as `__uuidof(IDStorageQueueX)`.  
  
*ppv* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: void \*\*  
  
Returns a pointer to the created object. 
  
### Return value  
Type: HRESULT
  
Standard HRESULT error code.
  
## Remarks

A DirectStorage queue holds read requests until the title calls [Submit](../../IDStorageQueueX/methods/idstoragequeuex_submit.md) on the queue. All entries in a DirectStorage queue complete in the order they are enqueued. 

For more information, see the "IDStorageQueueX" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  
  