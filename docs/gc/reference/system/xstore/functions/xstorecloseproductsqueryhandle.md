---
author: M-Stahl
title: XStoreCloseProductsQueryHandle
description: Closes the specified store products query handle.
kindex: XStoreCloseProductsQueryHandle
ms.author: shanede
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCloseProductsQueryHandle  
  
Closes the specified store products query handle.  

## Syntax  
  
```cpp
void XStoreCloseProductsQueryHandle(  
         XStoreProductQueryHandle productQueryHandle  
)  
```  
  
### Parameters  
  
*productQueryHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreProductQueryHandle  
  
The handle to close.  
  
### Return value
Type: void
  
## Remarks  
  
This function is safe to call on a time-sensitive thread.
  
This function closes a product query handle returned by [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md), [XStoreQueryProductForPackageResult.md](xstorequeryproductforpackageresult.md), [XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md), or [XStoreQueryProductsResult](xstorequeryproductsresult.md). Failure to close an opened product query handle will result in a memory leak. See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md)  
[XStoreQueryProductForPackageResult.md](xstorequeryproductforpackageresult.md)  
[XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md)  
[XStoreQueryProductsResult](xstorequeryproductsresult.md)  