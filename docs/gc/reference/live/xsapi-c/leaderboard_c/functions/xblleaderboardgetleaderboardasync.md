---
author: joannaleecy
title: XblLeaderboardGetLeaderboardAsync
description: Get a leaderboard for a title using event-based or title-based stats.
kindex: XblLeaderboardGetLeaderboardAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLeaderboardGetLeaderboardAsync  

Get a leaderboard for a title using event-based or title-based stats.  

## Syntax  
  
```cpp
HRESULT XblLeaderboardGetLeaderboardAsync(  
         XblContextHandle xboxLiveContext,  
         XblLeaderboardQuery leaderboardQuery,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*leaderboardQuery* &nbsp;&nbsp;\_In\_  
Type: [XblLeaderboardQuery](../structs/xblleaderboardquery.md)  
  
The query parameters of the leaderboard request.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## REST Call  
  
V4 GET https: // leaderboards.xboxlive.com/users/xuid({xuid})/scids/{scid}/stats/{statname}/people/{all|favorites}[?sort=descending|ascending]&amp;skipToUser={skipToUser}
  
## Requirements  
  
**Header:** leaderboard_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  