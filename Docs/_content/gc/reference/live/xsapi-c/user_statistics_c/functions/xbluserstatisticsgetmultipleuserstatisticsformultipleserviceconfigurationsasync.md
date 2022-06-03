---
author: joannaleecy
title: XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync
description: Get statistics for users across different Service configurations.
kindex: XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync  

Get statistics for users across different Service configurations.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsAsync(  
         XblContextHandle xblContextHandle,  
         uint64_t* xboxUserIds,  
         uint32_t xboxUserIdsCount,  
         const XblRequestedStatistics* requestedServiceConfigurationStatisticsCollection,  
         uint32_t requestedServiceConfigurationStatisticsCollectionCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserIds* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
A list of the user Xbox user ID to get stats for.  
  
*xboxUserIdsCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
A list of the user Xbox user ID to get stats for.  
  
*requestedServiceConfigurationStatisticsCollection* &nbsp;&nbsp;\_In\_  
Type: [XblRequestedStatistics*](../structs/xblrequestedstatistics.md)  
  
A list of the service config IDs and its associated array of statistics.  
  
*requestedServiceConfigurationStatisticsCollectionCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of the service config IDs and its associated array of statistics.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResultSize](xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresultsize.md) and [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult](xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresult.md) upon completion to get the result. Only statistics with values are returned. For example, if you ask for 3 statistic names and only 2 have values, only 2 statistics are returned by the service.
  
## REST Call  
  
V1 POST /batch
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  