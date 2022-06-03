---
author: M-Stahl
title: XStoreProductsQueryNextPageAsync
description: Gets the next page of query results.
kindex: XStoreProductsQueryNextPageAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProductsQueryNextPageAsync  
  
Gets the next page of query results.  

## Syntax  
  
```cpp
HRESULT XStoreProductsQueryNextPageAsync(  
         const XStoreProductQueryHandle productQueryHandle,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*productQueryHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreProductQueryHandle  
  
The handle to the query to check for more pages. On the first call to XStoreProductsQueryHasMorePages, this will be the XStoreProductQueryHandle returned by [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md), [XStoreQueryProductForPackageResult.md](xstorequeryproductforpackageresult.md), [XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md), [XStoreQueryProductsAsync](xstorequeryproductsasync.md), or [XStoreQueryProductsResult](xstorequeryproductsresult.md). On subsequent calls, the query handle returned by [XStoreProductsQueryNextPageResult](xstoreproductsquerynextpageresult.md) should be used.
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This function is used to query for additional product information after a product query has been enumerated with [XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md). Before calling this function you should check for the existence of additional product query information by calling [XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md). To retrieve the next page of query results as well as the execution result of this function call [XStoreProductsQueryNextPageResult](xstoreproductsquerynextpageresult.md) after calling this function. See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreProductsQueryNextPageResult](xstoreproductsquerynextpageresult.md)  
[XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md)  
[XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md)  
  