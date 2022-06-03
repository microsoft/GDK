---
title: Deleting a blob from Title Storage
description: Demonstrates how to delete a blob from Xbox Live Title Storage.
kindex: Deleting a blob from Title Storage
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: heba
ms.date: 11/15/2019
edited: 02/01/2021
security: public
---

# Deleting a blob from Title Storage

This topic demonstrates how to delete a blob from Xbox Live Title Storage by using the following flat C code example.

#### Flat C



```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };    // Take over ownership of XAsyncBlock*.
    HRESULT hr = XAsyncGetStatus(asyncBlock, false);
};

HRESULT hr = XblTitleStorageDeleteBlobAsync(
    xboxLiveContext,
    blobMetadata,
    deleteOnlyIfEtagMatches,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership
    // of XAsyncBlock* because the callback now takes ownership.
    // If the call fails, std::unique_ptr maintains ownership and deletes XAsyncBlock*.
    asyncBlock.release();
}
```

## See also

[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  

[XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  

[XblTitleStorageDeleteBlobAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragedeleteblobasync.md)  