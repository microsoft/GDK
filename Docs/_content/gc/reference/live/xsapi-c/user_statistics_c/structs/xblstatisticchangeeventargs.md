---
author: joannaleecy
title: XblStatisticChangeEventArgs
description: Contains information about a change to a subscribed statistic.
kindex: XblStatisticChangeEventArgs
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblStatisticChangeEventArgs  

Contains information about a change to a subscribed statistic.  

## Syntax  
  
```cpp
typedef struct XblStatisticChangeEventArgs {  
    uint64_t xboxUserId;  
    char serviceConfigurationId[XBL_SCID_LENGTH];  
    XblStatistic latestStatistic;  
} XblStatisticChangeEventArgs  
```
  
### Members  
  
*xboxUserId*  
Type: uint64_t  
  
The Xbox user ID used to create the subscription.
  
*serviceConfigurationId*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID used to create the subscription.
  
*latestStatistic*  
Type: [XblStatistic](xblstatistic.md)  
  
The statistic with an updated value.
  
## Argument of
  
[XblStatisticChangedHandler](../functions/xblstatisticchangedhandler.md)
  
## Requirements  
  
**Header:** user_statistics_c.h
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  