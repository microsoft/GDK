---
author: joannaleecy
title: user_statistics_c (contents)
description: User Statistics C API
kindex: user_statistics_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# user_statistics_c  



  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblStatisticChangedHandler](functions/xblstatisticchangedhandler.md) | Event handler for statistic change notifications. |  
| [XblUserStatisticsAddStatisticChangedHandler](functions/xbluserstatisticsaddstatisticchangedhandler.md) | Registers an event handler for statistic change notifications. Event handlers receive a XblStatisticChangeEventArgs object. |  
| [XblUserStatisticsGetMultipleUserStatisticsAsync](functions/xbluserstatisticsgetmultipleuserstatisticsasync.md) | Get statistics for multiple users. |  
| [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync](functions/xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsasync.md) | Get statistics for users across different Service configurations. |  
| [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult](functions/xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresult.md) | Get the result for an XblUserStatisticsGetMultipleUserStatisticsAsync call. |  
| [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResultSize](functions/xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresultsize.md) | Get the result size for an XblUserStatisticsGetMultipleUserStatisticsAsync call. |  
| [XblUserStatisticsGetMultipleUserStatisticsResult](functions/xbluserstatisticsgetmultipleuserstatisticsresult.md) | Get the result for an XblUserStatisticsGetMultipleUserStatisticsAsync call. |  
| [XblUserStatisticsGetMultipleUserStatisticsResultSize](functions/xbluserstatisticsgetmultipleuserstatisticsresultsize.md) | Get the result size for an XblUserStatisticsGetMultipleUserStatisticsAsync call. |  
| [XblUserStatisticsGetSingleUserStatisticAsync](functions/xbluserstatisticsgetsingleuserstatisticasync.md) | Get a specified statistic for a specified user. |  
| [XblUserStatisticsGetSingleUserStatisticResult](functions/xbluserstatisticsgetsingleuserstatisticresult.md) | Get the result for an XblUserStatisticsGetSingleUserStatisticAsync call. |  
| [XblUserStatisticsGetSingleUserStatisticResultSize](functions/xbluserstatisticsgetsingleuserstatisticresultsize.md) | Get the result size for an XblUserStatisticsGetSingleUserStatisticsAsync call. |  
| [XblUserStatisticsGetSingleUserStatisticsAsync](functions/xbluserstatisticsgetsingleuserstatisticsasync.md) | Get specified statistics for a single user. |  
| [XblUserStatisticsGetSingleUserStatisticsResult](functions/xbluserstatisticsgetsingleuserstatisticsresult.md) | Get the result for an XblUserStatisticsGetSingleUserStatisticsAsync call. |  
| [XblUserStatisticsGetSingleUserStatisticsResultSize](functions/xbluserstatisticsgetsingleuserstatisticsresultsize.md) | Get the result size for an XblUserStatisticsGetSingleUserStatisticsAsync call. |  
| [XblUserStatisticsRemoveStatisticChangedHandler](functions/xbluserstatisticsremovestatisticchangedhandler.md) | Unregisters an event handler for statistic change notifications. |  
| [XblUserStatisticsStopTrackingStatistics](functions/xbluserstatisticsstoptrackingstatistics.md) | Configures the set of stats that will be tracked real-time. Updates will no longer be received for the provided stats and users. |  
| [XblUserStatisticsStopTrackingUsers](functions/xbluserstatisticsstoptrackingusers.md) | Configures the set of stats that will be tracked real-time. The API will cancel all real-time stat updates for the provided users. |  
| [XblUserStatisticsSubscribeToStatisticChange](functions/xbluserstatisticssubscribetostatisticchange.md) | Subscribes to statistic update notifications via the StatisticChanged event. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are tracked with [XblUserStatisticsTrackStatistics](functions/xbluserstatisticstrackstatistics.md). |  
| [XblUserStatisticsTrackStatistics](functions/xbluserstatisticstrackstatistics.md) | Configures the set of stats that will be tracked real-time. This call will have no affect on stats that were already being tracked. |  
| [XblUserStatisticsUnsubscribeFromStatisticChange](functions/xbluserstatisticsunsubscribefromstatisticchange.md) | Unsubscribes a previously created statistic change subscription. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are untracked with [XblUserStatisticsStopTrackingStatistics](functions/xbluserstatisticsstoptrackingstatistics.md) or [XblUserStatisticsStopTrackingUsers](functions/xbluserstatisticsstoptrackingusers.md) |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblRequestedStatistics](structs/xblrequestedstatistics.md) | Represents the results of a user statistic query. |  
| [XblServiceConfigurationStatistic](structs/xblserviceconfigurationstatistic.md) | Contains statistical information from a service configuration. |  
| [XblStatistic](structs/xblstatistic.md) | Contains information about a user statistic. |  
| [XblStatisticChangeEventArgs](structs/xblstatisticchangeeventargs.md) | Contains information about a change to a subscribed statistic. |  
| [XblUserStatisticsResult](structs/xbluserstatisticsresult.md) | Represents the results of a user statistic query. |  
