---
author: joannaleecy
title: XblServiceConfigurationStatistic
description: Contains statistical information from a service configuration.
kindex: XblServiceConfigurationStatistic
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblServiceConfigurationStatistic  

Contains statistical information from a service configuration.  

## Syntax  
  
```cpp
typedef struct XblServiceConfigurationStatistic {  
    char serviceConfigurationId[XBL_SCID_LENGTH];  
    XblStatistic* statistics;  
    uint32_t statisticsCount;  
} XblServiceConfigurationStatistic  
```
  
### Members  
  
*serviceConfigurationId*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID (SCID) associated with the leaderboard.
  
*statistics*  
Type: [XblStatistic*](xblstatistic.md)  
  
A collection of statistics used in leaderboards.
  
*statisticsCount*  
Type: uint32_t  
  
The size of **statistics**.
  
## Member of
  
[XblUserStatisticsResult](xbluserstatisticsresult.md)
  
## Requirements  
  
**Header:** user_statistics_c.h
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  