---
title: Portal configuration of event-based Leaderboards
description: Describes how to configure event-based Leaderboards at Partner Center.
kindex:
- Xbox Live Leaderboards
- Leaderboards, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Portal configuration of event-based Leaderboards


> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes the procedures for configuring leaderboards in the Partner Center service configuration for a title that's using event-based Stats.





### What is a global leaderboard?

The Xbox Live Leaderboard service provides the capability for storing and retrieving global leaderboards for Xbox Live titles. Each leaderboard score is automatically updated by the Xbox data platform to reflect the appropriate values of the score's underlying stat instances. You can maintain multiple leaderboards for each title.

### Configure leaderboards, in general

1. Sign in to your account on [Partner Center](https://developer.microsoft.com/dashboard/windows/overview).

2. Select your title, and then go to **Services** > **Xbox Live**.

3. Select the link to **Leaderboards**.

4. On the **Leaderboards** page, create and manage global leaderboards for your title.

### Create a leaderboard

1. On the **Leaderboards** page, select **New leaderboard**. The **New leaderboard** page appears.

2. In the **Leaderboard name** field, enter your leaderboard's name. It must not exceed 100 characters. The name won't be visible to your players, but it can be used in your code to reference the leaderboard.

3. In the **Player Stat to rank with** dropdown list, select the stat on which the leaderboard is ranked. To create a new player stat, start by selecting **Create a new player stat**. The **Events and stat rules** page appears on a new tab.

4. If you select a stat whose name contains fields, you must specify the values for the fields.

5. Under **Sort order**, select the applicable option in the dialog. **Higher values are better** is a good choice for stats like kill count and coins collected. **Lower values are better** is a good choice for stats like race times and least attempts at a level.

6. Select **Save** to save your changes.

Your new leaderboard is now listed on the **Leaderboards** page.

### Change a leaderboard

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **IMPORTANT:** There's no support for changing or deleting a leaderboard that's been published. This means that you must create a new leaderboard with a different leaderboard ID. Changing the sort order or the underlying instance of a leaderboard's stat might cause data loss. Avoid reusing leaderboard IDs that have already been configured and published.

1. On the **Leaderboards** page, select the name of the leaderboard that you want to change.

2. Make your changes to the leaderboard's details.

3. Select **Save** to save your changes.

### Delete a leaderboard

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **IMPORTANT:** There's no support for changing or deleting a leaderboard that's been published. This means that you must create a new leaderboard with a different leaderboard ID. Changing the sort order or the underlying instance of a leaderboard's stat might cause data loss. Avoid reusing leaderboard IDs that have already been configured and published.

1. On the **Leaderboards** page, select **Delete** next to the leaderboard that you want to delete.

2. In the **Confirmation** dialog, select **Delete** to confirm the deletion.
