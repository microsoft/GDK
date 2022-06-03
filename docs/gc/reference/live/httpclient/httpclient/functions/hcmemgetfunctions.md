---
author: joannaleecy
title: HCMemGetFunctions
description: Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager.
kindex: HCMemGetFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMemGetFunctions  

Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager.  

## Syntax  
  
```cpp
HRESULT HCMemGetFunctions(  
         HCMemAllocFunction* memAllocFunc,  
         HCMemFreeFunction* memFreeFunc  
)  
```  
  
### Parameters  
  
*memAllocFunc* &nbsp;&nbsp;\_Out\_  
Type: HCMemAllocFunction*  
  
Set to the current allocation callback. Returns the default routine if not previously set.  
  
*memFreeFunc* &nbsp;&nbsp;\_Out\_  
Type: HCMemFreeFunction*  
  
Set to the to the current memory free callback. Returns the default routine if not previously set.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This method allows the application get the default memory allocation routines. This can be used along with HCMemSetFunctions() to monitor all memory allocations.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  