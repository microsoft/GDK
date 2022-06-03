---
author: M-Stahl
title: XStoreProductsQueryNextPageResult
description: Gets the next page of results from a product query.
kindex: XStoreProductsQueryNextPageResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreProductsQueryNextPageResult  
  
Gets the next page of results from a product query.  

## Syntax  
  
```cpp
HRESULT XStoreProductsQueryNextPageResult(  
         XAsyncBlock* async,  
         XStoreProductQueryHandle* productQueryHandle  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md) or [XStoreQueryProductForPackageResult.md](xstorequeryproductforpackageresult.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*productQueryHandle* &nbsp;&nbsp;\_Out\_  
Type: XStoreProductQueryHandle*  
  
On return contains a query handle pointing to the next page of the query. The returned query handle is used to keep track of the current page of results for the query and should be used in the next call to [XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md) and [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md).  
  
### Return value
Type: HRESULT
  
S_OK on success; otherwise, returns an error code.  
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md), as well as the next page of query results that was called for if the execution was successful. As such, this function should be called after [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md) has been called, usually in the context of a callback function. See [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md)  
[XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md)  
  
  