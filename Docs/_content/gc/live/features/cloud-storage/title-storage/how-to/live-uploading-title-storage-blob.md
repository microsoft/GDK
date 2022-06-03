---
title: Uploading a blob to Title Storage
description: Demonstrates how to upload a blob to Xbox Live Title Storage.
kindex: Uploading a blob to Title Storage
ms.topic: conceptual
ms.assetid: f424aca1-e671-4e31-84c6-098fda4a9558
ms.localizationpriority: medium
author: joannaleecy
ms.author: heba
ms.date: 11/15/2019
edited: 02/01/2021
security: public
---

# Uploading a blob to Title Storage

This topic demonstrates how to upload a blob to Xbox Live Title Storage by using the following flat C code example.

## Notes about XblTitleStorageUploadBlobAsync parameters

- The buffer that contains the blob data to upload must be available for the duration of the async operation. You shouldn't modify the buffer while an upload is in progress.

- This method uses a default size if you don't provide `preferredUploadBlockSize`, or if the default size isn't within the acceptable range. The minimum size is 1,024 bytes. The maximum size is 4,194,304 bytes. The default size is 262,144 bytes.

- Binary blobs are uploaded in multiple chunks of `preferredUploadBlockSize` if they exceed that size. In that case, we recommend that you use larger sizes. If time-outs  occur, you should retry the upload using a smaller size.

#### Flat C



```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = blobBuffer.get();
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };    // Take over ownership of XAsyncBlock*.
    std::unique_ptr<std::vector<uint8_t>> blobBuffer{ static_cast<std::vector<uint8_t>*>(asyncBlock->context) };
    HRESULT hr = XblTitleStorageUploadBlobResult(asyncBlock, &blobMetadata);
};

XblTitleStorageBlobMetadata blobMetadata{};
pal::strcpy(blobMetadata.displayName, displayName.size() + 1, displayName.c_str());
pal::strcpy(blobMetadata.serviceConfigurationId, XBL_SCID_LENGTH, scid);
pal::strcpy(blobMetadata.blobPath, blobPath.size() + 1, blobPath.c_str());
blobMetadata.storageType = storageType;
blobMetadata.blobType = blobType;
time(&blobMetadata.clientTimestamp);

HRESULT hr = XblTitleStorageUploadBlobAsync(
    xboxLiveContext,
    blobMetadata,
    reinterpret_cast<const uint8_t*>(blobBuffer->data()),
    blobBufferSize,
    eTagMatchCondition,
    preferredUploadBlockSize, //    Optional .
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release std::unique_ptr ownership of XAsyncBlock* because
    // the callback takes over ownership. If the call fails, however, std::unique_ptr keeps
    // ownership and deletes XAsyncBlock*.
    asyncBlock.release();
    blobBuffer.release();
}
```

## See also

[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  

[XblTitleStorageBlobMetadata](../../../../../reference/live/xsapi-c/title_storage_c/structs/xbltitlestorageblobmetadata.md)  

[XblTitleStorageUploadBlobAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageuploadblobasync.md)  

[XblTitleStorageUploadBlobResult](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageuploadblobresult.md)  