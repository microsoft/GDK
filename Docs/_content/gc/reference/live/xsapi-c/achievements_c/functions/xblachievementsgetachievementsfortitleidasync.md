---
author: joannaleecy
title: XblAchievementsGetAchievementsForTitleIdAsync
description: Gets the first page of achievements for a player of the specified title.
kindex: XblAchievementsGetAchievementsForTitleIdAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsGetAchievementsForTitleIdAsync  

Gets the first page of achievements for a player of the specified title.  

## Syntax  
  
```cpp
HRESULT XblAchievementsGetAchievementsForTitleIdAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         uint32_t titleId,  
         XblAchievementType type,  
         bool unlockedOnly,  
         XblAchievementOrderBy orderBy,  
         uint32_t skipItems,  
         uint32_t maxItems,  
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
  
*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The title ID.  
  
*type* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementType](../enums/xblachievementtype.md)  
  
The achievement type to retrieve.  
  
*unlockedOnly* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Indicates whether to return unlocked achievements only.  
  
*orderBy* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementOrderBy](../enums/xblachievementorderby.md)  
  
Controls how the list of achievements is ordered.  
  
*skipItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of achievements to skip.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of achievements the result can contain. Pass 0 to attempt to retrieve all items.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblAchievementsGetAchievementsForTitleIdResult](xblachievementsgetachievementsfortitleidresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V2 GET /users/xuid({xuid})/achievements
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  