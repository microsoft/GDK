---
author: joannaleecy
title: XblAchievement
description: Represents an achievement, a system-wide mechanism for directing and rewarding users' in-game actions consistently across all games.
kindex: XblAchievement
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievement  

Represents an achievement, a system-wide mechanism for directing and rewarding users' in-game actions consistently across all games.  

## Syntax  
  
```cpp
typedef struct XblAchievement {  
    const char* id;  
    const char* serviceConfigurationId;  
    const char* name;  
    XblAchievementTitleAssociation* titleAssociations;  
    size_t titleAssociationsCount;  
    XblAchievementProgressState progressState;  
    XblAchievementProgression progression;  
    XblAchievementMediaAsset* mediaAssets;  
    size_t mediaAssetsCount;  
    const char** platformsAvailableOn;  
    size_t platformsAvailableOnCount;  
    bool isSecret;  
    const char* unlockedDescription;  
    const char* lockedDescription;  
    const char* productId;  
    XblAchievementType type;  
    XblAchievementParticipationType participationType;  
    XblAchievementTimeWindow available;  
    XblAchievementReward* rewards;  
    size_t rewardsCount;  
    uint64_t estimatedUnlockTime;  
    const char* deepLink;  
    bool isRevoked;  
} XblAchievement  
```
  
### Members  
  
*id*  
Type: const char*  
  
The UTF-8 encoded achievement ID. Represents a uint.
  
*serviceConfigurationId*  
Type: const char*  
  
The Service Configuration ID (SCID) that is associated with the achievement. The SCID is considered case sensitive so paste it directly from the Partner Center
  
*name*  
Type: const char*  
  
The UTF-8 encoded localized achievement name.
  
*titleAssociations*  
Type: [XblAchievementTitleAssociation*](xblachievementtitleassociation.md)  
  
The game/app titles associated with the achievement.
  
*titleAssociationsCount*  
Type: size_t  
  
The size of **titleAssociations**.
  
*progressState*  
Type: [XblAchievementProgressState](../enums/xblachievementprogressstate.md)  
  
The state of a user's progress towards the earning of the achievement.
  
*progression*  
Type: [XblAchievementProgression](xblachievementprogression.md)  
  
The progression object containing progress details about the achievement, including requirements.
  
*mediaAssets*  
Type: [XblAchievementMediaAsset*](xblachievementmediaasset.md)  
  
The media assets associated with the achievement, such as image IDs.
  
*mediaAssetsCount*  
Type: size_t  
  
The size of **mediaAssets**.
  
*platformsAvailableOn*  
Type: const char**  
  
The UTF-8 encoded collection of platforms that the achievement is available on.
  
*platformsAvailableOnCount*  
Type: size_t  
  
The size of **platformsAvailableOn**.
  
*isSecret*  
Type: bool  
  
Whether or not the achievement is secret.
  
*unlockedDescription*  
Type: const char*  
  
The UTF-8 encoded description of the unlocked achievement.
  
*lockedDescription*  
Type: const char*  
  
The UTF-8 encoded description of the locked achievement.
  
*productId*  
Type: const char*  
  
The UTF-8 encoded product_id the achievement was released with. This is a globally unique identifier that may correspond to an application, downloadable content, etc.
  
*type*  
Type: [XblAchievementType](../enums/xblachievementtype.md)  
  
The type of achievement, such as a challenge achievement.
  
*participationType*  
Type: [XblAchievementParticipationType](../enums/xblachievementparticipationtype.md)  
  
The participation type for the achievement, such as group or individual.
  
*available*  
Type: [XblAchievementTimeWindow](xblachievementtimewindow.md)  
  
The time window during which the achievement is available. Applies to Challenges.
  
*rewards*  
Type: [XblAchievementReward*](xblachievementreward.md)  
  
The collection of rewards that the player earns when the achievement is unlocked.
  
*rewardsCount*  
Type: size_t  
  
The size of **rewards**.
  
*estimatedUnlockTime*  
Type: uint64_t  
  
The estimated time that the achievement takes to be earned.
  
*deepLink*  
Type: const char*  
  
A UTF-8 encoded deep link for clients that enables the title to launch at a desired starting point for the achievement.
  
*isRevoked*  
Type: bool  
  
A value that indicates whether or not the achievement is revoked by enforcement.
  
## Argument of
  
[XblAchievementsResultGetAchievements](../functions/xblachievementsresultgetachievements.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  