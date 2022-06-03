---
author: M-Stahl
title: XStoreProductQueryCallback
description: Game defined callback for a product query.
kindex: XStoreProductQueryCallback
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProductQueryCallback  
  
Game defined callback for a product query.  

## Syntax  
  
```cpp
bool XStoreProductQueryCallback(  
         const XStoreProduct* product,  
         void* context  
)  
```  
  
### Parameters  
  
*product* &nbsp;&nbsp;\_In\_  
Type: [XStoreProduct*](../structs/xstoreproduct.md)  
  
Description of the product.  

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Game defined context to pass to the callback.  
  
### Return value
Type: bool
  
Return true to continue enumerating query results; return false otherwise.  

## Remarks
  
 This game defined function is used to read information from one of an enumerated set of store products. The function must have the same return type and parameters as the definition provided here and is used as a callback for the [XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md) function.  See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  