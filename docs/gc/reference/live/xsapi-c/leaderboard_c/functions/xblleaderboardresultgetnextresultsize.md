---
author: joannaleecy
title: XblLeaderboardResultGetNextResultSize
description: Get the result size for an XblLeaderboardResultGetNextAsync call.
kindex: XblLeaderboardResultGetNextResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblLeaderboardResultGetNextResultSize  

Get the result size for an XblLeaderboardResultGetNextAsync call.  

## Syntax  
  
```cpp
HRESULT XblLeaderboardResultGetNextResultSize(  
         XAsyncBlock* async,  
         size_t* resultSizeInBytes  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*resultSizeInBytes* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size in bytes required to store the user statistics result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** leaderboard_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  