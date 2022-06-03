---
author: M-Stahl
title: XStoreReportConsumableFulfillmentAsync
description: Consumes the specified quantity of a consumable.
kindex: XStoreReportConsumableFulfillmentAsync
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreReportConsumableFulfillmentAsync  

Consumes the specified quantity of a consumable.  For more information see [Consumable-based ecosystems](../../../../commerce/fundamentals/xstore-consumable-based-ecosystems.md) for more information on implementing and using consumable products.

## Syntax  
  
```cpp
HRESULT XStoreReportConsumableFulfillmentAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* storeProductId,  
         uint32_t quantity,  
         GUID trackingId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*storeProductId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Store ID of the consumable add-on that you want to report as fulfilled.  
  
*quantity* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of units of the consumable add-on that you want to report as fulfilled. For a Store-managed consumable (that is, a consumable where Microsoft keeps track of the balance), specify the number of units that have been consumed. For a game-managed consumable (that is, a consumable where the developer keeps track of the balance), specify 1.  
  
*trackingId* &nbsp;&nbsp;\_In\_  
Type: GUID  
  
A developer-supplied GUID that identifies the specific transaction that the fulfillment operation is associated with for tracking purposes.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    

## Remarks  
  
To retrieve the result of this function call [XStoreReportConsumableFulfillmentResult](xstorereportconsumablefulfillmentresult.md) after calling this function.  
  
The following code snippet shows an example of using a quantity of a consumable.  
  
```cpp
void CALLBACK ReportConsumableFulfillmentCallback(XAsyncBlock* asyncBlock)
{
    XStoreConsumableResult result{};
    HRESULT hr = XStoreReportConsumableFulfillmentResult(
        asyncBlock,
        &result);

    if (FAILED(hr))
    {
        printf("Failed retrieve the consumable balance remaining: 0x%x\r\n", hr);
        return;
    }

    printf("quantity: %d\r\n", result.quantity);
}

void ReportConsumableFulfillment(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* storeId, uint32_t quantity, GUID trackingId)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = ReportConsumableFulfillmentCallback;

    HRESULT hr = XStoreReportConsumableFulfillmentAsync(
        storeContextHandle,
        storeId,
        quantity,
        trackingId,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to report consumable fulfillment: 0x%x\r\n", hr);
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
[Consumable-based ecosystems](../../../../commerce/fundamentals/xstore-consumable-based-ecosystems.md)
[XStoreReportConsumableFulfillmentResult](xstorereportconsumablefulfillmentresult.md)  
  
  