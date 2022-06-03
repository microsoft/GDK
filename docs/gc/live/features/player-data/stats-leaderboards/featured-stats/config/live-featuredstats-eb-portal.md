---
title: Portal configuration of event-based Featured Stats
description: Describes how to configure event-based Featured Stats in Partner Center.
kindex:
- Portal configuration of event-based Featured Stats
- event-based Featured Stats
- Xbox Live, event-based Featured Stats
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

<a id="top"></a>

# Portal configuration of event-based Featured Stats
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes how to add and change featured stats in the Partner Center service configuration for a title.
For an introduction to the Xbox Live service configuration, see [Portal configuration overview](../../../../../test-release/portal-config/live-portal-config-overview.md).

This topic covers the following:

- [What is a featured stat?](#what-is-a-featured-stat)
- [Configure featured stats](#configure-featured-stats)
- [Create a featured stat](#create-a-featured-stat)
- [Reorder featured stats](#reorder-featured-stats)
- [Change a featured stat](#change-a-featured-stat)
- [Delete a featured stat](#delete-a-featured-stat)


<a id="what-is-a-featured-stat"></a>

## What is a featured stat?

A *featured stat* is a player stat that's displayed in various kinds of Xbox UI, most notably in a player's activity hub and in a player-to-player comparison of progress in the game.

For each title, you can select up to 20 of the title's most representative player stats. These custom-defined metrics are used to highlight a player's progress, compare it with the progress of other players, and get players back into the game.

Each featured stat includes a localizable display name, a sort order, and a sequence number for prioritizing a set of featured stats.

 [Return to the top of this topic.](#top)

<a id="configure-featured-stats"></a>

## Configure featured stats

1. Sign in to your account on [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).

2. Select your title, and then select **Services** > **Xbox Live**.

3. Select the link to **Featured stats**.

4. Designate new featured stats or reorder existing featured stats.

 [Return to the top of this topic.](#top)

<a id="create-a-featured-stat"></a>

## Create a featured stat

You must create a stat rule before you can create a featured stat. For details, see [Portal configuration of event-based Stats](../../event-based/config/live-stats-eb-portal.md).

1. On the **Featured stats** page, select **New featured stat**.

2. In the box under **Display name**, enter a new, localizable display name for the featured stat. The maximum length of the string is 40 characters.

3. In the dropdown list under **Select a player stat to rank players with**, select the player stat instance to be featured. The stats should be easy to sort.

4. In the dropdown list under **Format**, select the format for the presented stat data: **integer**, **decimal**, **percentage**, **short time-span**, or **long time-span**.

    If you selected **short time-span** or **long time-span**, select the unit of time to be displayed: **milliseconds**, **seconds**, **minutes**, **hours**, or **days**.

5. Under **How should we aggregate this stat when comparing to other players?**, select from these three options.
    * **Tier**: A tiered level of achievement for a player's progress in the game  
    * **Best**: The current best score that a player has posted  
    * **Cumulative**: An indication that this value can be added to other players' values in the calculation of the total cumulative value  

6. Under **How should we sort this stat when comparing to other players?**, select from these two options.
    * **Higher values are better**
    * **Lower values are better**

7. Select **Save** to save the featured stat or select **Cancel** to cancel it.

 [Return to the top of this topic.](#top)

<a id="reorder-featured-stats"></a>

## Reorder featured stats

All titles automatically display three built-in featured stats before any title-specific featured stats. The built-in stats are gamerscore, achievements earned, and time played.

By default, title-specific featured stats are ordered according to the sequence in which you create them. Each featured stat has an associated number that represents the stat's display order in the UI. Ensure that the most important and representative stats have lower order numbers, with 1 being the first featured stat displayed.

**To change the order of featured stats**

1. On the **Featured stats** page, select **Reorder featured stats**.

2. Change the value in the **Order** column. The same number can't be assigned to more than one featured stat.

3. Select **Confirm**.

 [Return to the top of this topic.](#top)

<a id="change-a-featured-stat"></a>

## Change a featured stat

1. On the **Featured stats** page, select the **Display name** of the featured stat that you want to change.

2. Make the changes on the page that shows the details of the featured stat.

3. Select **Save**.

 [Return to the top of this topic.](#top)

<a id="delete-a-featured-stat"></a>

## Delete a featured stat
> [!IMPORTANT]
> Featured stat deletion is permanent and irreversible.  

1. On the **Featured stats** page, select **Delete** in the row of the featured stat that you want to delete.

2. In the **Confirmation** dialog, select **Delete**.  

 [Return to the top of this topic.](#top)