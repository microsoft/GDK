---
author: M-Stahl
title: XStoreAcquireLicenseForPackageAsync
description: Aquires a license for a game's DLC that the user is entitled to use.
kindex: XStoreAcquireLicenseForPackageAsync
ms.author: shanede
ms.topic: reference
edited: 7/12/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreAcquireLicenseForPackageAsync

Acquires a license to an installed DLC package (Durable with a package product type) for the current game that the user is entitled to use.

[XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md) can be used to monitor if the license obtained from this API is lost.
> [!NOTE]
> This API will not work with Durable add-ons without a package.
To get the license for Durables without a package use [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).

## Syntax  
  
```cpp
HRESULT XStoreAcquireLicenseForPackageAsync(  
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
  
A string that uniquely identifies a store package. This is typically returned as part of an [XPackageEnumeratePackage](../../xpackage/functions/xpackageenumeratepackages.md) operation. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.  


| Error code| Description |
| --- | --- |
| 0x89245208 `E_GAMEPACKAGE_NO_PACKAGE_IDENTIFIER` | Package for this product is not installed, or this is being called on a Durable without a package type (use [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md) instead).|

## Remarks  
  
To retrieve the package license as well as the execution result of this function call [XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md) after calling this function.
If you would like to check if a package can be licensed then call [XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md).
After acquiring a license you must check if it is valid by calling [XStoreIsLicenseValid](xstoreislicensevalid.md).

The code snippet below shows an example of using the following APIs.  
  
* [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md)
* [XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md)
* [XStoreIsLicenseValid](xstoreislicensevalid.md)
* [XStoreCloseLicenseHandle](xstorecloselicensehandle.md)
* [XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md)
* [XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md)
  
```cpp
void CALLBACK PackageLicenseLostCallback(void* context)
{
    printf("**** License Lost ****\r\n");
}

void CALLBACK AcquireLicenseForPackageCallback(XAsyncBlock* asyncBlock)
{
    XStoreLicenseHandle licenseHandle = nullptr;

    HRESULT hr = XStoreAcquireLicenseForPackageResult(
        asyncBlock,
        &licenseHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the license handle: 0x%x\r\n", hr);
        return;
    }

    bool isValid = XStoreIsLicenseValid(licenseHandle);
    printf("isValid: %s\r\n", isValid ? "true" : "false");

    if (isValid)
    {
        XTaskQueueHandle taskQueueHandle = reinterpret_cast<XTaskQueueHandle>(asyncBlock->context);
        XTaskQueueRegistrationToken token = { 0 };

        //  Todo: Save the licenseHandle to hold onto it for the life of the app or until you unload the package.
        // This allows us to be notified if the license becomes invalid and we need to handle unloading the content.
        hr = XStoreRegisterPackageLicenseLost(
            licenseHandle,
            taskQueueHandle,
            nullptr,
            PackageLicenseLostCallback,
            &token);

        if (FAILED(hr))
        {
            XStoreCloseLicenseHandle(licenseHandle);
            printf("Failed register license lost callback: 0x%x\r\n", hr);
            return;
        }

        // This would normally go in your cleanup code when releasing the license
        hr = XStoreUnregisterPackageLicenseLost(
            licenseHandle,
            token,
            true);

        if (FAILED(hr))
        {

            // This would normally go in your cleanup code when releasing the license
            XStoreCloseLicenseHandle(licenseHandle);
            printf("Failed unregister license lost callback: 0x%x\r\n", hr);
            return;
        }
    }

    XStoreCloseLicenseHandle(licenseHandle);
}

void AcquireLicenseForPackage(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* packageIdentifier)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = AcquireLicenseForPackageCallback;

    HRESULT hr = XStoreAcquireLicenseForPackageAsync(
        storeContextHandle,
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
[XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md)  
[XStoreAcquireLicenseForPackageResult](xstoreacquirelicenseforpackageresult.md)  
[XStoreIsLicenseValid](xstoreislicensevalid.md)  
[XStoreCloseLicenseHandle](xstorecloselicensehandle.md)  
[XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md)  
[XStoreUnregisterPackageLicenseLost](xstoreunregisterpackagelicenselost.md)  
[XStoreCanAcquireLicenseForPackageAsync](xstorecanacquirelicenseforpackageasync.md)  
[XStoreCanAcquireLicenseForPackageResult](xstorecanacquirelicenseforpackageresult.md)