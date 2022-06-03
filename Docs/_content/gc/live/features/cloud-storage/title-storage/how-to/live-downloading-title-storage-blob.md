---
title: Downloading a blob from Title Storage
description: Demonstrates how to download a blob from Xbox Live Title Storage.
kindex: Downloading a blob from Title Storage
ms.topic: conceptual
ms.assetid: f424aca1-e671-4e31-84c6-098fda4a9558
ms.localizationpriority: medium
author: joannaleecy
ms.author: heba
ms.date: 11/15/2019
edited: 02/01/2021
security: public
---

# Downloading a blob from Title Storage

This topic demonstrates how to download a blob from Xbox Live Title Storage by using the following flat C code example.

## Notes about XblTitleStorageDownloadBlobAsync parameters

- The buffer that you provide to store the downloaded blob data must be large enough to store the blob that's being downloaded. If you need to, you can retrieve the length that's required for the buffer by getting the blob metadata.

- This API returns E_NOT_SUFFICIENT_BUFFER (0x8007007A) if `blobBuffer` doesn't have enough capacity to hold the blob data.

- To use the default size, pass 0 for `preferredDownloadBlockSize`.

#### Flat C



```cpp
std::unique_ptr<std::vector<uint8_t>> downloadBlobBuffer = std::make_unique<std::vector<uint8_t>>(blobMetadata.length);

auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = downloadBlobBuffer.get();
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };   // Take over ownership of XAsyncBlock*.
    std::unique_ptr<std::vector<uint8_t>> downloadBlobBuffer{ static_cast<std::vector<uint8_t>*>(asyncBlock->context) };
    HRESULT hr = XblTitleStorageDownloadBlobResult(asyncBlock, &blobMetadata);
};

HRESULT hr = XblTitleStorageDownloadBlobAsync(
    xboxLiveContext,
    blobMetadata,
    downloadBlobBuffer->data(),
    blobMetadata.length,
    XblTitleStorageETagMatchCondition::NotUsed,
    selectQuery.c_str(),   // Optional  .
    preferredDownloadBlockSize,   // Optional.
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release std::unique_ptr ownership of XAsyncBlock* because
    // the callback takes over ownership. If the call fails, however, std::unique_ptr keeps
    // ownership and deletes XAsyncBlock*.
    asyncBlock.release();
    downloadBlobBuffer.release();
}
```

## See also

[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  

[XblTitleStorageDownloadBlobAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragedownloadblobasync.md)  

[XblTitleStorageDownloadBlobResult](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragedownloadblobresult.md)  

[XblTitleStorageETagMatchCondition](../../../../../reference/live/xsapi-c/title_storage_c/enums/xbltitlestorageetagmatchcondition.md)  