---
title: Getting title-managed Achievements
description: Provides example code for getting title-managed Achievements.
kindex: Getting title-managed Achievements
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.date: '09/23/2019'
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

<a id="top"></a>
# Getting title-managed Achievements

This topic covers the following:

* [Getting the achievements list](#getting-the-achievements-list)
* [Getting the next page of achievements results](#getting-the-next-page-of-achievements-results)
* [Getting a single achievement](#getting-a-single-achievement)



<a id="getting-the-achievements-list"></a>

## Getting the achievements list

To get the achievements for the running title, call [XblAchievementsGetAchievementsForTitleIdAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementsfortitleidasync.md), as follows.


### Calling XblAchievementsGetAchievementsForTitleIdAsync

**C++**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.

    XblAchievementsResultHandle resultHandle;
    auto hr = XblAchievementsGetAchievementsForTitleIdResult(asyncBlock, &resultHandle);

    if (SUCCEEDED(hr))
    {
        const XblAchievement* achievements = nullptr;
        size_t achievementsCount = 0;
        hr = XblAchievementsResultGetAchievements(resultHandle, &achievements, &achievementsCount);

        for (size_t i = 0; i < achievementsCount; i++)
        {
            LogToScreen("Achievement %s: %s = %s", 
                achievements[i].id, 
                achievements[i].name,
                (achievements[i].progressState == XblAchievementProgressState::Achieved) ? "Achieved" : "Not achieved");
        }

        XblAchievementsResultCloseHandle(resultHandle); // When you're done with the handle, close it.
        achievements = nullptr; // Clear the array after calling XblAchievementsResultCloseHandle to the pointer to freed memory.
        // Instead, you couldn't close the handle and store it. Then, 
        // if you needed to copy the handle, call XblAchievementsResultDuplicateHandle().
    }
};

HRESULT hr = XblAchievementsGetAchievementsForTitleIdAsync(
    xboxLiveContext,
    xboxUserId,
    titleId,
    achievementType,
    unlockedOnly,
    orderBy,
    skipItems,
    maxItems,
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

* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblAchievement](../../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementProgressState](../../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementprogressstate.md)
* [XblAchievementsGetAchievementsForTitleIdAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementsfortitleidasync.md)
* [XblAchievementsGetAchievementsForTitleIdResult](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementsfortitleidresult.md)
* [XblAchievementsResultCloseHandle](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultclosehandle.md)
* [XblAchievementsResultDuplicateHandle](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultduplicatehandle.md)
* [XblAchievementsResultGetAchievements](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetachievements.md)





 [Return to the top of this topic.](#top)

<a id="getting-the-next-page-of-achievements-results"></a>

## Getting the next page of achievements results

There might be more pages of achievements. To check, call [XblAchievementsResultHasNext](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresulthasnext.md) and then call [XblAchievementsResultGetNextAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetnextasync.md).


### Calling XblAchievementsResultHasNext

**Flat C API**

```cpp
HRESULT hr = S_OK;
bool hasNext = false;
if (achievementsResult != nullptr)
{
    hr = XblAchievementsResultHasNext(achievementsResult, &hasNext);
}
```

For more information, see [XblAchievementsResultHasNext](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresulthasnext.md).

### Calling XblAchievementsResultGetNextAsync

To get the next page of achievements, call [XblAchievementsResultGetNextAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetnextasync.md), as follows.

**C++**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    XblAchievementsResultHandle resultHandle;
    auto hr = XblAchievementsResultGetNextResult(asyncBlock, &resultHandle);

    if (SUCCEEDED(hr))
    {
        const XblAchievement* achievements = nullptr;
        size_t achievementsCount = 0;
        hr = XblAchievementsResultGetAchievements(resultHandle, &achievements, &achievementsCount);

        for (size_t i = 0; i < achievementsCount; i++)
        {
            LogToScreen("Achievement %s: %s = %s",
                achievements[i].id,
                achievements[i].name,
                (achievements[i].progressState == XblAchievementProgressState::Achieved) ? "Achieved" : "Not achieved");
        }

        XblAchievementsResultCloseHandle(resultHandle); // When you're done with the handle, close it.
        achievements = nullptr; // Clear the array after calling XblAchievementsResultCloseHandle to the pointer to freed memory.
    }
};

HRESULT hr = XblAchievementsResultGetNextAsync(
    achievementsResult,
    maxItems,
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

* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblAchievement](../../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementProgressState](../../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementprogressstate.md)
* [XblAchievementsResultCloseHandle](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultclosehandle.md)
* [XblAchievementsResultGetAchievements](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetachievements.md)
* [XblAchievementsResultGetNextAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetnextasync.md)
* [XblAchievementsResultGetNextResult](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetnextresult.md)





 [Return to the top of this topic.](#top)

<a id="getting-a-single-achievement"></a>

## Getting a single achievement

To get a single achievement, call [XblAchievementsGetAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementasync.md), as follows.

**Flat C API**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of XAsyncBlock*.
    XblAchievementsResultHandle resultHandle;
    auto hr = XblAchievementsGetAchievementResult(asyncBlock, &resultHandle);

    if (SUCCEEDED(hr))
    {
        const XblAchievement* achievements = nullptr;
        size_t achievementsCount = 0;
        hr = XblAchievementsResultGetAchievements( resultHandle, &achievements, &achievementsCount );

        // Use the achievements array to read the achievement data.

        XblAchievementsResultCloseHandle(resultHandle); // When you're done with the handle, close it.
        achievements = nullptr; // Clear the array after calling XblAchievementsResultCloseHandle to avoid the pointer to freed memory.
    }
};

HRESULT hr = XblAchievementsGetAchievementAsync(
    xboxLiveContext,
    xboxUserId,
    scid,
    achievementId.c_str(),
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

* [XAsyncBlock](../../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XblAchievement](../../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementsGetAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementasync.md)
* [XblAchievementsGetAchievementResult](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsgetachievementresult.md)
* [XblAchievementsResultCloseHandle](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultclosehandle.md)
* [XblAchievementsResultGetAchievements](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsresultgetachievements.md)


 [Return to the top of this topic.](#top)
