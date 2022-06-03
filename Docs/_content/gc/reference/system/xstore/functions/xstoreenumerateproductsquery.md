---
author: M-Stahl
title: XStoreEnumerateProductsQuery
description: Enumerates the results of a products query.
kindex: XStoreEnumerateProductsQuery
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreEnumerateProductsQuery  
  
Enumerates the results of a products query.  

## Syntax  
  
```cpp
HRESULT XStoreEnumerateProductsQuery(  
         const XStoreProductQueryHandle productQueryHandle,  
         void* context,  
         XStoreProductQueryCallback* callback  
)  
```  
  
### Parameters  
  
*productQueryHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreProductQueryHandle  
  
The handle of the query to enumerate the results of. XStoreProductQueryHandle is returned by [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md), [XStoreQueryProductForPackageResult.md](xstorequeryproductforpackageresult.md), [XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md), [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md), and [XStoreQueryProductsResult](xstorequeryproductsresult.md).  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Game defined context to pass to callback.  
  
*callback* &nbsp;&nbsp;\_In\_  
Type: [XStoreProductQueryCallback*](xstoreproductquerycallback.md)  
  
Game define callback to be called for each product.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This function is safe to call on a time-sensitive thread.
  
This function is used to enumerate products returned by a function that requests product information. Once you have called for the enumeration of products use the [XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md) function to check for further product information. If there is more product information to be read then use [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md) to read it. See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  
[XStoreQueryProductsResult](xstorequeryproductsresult.md)  
[XStoreProductQueryCallback](xstoreproductquerycallback.md)  
  