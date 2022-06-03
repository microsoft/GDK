---
author: M-Stahl
title: XStoreQueryConsumableBalanceRemainingAsync
description: Get the consumable balance remaining for the specified product ID.
kindex: XStoreQueryConsumableBalanceRemainingAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryConsumableBalanceRemainingAsync  
  
Get the consumable balance remaining for the specified product ID.  

## Syntax  
  
```cpp
HRESULT XStoreQueryConsumableBalanceRemainingAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* storeProductId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*storeProductId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The ID of the consumable to retrieve the balance for.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the remaining consumable balance as well as the execution result of this function call [XStoreQueryConsumableBalanceRemainingResult](xstorequeryconsumablebalanceremainingresult.md) after calling this function. [XStoreQueryConsumableBalanceRemainingResult](xstorequeryconsumablebalanceremainingresult.md) should be executed in the callback function for **XStoreQueryConsumableBalanceRemainingAsync**. The following code snippet shows an example of retrieving the consumable balance remaining for a specified product ID.  
  
```cpp
void CALLBACK QueryConsumableBalanceRemainingCallback(XAsyncBlock* asyncBlock)
{
    XStoreConsumableResult result{};
    HRESULT hr = XStoreQueryConsumableBalanceRemainingResult(
        asyncBlock,
        &result);

    if (FAILED(hr))
    {
        printf("Failed retrieve the consumable balance remaining: 0x%x\r\n", hr);
        return;
    }

    printf("quantity: %d\r\n", result.quantity);
}

void QueryConsumableBalanceRemaining(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* storeId)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryConsumableBalanceRemainingCallback;

    HRESULT hr = XStoreQueryConsumableBalanceRemainingAsync(
        storeContextHandle,
        storeId,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get consumable balance remaining: 0x%x\r\n", hr);
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
[XStoreQueryConsumableBalanceRemainingResult](xstorequeryconsumablebalanceremainingresult.md)  
[XStoreCreateContext](xstorecreatecontext.md)  