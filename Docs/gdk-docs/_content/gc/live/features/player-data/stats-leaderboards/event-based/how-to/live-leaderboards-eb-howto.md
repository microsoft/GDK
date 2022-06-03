---
title: Example code for event-based Leaderboards
description: Provides example code for basic leaderboard display, getting a specified page of results, skipping to a specified player in the leaderboard, and getting the next page of leaderboards.
kindex:
- Example code for event-based Leaderboards
- Xbox Live Leaderboards
- Leaderboards, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Example code for event-based Leaderboards

This topic provides example code for basic leaderboard display, getting a specified page of results, skipping to a specified player in the leaderboard, and getting the next page of leaderboards.


This topic covers the following:

* [Getting the top of a leaderboard](#gttoal)
* [Getting a leaderboard around a specified rank](#galaasr)
* [Getting a leaderboard around a specified player](#galaasp)
* [Getting the next page of leaderboards](#gtnpol)













































<a id="gttoal"></a>

## Getting the top of a leaderboard

Use [XblLeaderboardGetLeaderboardAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardasync.md) to return the leaderboard values for the specified leaderboard, starting from the top of the leaderboard. When querying a leaderboard backed by an event-based User Stat, be sure to set the `queryType` field to `XblLeaderboardQueryType::UserStatBacked`.


### Basic leaderboard display (flat C API)

#### Flat C API

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    size_t resultSize;
    HRESULT hr = XblLeaderboardGetLeaderboardResultSize(asyncBlock, &resultSize);

    if (SUCCEEDED(hr))
    {
        leaderboardBuffer.resize(resultSize);
        XblLeaderboardResult* leaderboard{};

        hr = XblLeaderboardGetLeaderboardResult(asyncBlock, resultSize, leaderboardBuffer.data(), &leaderboard, nullptr);

        if (SUCCEEDED(hr))
        {
            // Use XblLeaderboardResult in result.
            for (auto row = 0u; row < leaderboard->rowsCount; ++row)
            {
                std::stringstream rowText;
                rowText << leaderboard->rows[row].xboxUserId << "\t";

                for (auto column = 0u; column < leaderboard->rows[row].columnValuesCount; ++column)
                {
                    rowText << leaderboard->rows[row].columnValues[column] << "\t";
                }
            }
        }
    }
};

// Instantiate and configure the leaderboard query.
XblLeaderboardQuery leaderboardQuery = {}; 
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str()) 
leaderboardQuery.leaderboardName = leaderboardName.c_str(); 
leaderboardQuery.queryType = XblLeaderboardQueryType::UserStatBacked;
// For more leaderboard query options, replace the 4-line code block 
// that precedes this comment as indicated in other examples.

HRESULT hr = XblLeaderboardGetLeaderboardAsync(
    xboxLiveContext,
    leaderboardQuery,
    asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblLeaderboardGetLeaderboardAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardasync.md)
* [XblLeaderboardGetLeaderboardResult](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardresult.md)
* [XblLeaderboardGetLeaderboardResultSize](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardresultsize.md)
* [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md)
* [XblLeaderboardResult](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardresult.md)





<a id="galaasr"></a>

## Getting a leaderboard around a specified rank

Replace the 4-line code block that instantiates and configures the leaderboard query in the previous Basic leaderboard query (flat C API) example with the following code block to get a specified page of results from a leaderboard query.  

### Get a specified page of results (C)

#### Flat C API

```cpp
XblLeaderboardQuery leaderboardQuery = {};
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str());
leaderboardQuery.leaderboardName = leaderboardName.c_str();
leaderboardQuery.skipResultToRank = 100;
leaderboardQuery.maxItems = 100;
leaderboardQuery.queryType = XblLeaderboardQueryType::UserStatBacked;
```

For more information, see [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md).





<a id="galaasp"></a>

## Getting a leaderboard around a specified player

Replace the 4-line code block that instantiates and configures the leaderboard query in the previous Basic leaderboard query (flat C API) example with the following code block to get a leaderboard around a specified player.


#### Flat C API

```cpp
XblLeaderboardQuery leaderboardQuery = {};
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str());
leaderboardQuery.leaderboardName = leaderboardName.c_str();
leaderboardQuery.skipToXboxUserId = xboxUserId;
leaderboardQuery.maxItems = 100;
leaderboardQuery.queryType = XblLeaderboardQueryType::UserStatBacked;
```

For more information, see [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md).




<a id="gtnpol"></a>

## Getting the next page of leaderboards

To get the next page of a previous leaderboard result, call [XblLeaderboardResultGetNextAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardresultgetnextasync.md) as shown in the following example code.


#### Flat C API

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    size_t resultSize;
    HRESULT hr = XblLeaderboardResultGetNextResultSize(asyncBlock, &resultSize);

    if (SUCCEEDED(hr))
    {
        std::vector<char> buffer(resultSize, 0);
        XblLeaderboardResult* result{};

        hr = XblLeaderboardResultGetNextResult(asyncBlock, resultSize, buffer.data(), &result, nullptr);
        // Use result to read the leaderboard results.
    }
};

HRESULT hr = XblLeaderboardResultGetNextAsync(
    xboxLiveContext,
    leaderboardResult,
    maxItems,
    asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* because the callback will take over ownership.
    // If the call fails, std::unique_ptr will keep ownership and delete XAsyncBlock*.
    asyncBlock.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblLeaderboardResult](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardresult.md)
* [XblLeaderboardResultGetNextAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardresultgetnextasync.md)
* [XblLeaderboardResultGetNextResult](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardresultgetnextresult.md)
* [XblLeaderboardResultGetNextResultSize](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardresultgetnextresultsize.md)


