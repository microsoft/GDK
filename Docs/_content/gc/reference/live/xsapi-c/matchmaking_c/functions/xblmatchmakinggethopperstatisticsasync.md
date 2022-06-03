---
author: joannaleecy
title: XblMatchmakingGetHopperStatisticsAsync
description: Gets statistics about a hopper such as how many players are in it.
kindex: XblMatchmakingGetHopperStatisticsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMatchmakingGetHopperStatisticsAsync  

Gets statistics about a hopper such as how many players are in it.  

## Syntax  
  
```cpp
HRESULT XblMatchmakingGetHopperStatisticsAsync(  
         XblContextHandle xboxLiveContext,  
         const char* serviceConfigurationId,  
         const char* hopperName,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*hopperName* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The name of the hopper to query stats for.  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## REST Call  
  
Calls V103 GET /serviceconfigs/{serviceConfigId}/hoppers/{hopperName}/stats
  
## Requirements  
  
**Header:** matchmaking_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  