---
title: Updating title-managed Achievements
description: Provides example code for updating title-managed Achievements.
kindex: Updating title-managed Achievements
author: joannaleecy
ms.author: migreen
ms.date: '09/23/2019'
ms.localizationpriority: medium
ms.topic: conceptual
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Updating title-managed Achievements

This topic covers the following:

* [Unlocking an achievement](#unlocking-an-achievement)
* [Updating completion progress for an achievement](#updating-an-achievement)



<a id="unlocking-an-achievement"></a>

## Unlocking an achievement

After your achievements are configured via Partner Center and published to your development sandbox, your title can unlock them by calling the [XblAchievementsUpdateAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementasync.md) API.
For more information, see the example code in the next section.

To unlock an achievement, set `percentComplete` to 100.
If the user is online, the request is immediately sent to the Xbox Live Achievements service and triggers the following user experiences.

-   The user receives an Achievement Unlocked notification.
-   The specified achievement appears as unlocked in the user's achievement list for the title.
-   The unlocked achievement is added to the user's activity feed.
> [!NOTE]
> The user experience is visually the same for achievements that use either event-based Achievements or title-managed Achievements.


If the user is offline, the unlock request is queued locally on the user's device.
When it has reestablished network connectivity, the request is automatically sent to the Achievements service (no action is required from the game to trigger this), and the previous user experiences occur as described.




<a id="updating-an-achievement"></a>

## Updating completion progress for an achievement

To update a user's progress toward unlocking an achievement, call [XblAchievementsUpdateAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementasync.md). Set the `percentComplete` argument to a whole number between 1&ndash;100.
For more information, see the following example code.

An achievement's progress can only increase.
If `percentComplete` is set to a number less than the achievement's last `percentComplete` value, the update is ignored.
For example, if the achievement's `percentComplete` had previously been set to 75, sending an update with a value of 25 is ignored. The achievement is still displayed as 75 percent complete.

If `percentComplete` is set to 100, the achievement is unlocked.

If `percentComplete` is set to a number greater than 100, the API behaves as if you set the number to exactly 100.


### Updating achievements for the current title

You can update achievements for the current title by calling [XblAchievementsUpdateAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementasync.md), as follows.

**Flat C API**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*.
    auto result = XAsyncGetStatus(asyncBlock, false);
    if (SUCCEEDED(result))
    {
        // The achievement was updated.
    }
    else if (result == HTTP_E_STATUS_NOT_MODIFIED)
    {
        // The achievement wasn't updated.
    }
    else
    {
        // The achievement failed to update.
    }
};

HRESULT hr = XblAchievementsUpdateAchievementAsync(
    xboxLiveContext,
    xboxUserId,
    achievementId.c_str(),
    percentComplete,
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
* [XAsyncGetStatus](../../../../../../reference/system/xasync/functions/xasyncgetstatus.md)
* [XblAchievementsUpdateAchievementAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementasync.md)


### Updating achievements for a different title

You can update achievements for another `titleId` by using [XblAchievementsUpdateAchievementForTitleIdAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementfortitleidasync.md), as follows.

**Flat C API**

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*.
    auto result = XAsyncGetStatus(asyncBlock, false);
    if (SUCCEEDED(result))
    {
        // The achievement was updated.
    }
    else if (result == HTTP_E_STATUS_NOT_MODIFIED)
    {
        // The achievement wasn't updated.
    }
    else
    {
        // The achievement failed to update.
    }
};

HRESULT hr = XblAchievementsUpdateAchievementForTitleIdAsync(
    xboxLiveContext,
    xboxUserId,
    titleId,
    scid,
    achievementId.c_str(),
    percentComplete,
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
* [XAsyncGetStatus](../../../../../../reference/system/xasync/functions/xasyncgetstatus.md)
* [XblAchievementsUpdateAchievementForTitleIdAsync](../../../../../../reference/live/xsapi-c/achievements_c/functions/xblachievementsupdateachievementfortitleidasync.md)

 [Return to the top of this topic.](#top)
