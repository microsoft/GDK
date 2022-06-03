---
author: M-Stahl
title: XStoreQueryProductForCurrentGameAsync
description: Provides store product information for the currently running game, its skus and availabilities, and other metadata.
kindex: XStoreQueryProductForCurrentGameAsync
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryProductForCurrentGameAsync  
  
Provides store product information for the currently running game, its skus and availabilities, and other metadata.   

## Syntax  
  
```cpp
HRESULT XStoreQueryProductForCurrentGameAsync(  
         const XStoreContextHandle storeContextHandle,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the store product information as well as the execution result of this function call [XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md) after calling this function.
  
The following code snippet shows an example of retrieving store product information for the currently running game.  
  
```cpp
void CALLBACK QueryProductForCurrentGameCallback(XAsyncBlock* asyncBlock)
{
    XStoreProductQueryHandle queryHandle = nullptr;

    HRESULT hr = XStoreQueryProductForCurrentGameResult(
        asyncBlock,
        &queryHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the product query handle: 0x%x\r\n", hr);
        return;
    }

    XTaskQueueHandle taskQueueHandle = reinterpret_cast<XTaskQueueHandle>(asyncBlock->context);
    //Use store product informaion provided in query. 
}

void QueryProductForCurrentGame(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryProductForCurrentGameCallback;

    HRESULT hr = XStoreQueryProductForCurrentGameAsync(
        storeContextHandle,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get product for current game: 0x%x\r\n", hr);
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
[XStoreQueryProductForCurrentGameResult](xstorequeryproductforcurrentgameresult.md)  
[XStoreQueryAssociatedProductsAsync](xstorequeryassociatedproductsasync.md)  
[XStoreQueryEntitledProductsAsync](xstorequeryentitledproductsasync.md)  
[XStoreQueryProductsAsync](xstorequeryproductsasync.md)  
[XStoreQueryProductForCurrentGameAsync](xstorequeryproductforcurrentgameasync.md)  
[XStoreQueryProductForPackageAsync](xstorequeryproductforpackageasync.md)  

  
  