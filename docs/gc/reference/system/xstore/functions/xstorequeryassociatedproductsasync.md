---
author: M-Stahl
title: XStoreQueryAssociatedProductsAsync
description: Gets store listing information for the products that can be purchased from within the current game.
kindex: XStoreQueryAssociatedProductsAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryAssociatedProductsAsync  
  
Gets store listing information for the products that can be purchased from within the current game.  

## Syntax  
  
```cpp
HRESULT XStoreQueryAssociatedProductsAsync(  
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
  
The type of products to return.
  
*maxItemsToRetrievePerPage* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of items to retrieve per page.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done.
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
To retrieve the store listing information as well as the execution result of this function call [XStoreQueryAssociatedProductsResult](xstorequeryassociatedproductsresult.md) after calling this function.
[XStoreQueryAssociatedProductsResult](xstorequeryassociatedproductsresult.md) contains a **XStoreProductQueryHandle** that will be enumerated by calling [XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md).
> [!IMPORTANT]
> 
A product query may be returned over multiple pages even if the number of results are less than `maxItemsToRetrievePerPage`. You **must** check for additional product entries and read it by calling [XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md) and [XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md) respectively.  

There is no way to know the number of products that will be returned by this query upfront.

This API will only return products that can be browsed within the Microsoft Store as well as any add-on products that do not have a store page as long as they are not expired.
Any product that is hidden, expired, or taken down from the store will not be returned in the results from this API.
If you need store info from such a product use the [XStoreQueryProductsAsync](xstorequeryproductsasync.md) passing in the product's StoreID.
  
The following code snippet shows an example of retrieving store listing information for the products that can be purchased from within the current game:
  
```cpp
bool CALLBACK EnumerateProductsQueryCallback(const XStoreProduct* product, void* context)
{
    printf("Product:\r\n");
    printf("\tstoreId    : %s\r\n", product->storeId);
    printf("\tproductKind: %s\r\n", product->productKind);

    // Return true to keep enumerating, false to stop
    return true;
}

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

void CALLBACK QueryAssociatedProductsCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreQueryAssociatedProductsResult(
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

void CALLBACK ProductsQueryNextPageCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreProductsQueryNextPageResult(
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

void QueryAssociatedProducts(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryAssociatedProductsCallback;

    XStoreProductKind allProductKinds =
        XStoreProductKind::Consumable |
        XStoreProductKind::Durable |
        XStoreProductKind::Game |
        XStoreProductKind::Pass |
        XStoreProductKind::UnmanagedConsumable;

    HRESULT hr = XStoreQueryAssociatedProductsAsync(
        storeContextHandle,
        allProductKinds,
        25,     // Max items per page
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get associated products: 0x%x\r\n", hr);
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
[XStoreQueryAssociatedProductsResult](xstorequeryassociatedproductsresult.md)  
[XStoreEnumerateProductsQuery](xstoreenumerateproductsquery.md)  
[XStoreProductsQueryHasMorePages](xstoreproductsqueryhasmorepages.md)  
[XStoreProductsQueryNextPageAsync](xstoreproductsquerynextpageasync.md)  
  