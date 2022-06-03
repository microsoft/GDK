---
title: Getting a social relationship
description: Provides a code example that shows how to use the Social Manager API to retrieve a user's social relationships and their public properties.
kindex:
- Getting a social relationship
- Social Manager
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.date: 04/04/2017
ms.assetid: 101d059a-e03f-472c-8300-800aa5730ee2
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Getting a social relationship
> [!NOTE]
> This topic demonstrates advanced API usage. If you find an unsupported scenario in the Social Manager, please let your developer account manager (DAM) know.

This topic provides a code example that shows how to use the Social Manager API to retrieve a user's social relationships and their public properties.

To get started with the Social Manager, see [Social Manager overview](../../social-manager/live-social-manager-overview.md).
The Social Manager API significantly simplifies development for keeping track of online friends and their gaming activity.

## Getting the first user's social relationships

The following code example shows how to retrieve a social relationship with Xbox Live.

The code example does the following:

1. Generates a list of all the users on the system, and then retrieves the first user.
2. Retrieves all of that user's social relationships.
3. Displays the public properties of each of those relationships.

**Flat C API**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>(); 
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    HRESULT hr = XblSocialGetSocialRelationshipsResult(asyncBlock, &state.socialResultHandle);

    // Be sure to call XblSocialRelationshipResultCloseHandle when the result object is no longer needed.
};

HRESULT hr = XblSocialGetSocialRelationshipsAsync(
    xboxLiveContext,
    xboxUserId,
    socialRelationshipFilter,
    0,
    0,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblSocialGetSocialRelationshipsAsync](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialgetsocialrelationshipsasync.md)
* [XblSocialGetSocialRelationshipsResult](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialgetsocialrelationshipsresult.md)
* [XblSocialRelationshipResultCloseHandle](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresultclosehandle.md)

## Getting a single relationship

**Flat C API**

```cpp
const XblSocialRelationship* relationships = nullptr;
size_t relationshipsCount = 0;
HRESULT hr = XblSocialRelationshipResultGetRelationships(state.socialResultHandle, &relationships, &relationshipsCount);

LogToFile("Got %u SocialRelationships:", relationshipsCount);
for (size_t i = 0; i < relationshipsCount; ++i)
{
    LogToFile("Xuid = %u, isFollowingCaller = %u", relationships[i].xboxUserId, relationships[i].isFollowingCaller);
}
```

For more information, see the following:

* [XblSocialRelationship](../../../../../reference/live/xsapi-c/social_c/structs/xblsocialrelationship.md)
* [XblSocialRelationshipResultGetRelationships](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresultgetrelationships.md)











## Getting the next page of relationships


**Flat C API**


```cpp
bool hasNext{ false };
HRESULT hr = XblSocialRelationshipResultHasNext(state.socialResultHandle, &hasNext);

if (hasNext)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>(); 
    asyncBlock->queue = queue;
    asyncBlock->context = nullptr;
    asyncBlock->callback = [](XAsyncBlock* asyncBlock)
    {
        std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
        // Close the handle to the previous page of results.
        if (state.socialResultHandle)
        {
            XblSocialRelationshipResultCloseHandle(state.socialResultHandle);
        }
        HRESULT hr = XblSocialRelationshipResultGetNextResult(asyncBlock, &state.socialResultHandle);
    };

    uint32_t maxItems = 100;
    HRESULT hr = XblSocialRelationshipResultGetNextAsync(xboxLiveContext, state.socialResultHandle, maxItems, asyncBlock.get());
    if (SUCCEEDED(hr))
    {
        // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
        // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
        asyncBlock.release();
    }
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblSocialRelationshipResultCloseHandle](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresultclosehandle.md)
* [XblSocialRelationshipResultGetNextAsync](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresultgetnextasync.md)
* [XblSocialRelationshipResultGetNextResult](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresultgetnextresult.md)
* [XblSocialRelationshipResultHasNext](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialrelationshipresulthasnext.md)
