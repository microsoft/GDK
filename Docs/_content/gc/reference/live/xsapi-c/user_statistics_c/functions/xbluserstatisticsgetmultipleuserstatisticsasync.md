---
author: joannaleecy
title: XblUserStatisticsGetMultipleUserStatisticsAsync
description: Get statistics for multiple users.
kindex: XblUserStatisticsGetMultipleUserStatisticsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsGetMultipleUserStatisticsAsync  

Get statistics for multiple users.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsGetMultipleUserStatisticsAsync(  
         XblContextHandle xblContextHandle,  
         uint64_t* xboxUserIds,  
         size_t xboxUserIdsCount,  
         const char* serviceConfigurationId,  
         const char** statisticNames,  
         size_t statisticNamesCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserIds* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
A list of the user Xbox user IDs to get stats for.  
  
*xboxUserIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of Xbox user IDs.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*statisticNames* &nbsp;&nbsp;\_In\_  
Type: char**  
  
A collection of statistic names to lookup.  
  
*statisticNamesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of statistic names.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblUserStatisticsGetMultipleUserStatisticsResultSize](xbluserstatisticsgetmultipleuserstatisticsresultsize.md) and [XblUserStatisticsGetMultipleUserStatisticsResult](xbluserstatisticsgetmultipleuserstatisticsresult.md) upon completion to get the result. Only statistics with values are returned. For example, if you ask for 3 statistic names and only 2 have values, only 2 statistics are returned by the service.
  
## REST Call  
  
V1 POST /batch
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  