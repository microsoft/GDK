---
author: joannaleecy
title: HCMemSetFunctions
description: Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager.
kindex: HCMemSetFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCMemSetFunctions  

Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager.  

## Syntax  
  
```cpp
HRESULT HCMemSetFunctions(  
         HCMemAllocFunction memAllocFunc,  
         HCMemFreeFunction memFreeFunc  
)  
```  
  
### Parameters  
  
*memAllocFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: HCMemAllocFunction  
  
A pointer to the custom allocation callback to use, or a null pointer to restore the default.  
  
*memFreeFunc* &nbsp;&nbsp;\_In\_opt\_  
Type: HCMemFreeFunction  
  
A pointer to the custom freeing callback to use, or a null pointer to restore the default.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_HC_ALREADY_INITIALIZED.
  
## Remarks  
  
This must be called before HCInitialize(). and can not be called again until HCCleanup(). This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines. The *memAllocFunc* and *memFreeFunc* parameters can be null pointers to restore the default routines. Both callback pointers must be null or both must be non-null. Mixing custom and default routines is not permitted.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  