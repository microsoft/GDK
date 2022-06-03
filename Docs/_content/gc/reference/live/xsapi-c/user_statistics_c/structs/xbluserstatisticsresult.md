---
author: joannaleecy
title: XblUserStatisticsResult
description: Represents the results of a user statistic query.
kindex: XblUserStatisticsResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblUserStatisticsResult  

Represents the results of a user statistic query.  

## Syntax  
  
```cpp
typedef struct XblUserStatisticsResult {  
    uint64_t xboxUserId;  
    XblServiceConfigurationStatistic* serviceConfigStatistics;  
    uint32_t serviceConfigStatisticsCount;  
} XblUserStatisticsResult  
```
  
### Members  
  
*xboxUserId*  
Type: uint64_t  
  
The Xbox User ID for the user in a statistic.
  
*serviceConfigStatistics*  
Type: [XblServiceConfigurationStatistic*](xblserviceconfigurationstatistic.md)  
  
A collection of statistics from a service configuration.
  
*serviceConfigStatisticsCount*  
Type: uint32_t  
  
The size of **serviceConfigStatistics**.
  
## Argument of
  
[XblUserStatisticsGetSingleUserStatisticResult](../functions/xbluserstatisticsgetsingleuserstatisticresult.md)  
[XblUserStatisticsGetSingleUserStatisticsResult](../functions/xbluserstatisticsgetsingleuserstatisticsresult.md)  
[XblUserStatisticsGetMultipleUserStatisticsResult](../functions/xbluserstatisticsgetmultipleuserstatisticsresult.md)  
[XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult](../functions/xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresult.md)
  
## Requirements  
  
**Header:** user_statistics_c.h
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  