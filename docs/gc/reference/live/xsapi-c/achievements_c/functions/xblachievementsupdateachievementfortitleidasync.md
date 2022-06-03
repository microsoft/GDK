---
author: joannaleecy
title: XblAchievementsUpdateAchievementForTitleIdAsync
description: Allow achievement progress to be updated and achievements to be unlocked.
kindex: XblAchievementsUpdateAchievementForTitleIdAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsUpdateAchievementForTitleIdAsync  

Allow achievement progress to be updated and achievements to be unlocked.  

## Syntax  
  
```cpp
HRESULT XblAchievementsUpdateAchievementForTitleIdAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         const uint32_t titleId,  
         const char* serviceConfigurationId,  
         const char* achievementId,  
         uint32_t percentComplete,  
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
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*achievementId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded achievement ID as defined by XDP or Dev Center.  
  
*percentComplete* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The completion percentage of the achievement to indicate progress. Valid values are from 1 to 100. Set to 100 to unlock the achievement. Progress will be set by the server to the highest value sent.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This API will work even when offline on PC and Xbox One. Offline updates will be posted by the system when connection is re-established even if the title isn't running. The result of the asynchronous operation can be obtained by calling [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the AsyncBlock callback or after the AsyncBlock is complete. If this unexpectedly fails, ensure the SCID is correctly in the XblInitArgs as it is case-sensitive.
  
## REST Call  
  
V2 POST /users/xuid({xuid})/achievements/{scid}/update
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  