---
author: M-Stahl
title: XStorePackageLicenseLostCallback
description: Game defined callback for the license lost event.
kindex: XStorePackageLicenseLostCallback
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStorePackageLicenseLostCallback  

Game defined callback for the license lost event.  

## Syntax  
  
```cpp
void XStorePackageLicenseLostCallback(  
         void* context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
Game defined context to pass to the callback.  
  
### Return value
Type: void
  
## Remarks

In order for this game defined function to be called, it must first be registered with the [XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md) function. The function must match the return type and parameters of **XStorePackageLicenseLostCallback**. In order to avoid a memory leak you must call [XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md) when you are finished with the callback function.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md)  
[XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md)  