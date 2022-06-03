---
author: M-Stahl
title: XStoreQueryProductsAsync
description: Returns listing information for the specified products that are associated with the current game, regardless of whether the products are currently available for purchase within the current game.
kindex: XStoreQueryProductsAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryProductsAsync  
  
Returns listing information for the specified products that are associated with the current game, regardless of whether the products are currently available for purchase within the current game.  

## Syntax  
  
```cpp
HRESULT XStoreQueryProductsAsync(  
         const XStoreContextHandle storeContextHandle,  
         XStoreProductKind productKinds,  
         const char** storeIds,  
         size_t storeIdsCount,  
         const char** actionFilters,  
         size_t actionFiltersCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*productKinds* &nbsp;&nbsp;\_In\_  
Type: [XStoreProductKind](../enums/xstoreproductkind.md)  
  
The types of products to return.    
  
*storeIds* &nbsp;&nbsp;\_In\_z\_count\_(storeIdsCount)  
Type: char**  
  
The IDs for the products to retrieve.  
  
*storeIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of IDs in **storeIds**.  
  
*actionFilters* &nbsp;&nbsp;\_In\_opt\_z\_count\_(actionFiltersCount)  
Type: char**  
  
Restricts the results by some action stored in the product document. By default, this API returns all products, even if they are not purchasable, but you can restrict this to "Purchase" if you only want purchasable, or "License" if you only want licensable. Other action filters include "Fulfill", "Browse", "Curate", "Details", and "Redeem". 
  
*actionFiltersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of filters in **actionFilters**.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the listing information as well as the execution result of this function call [XStoreQueryProductsResult](xstorequeryproductsresult.md) after calling this function.  
  
To retrieve info for all the products that can currently be purchased from within the current game, use the [XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md) method instead.  
  
The following code snippet shows an example of retrieving listing information for the specified products that are associated with the current game.  
  
```cpp

void ProcessResults(XStoreProductQueryHandle queryHandle, XTaskQueueHandle taskQueueHandle)
{
    HRESULT hr = XStoreEnumerateProductsQuery(
        queryHandle,
        nullptr,
        EnumerateProductsQueryCallback);

    if (FAILED(hr))
    {
        printf("Failed enumerate the product query handle: 0x%x\r\n", hr);
        XStoreCloseProductsQueryHandle(queryHandle);
        return;
    }

    bool hasMorePages = XStoreProductsQueryHasMorePages(queryHandle);
    if (hasMorePages)
    {
        auto asyncInner = std::make_unique<XAsyncBlock>();
        ZeroMemory(asyncInner.get(), sizeof(*asyncInner));
        asyncInner->queue = taskQueueHandle;
        asyncInner->callback = ProductsQueryNextPageCallback;

        hr = XStoreProductsQueryNextPageAsync(
            queryHandle,
            asyncInner.get());

        if (FAILED(hr))
        {
            printf("Failed to get next page of products: 0x%x\r\n", hr);
            XStoreCloseProductsQueryHandle(queryHandle);
            return;
        }
    }

    XStoreCloseProductsQueryHandle(queryHandle);
}

void CALLBACK QueryProductsCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreQueryProductsResult(
        asyncBlock,
        &queryHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the product query handle: 0x%x\r\n", hr);
        return;
    }

    XTaskQueueHandle taskQueueHandle = reinterpret_cast<XTaskQueueHandle>(asyncBlock->context);
    ProcessResults(queryHandle, taskQueueHandle);
}

void QueryProducts(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryProductsCallback;

    XStoreProductKind allProductKinds =
        XStoreProductKind::Consumable |
        XStoreProductKind::Durable |
        XStoreProductKind::Game |
        XStoreProductKind::Pass |
        XStoreProductKind::UnmanagedConsumable;

    const char* storeIds[] =
    {
        "9YYYYYYYYYYY",
        "9ZZZZZZZZZZZ",
    };

    // This is only needed if you want to restrict to items that are currently purchasable.
    // If you want items that have been sold in the past,
    // but are no longer available for purchase, then
    // pass in nullptr or an empty array for the actionFilters.
    const char* actionFilters[] =
    {
        "Purchase"
    };

    HRESULT hr = XStoreQueryProductsAsync(
        storeContextHandle,
        allProductKinds,
        storeIds,
        ARRAYSIZE(storeIds),
        actionFilters,
        ARRAYSIZE(actionFilters),
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get products: 0x%x\r\n", hr);
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
[XStoreQueryProductsResult](xstorequeryproductsresult.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  
[XStoreQueryEntitledProductsAsync](xstorequeryentitledproductsasync.md)  
[XStoreQueryProductsAsync](xstorequeryproductsasync.md)  
[XStoreQueryProductForCurrentGameAsync](xstorequeryproductforcurrentgameasync.md)  
[XStoreQueryProductForPackageAsync](xstorequeryproductforpackageasync.md)  

  
  