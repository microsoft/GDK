---
author: joannaleecy
title: XblAchievementsGetAchievementAsync
description: Gets an achievement for a player with a specific achievement ID.
kindex: XblAchievementsGetAchievementAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsGetAchievementAsync  

Gets an achievement for a player with a specific achievement ID.  

## Syntax  
  
```cpp
HRESULT XblAchievementsGetAchievementAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         const char* serviceConfigurationId,  
         const char* achievementId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*achievementId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded unique identifier of the Achievement as defined by XDP or Dev Center.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblAchievementsGetAchievementResult](xblachievementsgetachievementresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V2 GET /users/xuid({xuid})/achievements/{scid}/{achievementId}
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  