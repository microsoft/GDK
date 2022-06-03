---
title: Getting quota information for a Title Storage service configuration
description: Demonstrates how to get quota information for a Xbox Live Title Storage service configuration.
kindex: Getting quota info for a Title Storage service configuration
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: heba
ms.date: 11/15/2019
edited: 02/01/2021
security: public
---

# Getting quota information for a Title Storage service configuration

This topic demonstrates how to get quota information for a specified service configuration and storage type in Xbox Live Title Storage by using the following flat C code example.
> [!NOTE]
> For `TrustedPlatform ` storage types, the request is made for the calling player's Xbox user ID.

#### Flat C



```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };   // Take over ownership of XAsyncBlock*.
    size_t usedBytes;
    size_t quotaBytes;
    HRESULT hr = XblTitleStorageGetQuotaResult(asyncBlock, &usedBytes, &quotaBytes);
};

HRESULT hr = XblTitleStorageGetQuotaAsync(
    xboxLiveContext,
    scid,
    storageType,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release  std::unique_ptr ownership of XAsyncBlock* because
    // the callback takes over ownership. If the call fails, however, std::unique_ptr keeps
    // ownership and deletes XAsyncBlock*.
    asyncBlock.release();
}
```

## See also

[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  

[XblTitleStorageGetQuotaAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragegetquotaasync.md)  

[XblTitleStorageGetQuotaResult](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragegetquotaresult.md)  