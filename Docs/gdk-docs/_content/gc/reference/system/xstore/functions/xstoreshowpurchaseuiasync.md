---
author: M-Stahl
title: XStoreShowPurchaseUIAsync
description: Allows the game to request a purchase for a particular store product.
kindex: XStoreShowPurchaseUIAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowPurchaseUIAsync  

Begins the purchase UI overlay for the specified product.

## Syntax  
  
```cpp
HRESULT XStoreShowPurchaseUIAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* storeId,  
         const char* name,  
         const char* extendedJsonData,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*storeId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
ID for the product to purchase.  
  
*name* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Name of the product to purchase.  
  
*extendedJsonData* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
A json blob that is handed to the purchase flow. Allows for insertion of custom campaign IDs, so you can track how the purchase started.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  **Note** This operation does not trigger the download or installation of the items after an expected purchase. If you wish to download and install this content, it is recommended to call [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) after a successful purchase. No additional prompts will be given to the user.  
  
To retrieve the result of this function call [XStoreShowPurchaseUIResult](xstoreshowpurchaseuiresult.md) after calling this function. This function should only be called when the user has chosen to purchase something, and will cause the system to present a modal purchase dialog that handles payment information and user confirmation out-of-process.  

The following code snippet shows an example of requesting a purchase for a particular store product.  
  
```cpp
void CALLBACK ShowPurchaseUICallback(XAsyncBlock* asyncBlock)
{
    HRESULT hr = XStoreShowPurchaseUIResult(asyncBlock);

    if (FAILED(hr))
    {
        printf("Failed the purchase: 0x%x\r\n", hr);
        return;
    }
}

void ShowPurchaseUI(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* storeId)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = ShowPurchaseUICallback;

    HRESULT hr = XStoreShowPurchaseUIAsync(
        storeContextHandle,
        storeId,
        nullptr,    // Can be used to override the title bar text
        nullptr,    // Can be used to provide extra details to purchase
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to purchase: 0x%x\r\n", hr);
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
[XStoreShowPurchaseUIResult](xstoreshowpurchaseuiresult.md)  
  
  