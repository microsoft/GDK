---
author: joannaleecy
title: XblAchievementsManagerUpdateAchievement
description: Allow achievement progress to be updated and achievements to be unlocked.
kindex: XblAchievementsManagerUpdateAchievement
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsManagerUpdateAchievement  

Allow achievement progress to be updated and achievements to be unlocked.  

## Syntax  
  
```cpp
HRESULT XblAchievementsManagerUpdateAchievement(  
         uint64_t xboxUserId,  
         const char* achievementId,  
         uint8_t currentProgess  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player.  
  
*achievementId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The UTF-8 encoded achievement ID as defined by Dev Center.  
  
*currentProgess* &nbsp;&nbsp;\_In\_  
Type: uint8_t  
  
The completion percentage of the achievement to indicate progress. Valid values are from 1 to 100. Set to 100 to unlock the achievement. Progress will be set by the server to the highest value sent.    
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This API will work even when offline on PC and Xbox consoles. Offline updates will be posted by the system when connection is re-established even if the title isn't running. The result of the operation will not be represented locally immediately. The earliest the update will be reflected will be after the next frame's call to DoWork. Once the change is reflected, the array returned by DoWork will contain a [XblAchievementsManagerEvent](../structs/xblachievementsmanagerevent.md) of with an event type of AchievementProgressUpdated, and potentially an additional event of type AchievementUnlocked if the new progress resulted in unlocking the achievement. If the achievement has already been unlocked or the progress value is less than or equal to what is cached from the server, this function will return E_NOT_VALID_STATE or E_INVALIDARG respectively. Only title based achievements may be updated with this function. Event based achievements cannot be updated with this function.
  
## REST Call  
  
V2 POST /users/xuid({xuid})/achievements/{scid}/update
  
## Requirements  
  
**Header:** achievements_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_manager_c](../achievements_manager_c_members.md)  
  
  