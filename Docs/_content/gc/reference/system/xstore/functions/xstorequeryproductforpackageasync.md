---
author: M-Stahl
title: XStoreQueryProductForPackageAsync
description: Retrieves store product information for the specified package.
kindex: XStoreQueryProductForPackageAsync
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryProductForPackageAsync  
  
Retrieves store product information for the specified package.  

## Syntax  
  
```cpp
HRESULT XStoreQueryProductForPackageAsync(  
         const XStoreContextHandle storeContextHandle,  
         XStoreProductKind productKinds,  
         const char* packageIdentifier,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*productKinds* &nbsp;&nbsp;\_In\_  
Type: [XStoreProductKind](../enums/xstoreproductkind.md)  
  
The type of products to find.    
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
A string that uniquely identifies a store package. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the store product information as well as the execution result of this function call [XStoreQueryProductForPackageResult](xstorequeryproductforpackageresult.md) after calling this function.  
  
The following code snippet shows an example of retrieving product information for a package.  
  
```cpp
void CALLBACK QueryProductForPackageCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreQueryProductForPackageResult(
        asyncBlock,
        &queryHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the product query handle: 0x%x\r\n", hr);
        return;
    }

    XTaskQueueHandle taskQueueHandle = reinterpret_cast<XTaskQueueHandle>(asyncBlock->context);
    
    //Use result of query

}

void QueryProductForPackage(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* packageIdentifier)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryProductForPackageCallback;

    XStoreProductKind allProductKinds =
        XStoreProductKind::Consumable |
        XStoreProductKind::Durable |
        XStoreProductKind::Game |
        XStoreProductKind::Pass |
        XStoreProductKind::UnmanagedConsumable;

    HRESULT hr = XStoreQueryProductForPackageAsync(
        storeContextHandle,
        allProductKinds,
        packageIdentifier,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get product for package: 0x%x\r\n", hr);
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
[XStoreQueryProductForPackageResult](xstorequeryproductforpackageresult.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  
[XStoreQueryEntitledProductsAsync](xstorequeryentitledproductsasync.md)  
[XStoreQueryProductsAsync](xstorequeryproductsasync.md)  
[XStoreQueryProductForCurrentGameAsync](xstorequeryproductforcurrentgameasync.md)  
[XStoreQueryProductForPackageAsync](xstorequeryproductforpackageasync.md)  

  
  