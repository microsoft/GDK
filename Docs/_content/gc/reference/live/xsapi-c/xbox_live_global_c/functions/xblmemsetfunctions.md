---
author: joannaleecy
title: XblMemSetFunctions
description: Optionally sets the memory hook functions to allow callers to route memory allocations to their own memory manager.
kindex: XblMemSetFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMemSetFunctions  

Optionally sets the memory hook functions to allow callers to route memory allocations to their own memory manager.  

## Syntax  
  
```cpp
HRESULT XblMemSetFunctions(  
         XblMemAllocFunction memAllocFunc,  
         XblMemFreeFunction memFreeFunc  
)  
```  
  
### Parameters  
  
*memAllocFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: XblMemAllocFunction  
  
A pointer to the custom allocation callback to use, or a null pointer to restore the default.  
  
*memFreeFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: XblMemFreeFunction  
  
A pointer to the custom freeing callback to use, or a null pointer to restore the default.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This must be called before XblInitialize() and can not be called again until XblCleanup(). This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines. The *memAllocFunc* and *memFreeFunc* parameters can be null pointers to restore the default routines. Both callback pointers must be null or both must be non-null. Mixing custom and default routines is not permitted.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  