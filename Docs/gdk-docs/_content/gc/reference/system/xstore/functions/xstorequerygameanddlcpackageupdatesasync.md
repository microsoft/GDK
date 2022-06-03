---
author: M-Stahl
title: XStoreQueryGameAndDlcPackageUpdatesAsync
description: Gets game and optional updates for the current package.
kindex: XStoreQueryGameAndDlcPackageUpdatesAsync
ms.author: shanede
ms.topic: reference
edited: 07/22/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryGameAndDlcPackageUpdatesAsync  
  
Retrieves a list of available updates for the game's package and any associated DLC packages that can then be used to download and install these updates.
This is intended to only be used on PC.
On console, update checking and applying is handled by the system, and games will not be able to launch if an update is available.

## Syntax  
  
```cpp
HRESULT XStoreQueryGameAndDlcPackageUpdatesAsync(  
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
  
To retrieve the list of available updates as well as the execution result of this function call [XStoreQueryGameAndDlcPackageUpdatesResult](xstorequerygameanddlcpackageupdatesresult.md) after calling this function. To get the number of updates to retrieve call [XStoreQueryGameAndDlcPackageUpdatesResultCount](xstorequerygameanddlcpackageupdatesresultcount.md) after calling this function. The result count function is important as it will allow you to determine the appropriate size of array to pass to the result function.
  
The following code snippet shows an example of retrieving game and optional updates for the current package.  
  
```cpp
struct UpdateContext
{
    XStoreContextHandle storeContextHandle;
    XTaskQueueHandle taskQueueHandle;
    bool downloadOnly;
};

void CALLBACK DownloadAndInstallPackageUpdatesCallback(XAsyncBlock* asyncBlock)
{
    HRESULT hr = XStoreDownloadAndInstallPackageUpdatesResult(asyncBlock);

    if (FAILED(hr))
    {
        printf("Failed download and install package updates: 0x%x\r\n", hr);
        return;
    }
}

void CALLBACK DownloadPackageUpdatesCallback(XAsyncBlock* asyncBlock)
{
    HRESULT hr = XStoreDownloadPackageUpdatesResult(asyncBlock);

    if (FAILED(hr))
    {
        printf("Failed download package updates: 0x%x\r\n", hr);
        return;
    }
}

void CALLBACK QueryGameAndDlcPackageUpdatesCallback(XAsyncBlock* asyncBlock)
{
    UpdateContext* updateContext = reinterpret_cast<UpdateContext*>(asyncBlock->context);
    uint32_t count;

    HRESULT hr = XStoreQueryGameAndDlcPackageUpdatesResultCount(
        asyncBlock,
        &count);

    if (FAILED(hr))
    {
        printf("Failed retrieve the game and dlc update count: 0x%x\r\n", hr);
        delete updateContext;
        return;
    }

    printf("Number of updates: %d", count);

    if (count > 0)
    {
        XStorePackageUpdate* updates = new XStorePackageUpdate[count];
        hr = XStoreQueryGameAndDlcPackageUpdatesResult(
            asyncBlock,
            count,
            &updates);

        if (FAILED(hr))
        {
            delete[] updates;
            delete updateContext;
            printf("Failed retrieve the game and dlc updates: 0x%x\r\n", hr);
            return;
        }

        auto packageIdentifiers = new char[count][XPACKAGE_IDENTIFIER_MAX_LENGTH];
        for (uint32_t index = 0; index < count; index++)
        {
            printf("packageIdentifier: %s\r\n", updates[index].packageIdentifier);
            printf("isMandatory      : %s\r\n", updates[index].isMandatory ? "true" : "false");

            memcpy(&packageIdentifiers[index], updates[index].packageIdentifier, XPACKAGE_IDENTIFIER_MAX_LENGTH);
        }

        delete[] updates;

        auto downloadAsyncBlock = std::make_unique<XAsyncBlock>();
        ZeroMemory(downloadAsyncBlock.get(), sizeof(*downloadAsyncBlock));
        downloadAsyncBlock->queue = updateContext->taskQueueHandle;
        downloadAsyncBlock->context = updateContext;

        if (updateContext->downloadOnly)
        {
            // NOTE: This can be used instead to only perform the download.
            // This is helpful if you wish to download in the background
            // while the player continues to play. Once the download is completed,
            // you could then warn the user and call XStoreDownloadAndInstallPackageUpdatesAsync
            // to trigger the game to update which may close the game.

            downloadAsyncBlock->callback = DownloadPackageUpdatesCallback;
            hr = XStoreDownloadPackageUpdatesAsync(
                updateContext->storeContextHandle,
                (const char**)(&packageIdentifiers[0]),
                count,
                downloadAsyncBlock.get());

            if (FAILED(hr))
            {
                delete updateContext;
                delete[] packageIdentifiers;
                printf("Failed start download: 0x%x\r\n", hr);
                return;
            }
        }
        else
        {
            downloadAsyncBlock->callback = DownloadAndInstallPackageUpdatesCallback;
            hr = XStoreDownloadAndInstallPackageUpdatesAsync(
                updateContext->storeContextHandle,
                (const char**)(&packageIdentifiers[0]),
                count,
                downloadAsyncBlock.get());

            if (FAILED(hr))
            {
                delete updateContext;
                delete[] packageIdentifiers;
                printf("Failed start download and install: 0x%x\r\n", hr);
                return;
            }
        }

        delete[] packageIdentifiers;
    }
    else
    {
        delete updateContext;
    }
}

void QueryGameAndDlcPackageUpdates(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, bool downloadOnly)
{
    UpdateContext* updateContext = new UpdateContext;
    updateContext->storeContextHandle = storeContextHandle;
    updateContext->taskQueueHandle = taskQueueHandle;
    updateContext->downloadOnly = downloadOnly;

    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = updateContext;
    asyncBlock->callback = QueryGameAndDlcPackageUpdatesCallback;

    HRESULT hr = XStoreQueryGameAndDlcPackageUpdatesAsync(
        storeContextHandle,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to game and DLC updates: 0x%x\r\n", hr);
        delete updateContext;
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
[XStoreQueryGameAndDlcPackageUpdatesResult](xstorequerygameanddlcpackageupdatesresult.md)  
[XStoreQueryGameAndDlcPackageUpdatesResultCount](xstorequerygameanddlcpackageupdatesresultcount.md)  