---
author: M-Stahl
title: XStoreQueryGameLicenseAsync
description: Retrieves information about the license that was acquired to allow the game to launch.
kindex: XStoreQueryGameLicenseAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryGameLicenseAsync  

Retrieves information about the license that was acquired to allow the app to launch.  

## Syntax  
  
```cpp
HRESULT XStoreQueryGameLicenseAsync(  
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
  
To retrieve the license information as well as the execution result of this function call [XStoreQueryGameLicenseResult](xstorequerygamelicenseresult.md) after calling this function. [XStoreQueryGameLicenseResult](xstorequerygamelicenseresult.md) should be called in the callback function for **XStoreQueryGameLicenseAsync**. The following code snippet shows an example of retrieving license information for the license that was acquired to allow the game to launch.  
  
```cpp
void CALLBACK GameLicenseCallback(XAsyncBlock* asyncBlock)
{
    XStoreGameLicense result{};

    HRESULT hr = XStoreQueryGameLicenseResult(
        asyncBlock,
        &result);

    if (FAILED(hr))
    {
        printf("Failed retrieve the game license result: 0x%x\r\n", hr);
        return;
    }

    printf("expirationDate        : %d\r\n", result.expirationDate);
    printf("isActive              : %s\r\n", result.isActive ? "true" : "false");
    printf("isDiscLicense         : %s\r\n", result.isDiscLicense ? "true" : "false");
    printf("isTrial               : %s\r\n", result.isTrial ? "true" : "false");
    printf("isTrialOwnedByThisUser: %s\r\n", result.isTrialOwnedByThisUser ? "true" : "false");
    printf("skuStoreId            : %s\r\n", result.skuStoreId);
    printf("trialTimeRemaining    : %d\r\n", result.trialTimeRemainingInSeconds);
    printf("trialUniqueId         : %s\r\n", result.trialUniqueId);
}

void QueryGameLicense(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->callback = GameLicenseCallback;

    HRESULT hr = XStoreQueryGameLicenseAsync(
        storeContextHandle,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get the game license: 0x%x\r\n", hr);
        return;
    }

    // Wait a while for the callbacks to run
    Sleep(1000);
}
```
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryGameLicenseResult](xstorequerygamelicenseresult.md)  
[XStoreCreateContext](xstorecreatecontext.md)  