---
author: M-Stahl
title: XStoreShowRedeemTokenUIAsync
description: Triggers a token redemption for the current user for a specified token.
kindex: XStoreShowRedeemTokenUIAsync
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowRedeemTokenUIAsync  

Triggers a token redemption for the current user for a specified token.  

## Syntax  
  
```cpp
HRESULT XStoreShowRedeemTokenUIAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* token,  
         const char** allowedStoreIds,  
         size_t allowedStoreIdsCount,  
         bool disallowCsvRedemption,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*token* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The token to redeem. This value cannot be empty or null, if you want to bring up the UI without providing a code to pre-populate in the UI pass in a single space " ". 
  
*allowedStoreIds* &nbsp;&nbsp;\_In\_z\_count\_(allowedStoreIdsCount)  
Type: char**  
  
Allows you to restrict the 5x5 codes to only work with specific products.    
  
*allowedStoreIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of elements in **allowedStoreIds**.  
  
*disallowCsvRedemption* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Prevents CSV (giftcard/money style 5x5s) from being redeemed.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  
To retrieve the execution result of this function call [XStoreShowRedeemTokenUIResult](xstoreshowredeemtokenuiresult.md) after calling this function.  
  
The following code snippet shows an example of launching the token redemption UI.  
  
```cpp
void CALLBACK ShowRedeemTokenUICallback(XAsyncBlock* asyncBlock)
{
    HRESULT hr = XStoreShowRedeemTokenUIResult(asyncBlock);

    if (FAILED(hr))
    {
        printf("Failed redeem token: 0x%x\r\n", hr);
        return;
    }
}

void ShowRedeemTokenUI(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* token)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = ShowRedeemTokenUICallback;

    HRESULT hr = XStoreShowRedeemTokenUIAsync(
        storeContextHandle,
        token,
        nullptr,    // Can restrict to specific store IDs
        0,
        false,      // Can prevent CSV (cash gift cards)
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to request redeem token: 0x%x\r\n", hr);
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
[XStoreShowRedeemTokenUIResult](xstoreshowredeemtokenuiresult.md)  
  
  