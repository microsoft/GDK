---
author: joannaleecy
title: XblMemGetFunctions
description: Gets the memory hook functions previously set by [XblMemSetFunctions](xblmemsetfunctions.md).
kindex: XblMemGetFunctions
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMemGetFunctions  

Gets the memory hook functions previously set by [XblMemSetFunctions](xblmemsetfunctions.md).  

## Syntax  
  
```cpp
HRESULT XblMemGetFunctions(  
         XblMemAllocFunction* memAllocFunc,  
         XblMemFreeFunction* memFreeFunc  
)  
```  
  
### Parameters  
  
*memAllocFunc* &nbsp;&nbsp;\_Out\_  
Type: XblMemAllocFunction*  
  
Set to the current allocation callback. Returns the default routine if not previously set.  
  
*memFreeFunc* &nbsp;&nbsp;\_Out\_  
Type: XblMemFreeFunction*  
  
Set to the current memory free callback. Returns the default routine if not previously set.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This method allows the application get the default memory allocation routines. This can be used along with XblMemSetFunctions() to monitor all memory allocations.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  