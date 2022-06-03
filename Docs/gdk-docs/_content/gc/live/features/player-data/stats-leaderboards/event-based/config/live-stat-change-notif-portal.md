---
title: Portal configuration of stat change notifications
description: Describes how to configure stat change notifications.
kindex:
- Xbox Live stats
- stats, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

# Portal configuration of stat change notifications
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes the procedures for subscribing to stat change notifications in the Partner Center service configuration for a title that's using the event-based Data Platform.

Stat change notifications are issued by using the Real-Time Activity (RTA) service. Because constantly polling the service for the value of a player stat is inefficient, RTA is used to notify a title when a subscribed stat value has changed.

For an introduction to service configuration, see [Portal configuration overview](../../../../../test-release/portal-config/live-portal-config-overview.md).

For more information about RTA, see [Real-Time Activity (RTA) service](/gaming/xbox-live/features/rta/live-rta-nav).

This topic covers the following:

- [What is a stat change notification?](#what-is-a-stat-change-notification)
- [Configure stat change notifications](#configure-stat-change-notifications)
- [Enable stat change notifications](#enable-stat-change-notifications)
- [Modify stat change notifications](#modify-stat-change-notifications)
- [Delete a stat change notification](#delete-a-stat-change-notification)

<a id="what-is-a-stat-change-notification"></a>

## What is a stat change notification?

When a player stat is updated, it can be sent as a real-time update to any client that's subscribed to it. In this context, the user stat is considered an RTA. This reporting capability eliminates tracking and updating of your code and easily synchronizes this user statistic data across multiple screens.

Stat change notifications are especially useful in multiplayer games where a scoreboard tracks stats for each player and needs to be updated as quickly as possible.

<a id="configure-stat-change-notifications"></a>

## Configure stat change notifications

1. Sign in to your account on [Partner Center](https://developer.microsoft.com/dashboard/windows/overview).

1. Select your title, and then go to **Services** > **Xbox Live**.

1. Select the link to **Stat change notifications**.

1. On the **Stat change notifications** page, enable stats for stat change notifications.

You must create player stats before you can enable them for stat change notifications.
For details, see [Portal configuration of event-based Stats](live-stats-eb-portal.md).

<a id="enable-stat-change-notifications"></a>

## Enable stat change notifications

1. Open the **Stat change notifications** page. It contains a list of any stats that are enabled for stat change notifications.

2. Select the **Select a stat** dropdown list, and then select an existing stat to be registered for stat change notifications. You can also select **Create a new player stat**. It opens the **Events and stat rules** page on a new tab. You can then create a new player stat.

3. If you select a stat whose name contains fields, you must specify values for the fields.

4. When you're done adding the stat change notifications, select **Save** to save your changes or select **Cancel** to discard them.

For your title to handle stat change notifications, you must add code to subscribe to the stat change notification by using the RTA service.
For more information, see [Programming the RTA service](/gaming/xbox-live/features/rta/how-to/live-programming-rta).

<a id="modify-stat-change-notifications"></a>

## Modify stat change notifications
> [!IMPORTANT]
> After a title passes Final Certification, existing RTAs in that title can't be changed or deleted.

1. On the **Stat change notifications** page, select the stat instance that you want to change.

2. In the dropdown list, select the stat instance for which you want to change the notification.

3. Select **Save** to save your changes, or select **Cancel** to discard them.


<a id="delete-a-stat-change-notification"></a>

## Delete a stat change notification
> [!IMPORTANT]
> After a title passes Final Certification, existing RTAs in that title can't be changed or deleted.

1. On the **Stat change notifications** page, select **Delete** next to the stat change notification that you want to remove.

2. Select **Save** to save your changes, or select **Cancel** to discard them.
