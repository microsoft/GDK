---
author: joannaleecy
title: XblUserStatisticsGetSingleUserStatisticAsync
description: Get a specified statistic for a specified user.
kindex: XblUserStatisticsGetSingleUserStatisticAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsGetSingleUserStatisticAsync  

Get a specified statistic for a specified user.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsGetSingleUserStatisticAsync(  
         XblContextHandle xblContextHandle,  
         uint64_t xboxUserId,  
         const char* serviceConfigurationId,  
         const char* statisticName,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player to get statistics for.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*statisticName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the statistic to return.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblUserStatisticsGetSingleUserStatisticResultSize](xbluserstatisticsgetsingleuserstatisticresultsize.md) and [XblUserStatisticsGetSingleUserStatisticResult](xbluserstatisticsgetsingleuserstatisticresult.md) upon completion to get the result.
  
## REST Call  
  
V1 GET /users/xuid({xuid})/scids/{scid}/stats/{statname1}
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  