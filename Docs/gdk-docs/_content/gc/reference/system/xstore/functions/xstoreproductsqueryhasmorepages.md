---
author: M-Stahl
title: XStoreProductsQueryHasMorePages
description: Checks if there are more results pages for the specified query.
kindex: XStoreProductsQueryHasMorePages
ms.author: shanede
ms.topic: reference
edited: 07/22/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProductsQueryHasMorePages  
  
Checks if there are more results pages for the specified query.
This is essential to call for `XStoreQuery` APIs, especially those that are expected to return multiple results, such as [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md).

## Syntax  
  
```cpp
bool XStoreProductsQueryHasMorePages(  
         const XStoreProductQueryHandle productQueryHandle  
)  
```  
  
### Parameters  
  
*productQueryHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreProductQueryHandle  
  
The handle to the query to check for more pages. On the first call to XStoreProductsQueryHasMorePages, this will be the XStoreProductQueryHandle returned by [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md), [XStoreQueryProductForPackageResult](xstorequeryproductforpackageresult.md), [XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md),  or [XStoreQueryProductsResult](xstorequeryproductsresult.md).
On subsequent calls, the query handle returned by [XStoreProductsQueryNextPageResult](xstoreproductsquerynextpageresult.md) should be used.
  
### Return value
Type: bool
  
Returns true if there are more results pages to display.  
  
## Remarks  
  
This function is used to check to see if a product query has additional pages of product information.
It is called after a product query has been enumerated with [XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md).
If this function returns true there is more product query information to be read.
Call [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md) to read additional product query information.
See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md)  
[XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  