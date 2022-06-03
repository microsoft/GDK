---
author: M-Stahl
title: XStoreCloseContextHandle
description: Closes the specified store context handle.
kindex: XStoreCloseContextHandle
ms.author: shanede
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCloseContextHandle  

Closes the specified store context handle.  

## Syntax  
  
```cpp
void XStoreCloseContextHandle(  
         XStoreContextHandle storeContextHandle  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The handle to close.  
  
### Return value
Type: void
  
  
## Remarks  
  
This function is safe to call on a time-sensitive thread.
  
This function closes the **XStoreContextHandle** created by [XStoreCreateContext](xstorecreatecontext.md). Store context handles not closed with this function will cause memory leaks. It is best to call this function during cleanup to close all remaining **XStoreConextHandles**. See [XStoreCreateContext](xstorecreatecontext.md) for a usage example.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreCreateContext](xstorecreatecontext.md)  
  