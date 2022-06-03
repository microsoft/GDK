---
author: joannaleecy
title: XblUserStatisticsSubscribeToStatisticChange
description: >-
  Subscribes to statistic update notifications via the StatisticChanged event. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are tracked with [XblUserStatisticsTrackStatistics](xbluserstatisticstrackstatistics.md).
kindex: XblUserStatisticsSubscribeToStatisticChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsSubscribeToStatisticChange  

Subscribes to statistic update notifications via the StatisticChanged event. DEPRECATED. This continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as statistics are tracked with [XblUserStatisticsTrackStatistics](xbluserstatisticstrackstatistics.md).  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsSubscribeToStatisticChange(  
         XblContextHandle xblContextHandle,  
         uint64_t xboxUserId,  
         const char* serviceConfigurationId,  
         const char* statisticName,  
         XblRealTimeActivitySubscriptionHandle* subscriptionHandle  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player requesting the subscription.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*statisticName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the statistic to subscribe to.  
  
*subscriptionHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblRealTimeActivitySubscriptionHandle*](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Passes back an XblRealTimeActivitySubscriptionHandle object that contains the state of the subscription. You can register an event handler for statistic changes by calling XblUserStatisticsAddStatisticChangedHandler().  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  