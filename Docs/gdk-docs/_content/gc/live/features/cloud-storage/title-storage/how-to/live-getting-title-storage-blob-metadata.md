---
title: Getting Title Storage blob metadata
description: Demonstrates how to get Xbox Live Title Storage blob metadata.
kindex: Getting Title Storage blob metadata
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: heba
ms.date: 11/15/2019
edited: 02/01/2021
security: public
---

# Getting Title Storage blob metadata

This topic demonstrates how to retrieve blob metadata from Xbox Live Title Storage by using the following flat C code examples.

#### Flat C



```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };
    XblTitleStorageBlobMetadataResultHandle handle;
    HRESULT hr = XblTitleStorageGetBlobMetadataResult(asyncBlock, &handle);

    if (SUCCEEDED(hr))
    {
        if (blobMetadataResultHandle != nullptr)
        {
            XblTitleStorageBlobMetadataResultCloseHandle(blobMetadataResultHandle);
        }

        blobMetadataResultHandle = handle;
    }

};

HRESULT hr = XblTitleStorageGetBlobMetadataAsync(
    xboxLiveContext,
    scid,
    storageType,
    blobPath.c_str(),
    xboxUserId,
    skipItems,
    maxItems,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    asyncBlock.release();
}
```


## Only one page  of  XblTitleStorageBlobMetadata objects exists

The following code example demonstrates how to use `XblTitleStorageBlobMetadataResultHandle` to retrieve the first page of the list of [XblTitleStorageBlobMetadata](../../../../../reference/live/xsapi-c/title_storage_c/structs/xbltitlestorageblobmetadata.md) objects.> [!NOTE]
> Depending on the number of blobs that the title has in Title Storage, there might be several pages of `XblTitleStorageBlobMetadata`.

#### Flat C



```cpp
XblTitleStorageBlobMetadataResultHandle handle = blobMetadataResultHandle;

const XblTitleStorageBlobMetadata* items;
size_t itemsSize;

HRESULT hr = XblTitleStorageBlobMetadataResultGetItems(handle, &items, &itemsSize);
```



## Determine if more pages of XblTitleStorageBlobMetadata objects exist

The following code example demonstrates how to check to see if there are more pages of `XblTitleStorageBlobMetadata` to retrieve from Title Storage.

#### Flat C



```cpp
XblTitleStorageBlobMetadataResultHandle handle = blobMetadataResultHandle;

bool hasNext;

HRESULT hr = XblTitleStorageBlobMetadataResultHasNext(handle, &hasNext);
```



## Retrieving more pages of XblTitleStorageBlobMetadata objects

The following code example demonstrates how to retrieve the next page of `XblTitleStorageBlobMetadata` objects.

#### Flat C



```cpp
XblTitleStorageBlobMetadataResultHandle handle = blobMetadataResultHandle;

auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };
    XblTitleStorageBlobMetadataResultHandle handle{ nullptr };
    
    HRESULT hr = XblTitleStorageBlobMetadataResultGetNextResult(asyncBlock, &handle);
};

HRESULT hr = XblTitleStorageBlobMetadataResultGetNextAsync(handle, maxItems, asyncBlock.get());

if (SUCCEEDED(hr))
{
    asyncBlock.release();
}
```



## Duplicating XblTitleStorageBlobMetadataResultHandle

The following code example demonstrates how to create a duplicate of `XblTitleStorageBlobMetadataResultHandle`.

#### Flat C



```cpp
XblTitleStorageBlobMetadataResultHandle handle = blobMetadataResultHandle;
XblTitleStorageBlobMetadataResultHandle duplicatedHandle;

HRESULT hr = XblTitleStorageBlobMetadataResultDuplicateHandle(handle, &duplicatedHandle);
```



## Closing XblTitleStorageBlobMetadataResultHandle

The following code example demonstrates how to close `XblTitleStorageBlobMetadataResultHandle`.
> [!NOTE]
> You must close this handle when you're done using it.

#### Flat C



```cpp
XblTitleStorageBlobMetadataResultHandle handle = blobMetadataResultHandle;
XblTitleStorageBlobMetadataResultCloseHandle(handle);
blobMetadataResultHandle = nullptr;
```



## See also  

[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  

[XblTitleStorageBlobMetadataResultCloseHandle](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresultclosehandle.md)  

[XblTitleStorageGetBlobMetadataAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragegetblobmetadataasync.md)  

[XblTitleStorageGetBlobMetadataResult](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestoragegetblobmetadataresult.md)  

[XblTitleStorageBlobMetadata](../../../../../reference/live/xsapi-c/title_storage_c/structs/xbltitlestorageblobmetadata.md)  

[XblTitleStorageBlobMetadataResultGetItems](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresultgetitems.md)  

[XblTitleStorageBlobMetadataResultHasNext](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresulthasnext.md)  

[XblTitleStorageBlobMetadataResultGetNextAsync](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresultgetnextasync.md)  

[XblTitleStorageBlobMetadataResultGetNextResult](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresultgetnextresult.md)  

[XblTitleStorageBlobMetadataResultDuplicateHandle](../../../../../reference/live/xsapi-c/title_storage_c/functions/xbltitlestorageblobmetadataresultduplicatehandle.md)  