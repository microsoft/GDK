---
author: M-Stahl
title: XStoreQueryEntitledProductsAsync
description: Provides the Store product information for all add-ons of the current game the user has purchased.
kindex: XStoreQueryEntitledProductsAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryEntitledProductsAsync  
  
Provides the store product information for all add-ons, DLC, and consumables related to the current game that the user has an entitlement to.

## Syntax  
  
```cpp
HRESULT XStoreQueryEntitledProductsAsync(  
         const XStoreContextHandle storeContextHandle,  
         XStoreProductKind productKinds,  
         uint32_t maxItemsToRetrievePerPage,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*productKinds* &nbsp;&nbsp;\_In\_  
Type: [XStoreProductKind](../enums/xstoreproductkind.md)  
  
The kind of products to query.  
  
*maxItemsToRetrievePerPage* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Maximum number of items to retrieve per page.
Passing more than 25 items per page will result in multiple service round trips being required for each page. 
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done.
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results.
See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
S_OK on success; otherwise, returns an error code.  
  
## Remarks  

To retrieve the store product information as well as the execution result of this function call [XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md) after calling this function.
[XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md) should be executed in the callback function for **XStoreQueryEntitledProductsAsync**.
> [!IMPORTANT]
> 
A product query may be returned over multiple pages even if the number of results are less than `maxItemsToRetrievePerPage`.
You **must** check for additional product entries and read it by calling [XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md) and [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md) respectively.  

There is no way to know the number of products that will be returned by this query upfront.

The following code snippet provides an example of retrieving store product information based on the users entitlements to related content of the current game.
  
```cpp
void CALLBACK QueryEntitledProductsCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreQueryEntitledProductsResult(
        asyncBlock,
        &queryHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the product query handle: 0x%x\r\n", hr);
        return;
    }

    XTaskQueueHandle taskQueueHandle = reinterpret_cast<XTaskQueueHandle>(asyncBlock->context);
    //Perform desired operations using the results. Make sure to check for more pages.
}

void QueryEntitledProducts(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryEntitledProductsCallback;

    XStoreProductKind allProductKinds =
        XStoreProductKind::Consumable |
        XStoreProductKind::Durable |
        XStoreProductKind::Game |
        XStoreProductKind::Pass |
        XStoreProductKind::UnmanagedConsumable;

    HRESULT hr = XStoreQueryEntitledProductsAsync(
        storeContextHandle,
        allProductKinds,
        25,     // Max items per page
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get user collection: 0x%x\r\n", hr);
        return;
    }

    // Wait a while for the callbacks to run
    Sleep(5000);
}


```
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryEntitledProductsResult](xstorequeryentitledproductsresult.md)
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  
[XStoreQueryEntitledProductsAsync](xstorequeryentitledproductsasync.md)  
[XStoreQueryProductsAsync](xstorequeryproductsasync.md)  
[XStoreQueryProductForCurrentGameAsync](xstorequeryproductforcurrentgameasync.md)  
[XStoreQueryProductForPackageAsync](xstorequeryproductforpackageasync.md)  

  
  