---
author: joannaleecy
title: XblAchievementsUpdateAchievementAsync
description: Allow achievement progress to be updated and achievements to be unlocked.
kindex: XblAchievementsUpdateAchievementAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsUpdateAchievementAsync  

Allow achievement progress to be updated and achievements to be unlocked.  

## Syntax  
  
```cpp
HRESULT XblAchievementsUpdateAchievementAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
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
  
*achievementId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded achievement ID as defined by XDP or Dev Center.  
  
*percentComplete* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The completion percentage of the achievement to indicate progress. Valid values are from 1 to 100. Set to 100 to unlock the achievement. Progress will be set by the server to the highest value sent  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This API will work even when offline on PC and Xbox One. Offline updates will be posted by the system when connection is re-established even if the title isn't running. The result of the asynchronous operation can be obtained by calling [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the AsyncBlock callback or after the AsyncBlock is complete. If the achievement has already been unlocked or the progress value is less than or equal to what is currently recorded on the server, then XAsyncGetStatus() inside the callback will return HTTP_E_STATUS_NOT_MODIFIED (0x80190130L).
  
## REST Call  
  
V2 POST /users/xuid({xuid})/achievements/{scid}/update
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  