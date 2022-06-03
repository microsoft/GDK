---
author: joannaleecy
title: XblRequestedStatistics
description: Represents the results of a user statistic query.
kindex: XblRequestedStatistics
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblRequestedStatistics  

Represents the results of a user statistic query.  

## Syntax  
  
```cpp
typedef struct XblRequestedStatistics {  
    char serviceConfigurationId[XBL_SCID_LENGTH];  
    const char** statistics;  
    uint32_t statisticsCount;  
} XblRequestedStatistics  
```
  
### Members  
  
*serviceConfigurationId*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID in use.
  
*statistics*  
Type: const char**  
  
A collection of statistics.
  
*statisticsCount*  
Type: uint32_t  
  
The size of **statistics**.
  
## Argument of
  
[XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync](../functions/xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsasync.md)
  
## Requirements  
  
**Header:** user_statistics_c.h
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  