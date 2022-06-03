---
author: M-Stahl
title: XStoreDownloadAndInstallPackagesAsync
description: Downloads and installs the specified store packages.
kindex: XStoreDownloadAndInstallPackagesAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDownloadAndInstallPackagesAsync  

Downloads and installs the specified store packages.  

## Syntax  
  
```cpp
HRESULT XStoreDownloadAndInstallPackagesAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char** storeIds,  
         size_t storeIdsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).  
  
*storeIds* &nbsp;&nbsp;\_In\_z\_count\_(storeIdsCount)  
Type: char**  
  
List of package identifier strings.
A package identifier uniquely identifies a package from the Microsoft store. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  
  
*storeIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of IDs in **storeIds**.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the download and install result of this function call [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md) after calling this function. To retrieve the number of items downloaded and installed call [XStoreDownloadAndInstallPackagesResultCount](xstoredownloadandinstallpackagesresultcount.md) after calling this function. The result count function is important as it will allow you to determine the appropriate size of array to pass to the result function.

The following code snippet shows an example of downloading and installing store packages.  

```cpp
  
void CALLBACK DownloadAndInstallPackagesCallback(XAsyncBlock* asyncBlock)
{
    uint32_t count;

    HRESULT hr = XStoreDownloadAndInstallPackagesResultCount(
        asyncBlock,
        &count);

    if (FAILED(hr))
    {
        printf("Failed retrieve the installing packages count: 0x%x\r\n", hr);
        return;
    }

    printf("Number of updates: %d", count);

    auto packageIdentifiers = new char[count][XPACKAGE_IDENTIFIER_MAX_LENGTH];
    hr = XStoreDownloadAndInstallPackagesResult(
        asyncBlock,
        count,
        &packageIdentifiers[0]);

    if (FAILED(hr))
    {
        delete[] packageIdentifiers;
        printf("Failed retrieve the installing packages results: 0x%x\r\n", hr);
        return;
    }

    for (uint32_t index = 0; index < count; index++)
    {
        printf("packageIdentifier: %s\r\n", packageIdentifiers[index]);
    }

    delete[] packageIdentifiers;
}

void DownloadAndInstallPackages(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char** storeIds, size_t storeIdsCount)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = DownloadAndInstallPackagesCallback;

    HRESULT hr = XStoreDownloadAndInstallPackagesAsync(
        storeContextHandle,
        storeIds,
        storeIdsCount,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to start download and install: 0x%x\r\n", hr);
        return;
    }
}
```
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md)  
[XStoreDownloadAndInstallPackagesResultCount](xstoredownloadandinstallpackagesresultcount.md)  
  