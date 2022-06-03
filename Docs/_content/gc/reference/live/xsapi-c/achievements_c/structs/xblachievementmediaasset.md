---
author: joannaleecy
title: XblAchievementMediaAsset
description: Represents a media asset for an achievement.
kindex: XblAchievementMediaAsset
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementMediaAsset  

Represents a media asset for an achievement.  

## Syntax  
  
```cpp
typedef struct XblAchievementMediaAsset {  
    const char* name;  
    XblAchievementMediaAssetType mediaAssetType;  
    const char* url;  
} XblAchievementMediaAsset  
```
  
### Members  
  
*name*  
Type: const char*  
  
The UTF-8 encoded name of the media asset, such as "tile01".
  
*mediaAssetType*  
Type: [XblAchievementMediaAssetType](../enums/xblachievementmediaassettype.md)  
  
The type of media asset.
  
*url*  
Type: const char*  
  
The UTF-8 encoded URL of the media asset.
  
## Member of
  
[XblAchievementReward](xblachievementreward.md)  
[XblAchievement](xblachievement.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  