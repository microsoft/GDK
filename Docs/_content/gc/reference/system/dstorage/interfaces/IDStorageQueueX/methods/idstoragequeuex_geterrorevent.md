---
author: M-Stahl
title: GetErrorEvent
description: Obtains an event to wait on.
kindex: GetErrorEvent
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageQueueX::GetErrorEvent  

Obtains an event to wait on. 

## Syntax  
  
```cpp
HANDLE GetErrorEvent(  
)  
```  
  
### Parameters  
  
This method has no parameters. 
  
### Return value  
Type: HANDLE
  
HANDLE to an event.
  
## Remarks 

When an error occurs for a read request in this queue, the event will be signalled. Call [IDStorageQueueX::RetrieveErrorRecord](idstoragequeuex_retrieveerrorrecord.md) to retrieve diagnostic information. Call `CloseHandle` after the title no longer needs the event. 

For more information, see the "GetErrorEvent/RetrieveErrorRecord" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  