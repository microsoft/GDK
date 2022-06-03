---
title: Getting a title-managed leaderboard
description: Describes how to get a title-managed leaderboard.
kindex:
- Getting a title-managed Leaderboard
- Leaderboards
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---



# Getting a title-managed leaderboard

**Contents**
* [Getting an entire leaderboard](#gael)
* [Getting a leaderboard around a specified rank](#galaasr)
* [Getting a leaderboard around a specified player](#galaasp)

This topic describes how to get the values of a title-managed leaderboard.

<a id="gael"></a>

## Getting an entire leaderboard


Use [XblLeaderboardGetLeaderboardAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardasync.md) to return the leaderboard values for a given leaderboard. The results are returned in order of decreasing rank, starting from the top of the leaderboard. When querying a leaderboard backed by a title-managed stat, be sure to set the `queryType` field to either `XblLeaderboardQueryType::TitleManagedStatBackedGlobal` or `XblLeaderboardQueryType::TitleManagedStatBackedSocial`.


**C API**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*
    size_t resultSize;
    HRESULT hr = XblLeaderboardGetLeaderboardResultSize(asyncBlock, &resultSize);

    if (SUCCEEDED(hr))
    {
        leaderboardBuffer.resize(resultSize);
        XblLeaderboardResult* leaderboard{};

        hr = XblLeaderboardGetLeaderboardResult(asyncBlock, resultSize, leaderboardBuffer.data(), &leaderboard, nullptr);

        if (SUCCEEDED(hr))
        {
            // Use XblLeaderboardResult in result
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

// XblLeaderboardQuery is set up to query for all leaderboard items here
// see example code in sections below showing how to run other queries
XblLeaderboardQuery leaderboardQuery = {}; 
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str()) 
leaderboardQuery.statName = statName.c_str(); 
leaderboardQuery.queryType = XblLeaderboardQueryType::TitleManagedStatBackedGlobal;


HRESULT hr = XblLeaderboardGetLeaderboardAsync(
    xboxLiveContext,
    leaderboardQuery,
    asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

**Reference**
* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblLeaderboardGetLeaderboardAsync](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardasync.md)
* [XblLeaderboardGetLeaderboardResult](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardresult.md)
* [XblLeaderboardGetLeaderboardResultSize](../../../../../../reference/live/xsapi-c/leaderboard_c/functions/xblleaderboardgetleaderboardresultsize.md)
* [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md)
* [XblLeaderboardResult](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardresult.md)
* [XblLeaderboardQueryType](../../../../../../reference/live/xsapi-c/leaderboard_c/enums/xblleaderboardquerytype.md)


<a id="galaasr"></a>

## Getting a leaderboard around a specified rank

You can get filtered results from a leaderboard query by specifying query criteria when you create [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md). 
To get leaderboard values around a specified rank, use the code in the example above but substitute the lines creating XblLeaderboardQuery with the following code:


**C API**

```cpp
XblLeaderboardQuery leaderboardQuery = {};
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str());
leaderboardQuery.statName = statName.c_str();
leaderboardQuery.skipResultToRank = 100;
leaderboardQuery.maxItems = 100;
leaderboardQuery.queryType = XblLeaderboardQueryType::TitleManagedStatBackedGlobal;
```

**Reference**
* [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md)


<a id="galaasp"></a>

## Getting a leaderboard around a specified player

To get leaderboard values around a specified player, use the code in the example above but substitute the lines creating [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md) with the following code:


**C API**

```cpp
XblLeaderboardQuery leaderboardQuery = {};
pal::strcpy(leaderboardQuery.scid, sizeof(leaderboardQuery.scid), scid.c_str());
leaderboardQuery.statName = statName.c_str();
leaderboardQuery.skipToXboxUserId = xboxUserId;
leaderboardQuery.maxItems = 100;
leaderboardQuery.queryType = XblLeaderboardQueryType::TitleManagedStatBackedGlobal;
```

**Reference**
* [XblLeaderboardQuery](../../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardquery.md)