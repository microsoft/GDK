---
author: M-Stahl
title: CreateStatusArray
description: Creates a DirectStorage status array object.
kindex: CreateStatusArray
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX::CreateStatusArray  

Creates a DirectStorage status array object.  

## Syntax  
  
```cpp
HRESULT CreateStatusArray(  
         UINT32 capacity,  
         PCSTR name,
         REFIID riid,  
         void **ppv  
)  
```  
   
### Parameters  
  
*capacity*  
Type: UINT32  
  
Specifies the number of status entries the array can hold.  

*name*  
Type: PCSTR  
  
The name of the status array. Used for debugging.

*riid*  
Type: REFIID  
  
Specifies the DirectStorage status interface, such as `__uuidof(IDStorageStatusArrayX)`.  
  
*ppv* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: void \*\*  
  
Receives the newly created status array object.  
  
### Return value  
Type: HRESULT
  
Standard HRESULT error code.
  
## Remarks

A DirectStorage status array stores completion-status flags. To enqueue a status write, call [IDStorageQueueX::EnqueueStatus](../../IDStorageQueueX/methods/idstoragequeuex_enqueuestatus.md). 

For more information, see the "EnqueueStatus/EnqueueSignal" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  
  