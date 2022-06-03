---
author: joannaleecy
title: XblUserStatisticsUnsubscribeFromStatisticChange
description: >-
  Unsubscribes a previously created statistic change subscription. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are untracked with [XblUserStatisticsStopTrackingStatistics](xbluserstatisticsstoptrackingstatistics.md)
  or [XblUserStatisticsStopTrackingUsers](xbluserstatisticsstoptrackingusers.md)
kindex: XblUserStatisticsUnsubscribeFromStatisticChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsUnsubscribeFromStatisticChange  

Unsubscribes a previously created statistic change subscription. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are untracked with [XblUserStatisticsStopTrackingStatistics](xbluserstatisticsstoptrackingstatistics.md) or [XblUserStatisticsStopTrackingUsers](xbluserstatisticsstoptrackingusers.md)  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsUnsubscribeFromStatisticChange(  
         XblContextHandle xblContextHandle,  
         XblRealTimeActivitySubscriptionHandle subscriptionHandle  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*subscriptionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
The subscription object to unsubscribe.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  