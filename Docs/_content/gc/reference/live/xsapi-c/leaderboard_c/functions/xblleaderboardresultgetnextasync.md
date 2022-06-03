---
author: joannaleecy
title: XblLeaderboardResultGetNextAsync
description: Gets the result of next page of the leaderboard for a player of the specified title.
kindex: XblLeaderboardResultGetNextAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblLeaderboardResultGetNextAsync  

Gets the result of next page of the leaderboard for a player of the specified title.  

## Syntax  
  
```cpp
HRESULT XblLeaderboardResultGetNextAsync(  
         XblContextHandle xboxLiveContext,  
         XblLeaderboardResult* leaderboardResult,  
         uint32_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*leaderboardResult* &nbsp;&nbsp;\_In\_  
Type: [XblLeaderboardResult*](../structs/xblleaderboardresult.md)  
  
The leaderboard result from a previous call to XblLeaderboardGetLeaderboardResult.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of items that the result can contain. Pass 0 to attempt to retrieve all items.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblLeaderboardResultGetNextResult](xblleaderboardresultgetnextresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## Requirements  
  
**Header:** leaderboard_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  