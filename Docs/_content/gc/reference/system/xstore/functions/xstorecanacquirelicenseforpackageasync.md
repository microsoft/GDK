---
author: M-Stahl
title: XStoreCanAcquireLicenseForPackageAsync
description: Retrieves a preview license for DLC.
kindex: XStoreCanAcquireLicenseForPackageAsync
ms.author: shanede
ms.topic: reference
edited: 07/21/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanAcquireLicenseForPackageAsync
  
Retrieves a preview license for DLC, i.e. Durables with package.
This allows the game to see if the packages is licensable, but without actually acquiring the license.
If using the restrictive licensing option, acquiring the license would terminate the license on another device that may already have the license checked out.  
  
## Syntax  
  
```cpp
HRESULT XStoreCanAcquireLicenseForPackageAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* packageIdentifier,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
A string that uniquely identifies a store package. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done.
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results.
See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  

To retrieve the preview license as well as the execution result of this function call [XStoreCanAcquireLicenseForPackageResult](xstorecanacquirelicenseforpackageresult.md) after calling this function.
This function only checks whether or not a package license can be acquired.
In order to acquire a license for a package call [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md).
  
The code snippet below shows an example of using the following APIs.  
  
* [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md)
* [XStoreCanAcquireLicenseForPackageResult](xstorecanacquirelicenseforpackageresult.md)
  
```cpp
void CALLBACK CanAcquireLicenseForPackageCallback(XAsyncBlock* asyncBlock)
{
    XStoreCanAcquireLicenseResult canAcquireLicenseResult{};

    HRESULT hr = XStoreCanAcquireLicenseForPackageResult(
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

void CanAcquireLicenseForPackage(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* packageIdentifier)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = CanAcquireLicenseForPackageCallback;

    HRESULT hr = XStoreCanAcquireLicenseForPackageAsync(
        storeContextHandle,
        packageIdentifier,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get preview license for package: 0x%x\r\n", hr);
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
[XStoreCanAcquireLicenseForPackageResult](xstorecanacquirelicenseforpackageresult.md)  
[XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md)
