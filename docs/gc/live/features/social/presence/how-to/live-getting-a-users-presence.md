---
title: Getting a user's Presence
description: Provides example code for getting a user's Presence.
kindex:
- Getting a user's Presence
- Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Getting a user's Presence

This topic provides example code for getting a user's Presence.​

## Getting a single user's Presence

#### Flat C API


```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    HRESULT hr = XblPresenceGetPresenceResult(asyncBlock, &state.presenceRecord);

    // Be sure to call XblPresenceRecordCloseHandle when the presence record is no longer needed.
};

HRESULT hr = XblPresenceGetPresenceAsync(xboxLiveContext, xboxUserId, asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblPresenceGetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceasync.md)
* [XblPresenceGetPresenceResult](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceresult.md)
* [XblPresenceRecordCloseHandle](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencerecordclosehandle.md)


## Getting multiple users' Presence strings

#### Flat C API



```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    size_t resultCount{ 0 };
    HRESULT hr = XblPresenceGetPresenceForMultipleUsersResultCount(asyncBlock, &resultCount);

    if (SUCCEEDED(hr) && resultCount > 0)
    {
        std::vector<XblPresenceRecordHandle> handles(resultCount, nullptr);
        hr = XblPresenceGetPresenceForMultipleUsersResult(asyncBlock, handles.data(), resultCount);

        // Be sure to call XblPresenceRecordCloseHandle for each presence record when they're
        // no longer needed.
    }
};

std::vector<uint64_t> xuids{ 123, 456 };

// Filter results to only online users.
XblPresenceQueryFilters filters{};
filters.onlineOnly = true;

HRESULT hr = XblPresenceGetPresenceForMultipleUsersAsync(xboxLiveContext, xuids.data(), xuids.size(), &filters, asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblPresenceGetPresenceForMultipleUsersAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceformultipleusersasync.md)
* [XblPresenceGetPresenceForMultipleUsersResult](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceformultipleusersresult.md)
* [XblPresenceGetPresenceForMultipleUsersResultCount](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceformultipleusersresultcount.md)
* [XblPresenceQueryFilters](../../../../../reference/live/xsapi-c/presence_c/structs/xblpresencequeryfilters.md)
* [XblPresenceRecordCloseHandle](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencerecordclosehandle.md)


## Getting a user's Presence from a social group

#### Flat C API


```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    size_t resultCount{ 0 };
    HRESULT hr = XblPresenceGetPresenceForSocialGroupResultCount(asyncBlock, &resultCount);

    if (SUCCEEDED(hr) && resultCount > 0)
    {
        std::vector<XblPresenceRecordHandle> handles(resultCount, nullptr);
        hr = XblPresenceGetPresenceForSocialGroupResult(asyncBlock, handles.data(), resultCount);

        // Be sure to call XblPresenceRecordCloseHandle for each presence record when they're
        // no longer needed.
    }

};

HRESULT hr = XblPresenceGetPresenceForSocialGroupAsync(xboxLiveContext, "Favorites", nullptr, nullptr, asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblPresenceGetPresenceForSocialGroupAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceforsocialgroupasync.md)
* [XblPresenceGetPresenceForSocialGroupResult](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceforsocialgroupresult.md)
* [XblPresenceGetPresenceForSocialGroupResultCount](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceforsocialgroupresultcount.md)
* [XblPresenceRecordCloseHandle](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencerecordclosehandle.md)


## Displaying a user's Presence

#### Flat C API


```cpp
const XblPresenceDeviceRecord* deviceRecords{ nullptr };
size_t deviceRecordsCount{ 0 };
HRESULT hr = XblPresenceRecordGetDeviceRecords(state.presenceRecord, &deviceRecords, &deviceRecordsCount);

for (auto i = 0u; i < deviceRecordsCount; ++i)
{
    auto& deviceRecord{ deviceRecords[i] };
    LogToFile("Got XblDeviceRecord with device type %u and %u title records", deviceRecord.deviceType, deviceRecord.titleRecordsCount);

    for (auto j = 0u; j < deviceRecord.titleRecordsCount; ++j)
    {
        auto& titleRecord{ deviceRecord.titleRecords[j] };
        // Display the Rich Presence string.
        LogToFile("Rich presence string for titleId %u: %s", titleRecord.titleId, titleRecord.richPresenceString);
    }
}
```

For more information, see the following:

* [XblPresenceDeviceRecord](../../../../../reference/live/xsapi-c/presence_c/structs/xblpresencedevicerecord.md)
* [XblPresenceRecordGetDeviceRecords](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencerecordgetdevicerecords.md)
