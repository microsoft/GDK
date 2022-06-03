---
author: joannaleecy
title: XblUserStatisticsStopTrackingStatistics
description: Configures the set of stats that will be tracked real-time. Updates will no longer be received for the provided stats and users.
kindex: XblUserStatisticsStopTrackingStatistics
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsStopTrackingStatistics  

Configures the set of stats that will be tracked real-time. Updates will no longer be received for the provided stats and users.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsStopTrackingStatistics(  
         XblContextHandle xblContextHandle,  
         const uint64_t* xboxUserIds,  
         size_t xboxUserIdsCount,  
         const char* serviceConfigurationId,  
         const char** statisticNames,  
         size_t statisticNamesCount  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserIds* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
Array of XboxUserIDs for whom to stop tracking the provided stats.  
  
*xboxUserIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Length of xboxUserIds array.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*statisticNames* &nbsp;&nbsp;\_In\_  
Type: char**  
  
Array of statistic names for which real-time updates are no longer needed.  
  
*statisticNamesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Length of statisticNames array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  