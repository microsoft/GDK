---
title: Programming the RTA service
description: Demonstrates how to call the Real-Time Activity service.
kindex:
- Programming the RTA service
- RTA
ms.topic: article
ms.localizationpriority: medium
ms.assetid: 98cdcb1f-41d8-43db-98fc-6647755d3b17
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 02/05/2021
security: public
---

# Programming the RTA service

This topic demonstrates how to call the Real-Time Activity (RTA) service by using the following flat C code examples.

* [Registering a handler to get statistic change events from the RTA service](#registering-a-handler-to-get-statistic-changes-events-from-the-Real-Time-Activity-service)
* [Unregistering from the RTA service](#unregistering-from-the-Real-Time-Activity-service)

<a id="registering-a-handler-to-get-statistic-changes-events-from-the-Real-Time-Activity-service"></a>

## Registering a handler to get statistic change events from the RTA service

You define your statistics and configure them for RTA in [Partner Center](https://partner.microsoft.com/dashboard). For more information, see the following:

* [Configuring title-managed featured stats and leaderboards in Partner Center](../../../player-data/stats-leaderboards/title-managed/config/live-tm-leaderboards-portal.md)

* [Registering for player stat change notifications](../concepts/live-register-for-stat-notifications.md)
> [!NOTE]
> If you're an event-based statistics developer, contact your developer account manager (DAM) for information about portal configuration of event-based statistics in [Partner Center](https://partner.microsoft.com/dashboard). For more information, see Configure Xbox Live stats and stat rules in Partner Center [(Xbox Developer Downloads > Xbox One > All Xbox One XDK CHMs)](https://www.microsoft.com/software-download/devcenter).

Within your title, you need to configure the statistics that you want RTA to track. Title handlers are invoked whenever one of the configured statistics changes as shown in the following code example.

#### Flat C


```cpp
// Add a statistic changed handler.
void* context{ nullptr };
XblFunctionContext statisticChangedFunctionContext = XblUserStatisticsAddStatisticChangedHandler(
    xboxLiveContext,
    [](XblStatisticChangeEventArgs eventArgs, void* context)
    {
        // Handle statistic change. 
        LogToScreen("Statistic changed callback: stat changed (%s = %s)",
            eventArgs.latestStatistic.statisticName,
            eventArgs.latestStatistic.value);
    },
    context
    );

// Configure the statistics that you want RTA to track. Titles only receive real-time updates for tracked statistics.
// Note that you can update the set of tracked statistics independently from the handlers.
std::vector<const char*> statisticNames{ "TotalPuzzlesSolved" };
HRESULT hr = XblUserStatisticsTrackStatistics(
    xblContextHandle,
    &xboxUserId,
    1,
    scid,
    statisticNames.data(),
    statisticNames.size()
);
```


<a id="unregistering-from-the-Real-Time-Activity-service"></a>

## Unregistering from the RTA service

When updates are no longer needed for a particular statistic (or a set of statistics), your title should simply stop tracking that statistic. 
If statistics updates are no longer needed altogether, removing all registered handlers automatically removes the related RTA subscriptions as shown in the following code example.

#### Flat C


```cpp
// Stop receiving updates for a particular statistic.   
std::vector<const char*> statisticNames{ "TotalPuzzlesSolved" }; 
HRESULT hr = XblUserStatisticsStopTrackingStatistics(
    xblContextHandle,
    &xboxUserId,
    1,
    scid,
    statisticNames.data(),
    statisticNames.size()
);

// Alternatively, stop receiving updates for statistics changes altogether.
XblUserStatisticsRemoveStatisticChangedHandler(
    xblContextHandle,
    statisticChangedFunctionContext
);
```


 
> [!IMPORTANT]
> If a client uses RTA for multiplayer sessions, and is disconnected for thirty seconds, the Multiplayer Session Directory (MPSD) detects that the RTA session is closed, and removes the player from the session. XSAPI then automatically reestablishes the RTA connection. However, it's the title's responsibility to rewrite its MPSD sessions after the RTA subscription has been reestablished.

## See also

  

[XblStatisticChangeEventArgs](../../../../../reference/live/xsapi-c/user_statistics_c/structs/xblstatisticchangeeventargs.md)  

[XblUserStatisticsAddStatisticChangedHandler](../../../../../reference/live/xsapi-c/user_statistics_c/functions/xbluserstatisticsaddstatisticchangedhandler.md)  

  

[XblUserStatisticsRemoveStatisticChangedHandler](../../../../../reference/live/xsapi-c/user_statistics_c/functions/xbluserstatisticsremovestatisticchangedhandler.md)  

  