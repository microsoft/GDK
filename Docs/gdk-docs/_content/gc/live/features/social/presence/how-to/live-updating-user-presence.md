---
title: Updating a user's Presence via XSAPI C
description: Provides example code for setting a user's online Presence status.
kindex:
- Updating a user's Presence via XSAPI C
- Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 01/09/2020
edited: 00/00/0000
security: public
---

# Updating a user's Presence via XSAPI C

This topic provides example code for setting a user's online Presence status. Xbox Live Rich Presence provides features for advertising a player's current activity to other players.

For more information, see [Rich Presence overview](../live-presence-overview.md).

## Updating a user's online Presence status

This example code sets a user's online Presence status.

#### Flat C API


```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    HRESULT hr = XAsyncGetStatus(asyncBlock, false);
};

HRESULT hr = XblPresenceSetPresenceAsync(xboxLiveContext, true, nullptr, asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)
* [XblPresenceSetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencesetpresenceasync.md)













## Updating Rich Presence status

#### Flat C API

```cpp
XblPresenceRichPresenceIds ids{};
pal::strcpy(ids.scid, sizeof(ids.scid), scid);
ids.presenceId = "playingMap";
std::vector<const char*> tokenIds{ "CurrentMap" };
ids.presenceTokenIds = tokenIds.data();
ids.presenceTokenIdsCount = tokenIds.size();

HRESULT hr = XblPresenceSetPresenceAsync(xboxLiveContext, true, &ids, asyncBlock.get());
```

For more information, see the following:

* [XblPresenceRichPresenceIds](../../../../../reference/live/xsapi-c/presence_c/structs/xblpresencerichpresenceids.md)
* [XblPresenceSetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencesetpresenceasync.md)
