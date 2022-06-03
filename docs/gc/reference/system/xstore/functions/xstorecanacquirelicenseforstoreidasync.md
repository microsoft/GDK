---
author: M-Stahl
title: XStoreCanAcquireLicenseForStoreIdAsync
description: Retrieves a preview license for content.
kindex: XStoreCanAcquireLicenseForStoreIdAsync
ms.author: shanede
ms.topic: reference
edited: 07/12/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanAcquireLicenseForStoreIdAsync

Retrieves a preview license for licensable content, including Durables with and without package, as well as content on disc that is currently inserted.
This allows the game to see if the product is licensable, but without actually acquiring the license.
If using the restrictive licensing option, acquiring the license would terminate the license on another device that may already have the license checked out.  

## Syntax  
  
```cpp
HRESULT XStoreCanAcquireLicenseForStoreIdAsync(  
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
  
StoreID for the product to check
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done.
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results.
See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
**XStoreCanAcquireLicenseForStoreIdAsync** provides the ability for a game to determine if the user could acquire a license for a particular piece of content without actually acquiring that license and using up that user's concurrency slot.
This is not used for the currently running game (since it has a license already), but to determine if the user owns other games from the same publisher, either to up-sell or to provide special benefits to loyal fans.
For example: this could be used by a racing game to determine whether to give bonus cars to users who owned prior versions of the game (either digitally or from disc that is currently inserted).
This function is also used to determine whether or not the game should show content in its in game store based on whether or not the user already owns some content.
  
To retrieve the preview license as well as the execution result of this function call [XStoreCanAcquireLicenseForStoreIdResult](xstorecanacquirelicenseforstoreidresult.md) after calling this function.  

The code snippet below shows an example of using the following APIs.  
  
* **XStoreCanAcquireLicenseForStoreIdAsync**
* [XStoreCanAcquireLicenseForStoreIdResult](xstorecanacquirelicenseforstoreidresult.md)  
  
```cpp  
void CALLBACK CanAcquireLicenseForStoreIdCallback(XAsyncBlock* asyncBlock)
{
    XStoreCanAcquireLicenseResult canAcquireLicenseResult{};

    HRESULT hr = XStoreCanAcquireLicenseForStoreIdResult(
        asyncBlock,
        &canAcquireLicenseResult);

    if (FAILED(hr))
    {
        printf("Failed retrieve the license result: 0x%x\r\n", hr);
        return;
    }

    printf("status       : %d\r\n", canAcquireLicenseResult.status);
    printf("licensableSku: %s\r\n", canAcquireLicenseResult.licensableSku);
}

void CanAcquireLicenseForStoreId(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* storeId)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = CanAcquireLicenseForStoreIdCallback;

    HRESULT hr = XStoreCanAcquireLicenseForStoreIdAsync(
        storeContextHandle,
        storeId,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get preview license for store ID: 0x%x\r\n", hr);
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
[XStoreCanAcquireLicenseForStoreIdResult](xstorecanacquirelicenseforstoreidresult.md)