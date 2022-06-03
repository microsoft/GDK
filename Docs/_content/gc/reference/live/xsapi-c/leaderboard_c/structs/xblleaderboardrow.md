---
author: joannaleecy
title: XblLeaderboardRow
description: Represents a row in a collection of leaderboard items.
kindex: XblLeaderboardRow
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardRow  

Represents a row in a collection of leaderboard items.  

## Syntax  
  
```cpp
typedef struct XblLeaderboardRow {  
    char gamertag[XBL_GAMERTAG_CHAR_SIZE];  
    char modernGamertag[XBL_MODERN_GAMERTAG_CHAR_SIZE];  
    char modernGamertagSuffix[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE];  
    char uniqueModernGamertag[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE];  
    uint64_t xboxUserId;  
    double percentile;  
    uint32_t rank;  
    uint32_t globalRank;  
    const char** columnValues;  
    size_t columnValuesCount;  
} XblLeaderboardRow  
```
  
### Members  
  
*gamertag*  
Type: char[XBL_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded gamertag of the player.
  
*modernGamertag*  
Type: char[XBL_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded modern gamertag for the player. Not guaranteed to be unique.
  
*modernGamertagSuffix*  
Type: char[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE]  
  
The UTF-8 encoded suffix appended to modern gamertag to ensure uniqueness. May be empty in some cases.
  
*uniqueModernGamertag*  
Type: char[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded unique modern gamertag and suffix. Format will be "modernGamertag#suffix". Guaranteed to be no more than 16 rendered characters.
  
*xboxUserId*  
Type: uint64_t  
  
The Xbox user ID of the player.
  
*percentile*  
Type: double  
  
The percentile rank of the player.
  
*rank*  
Type: uint32_t  
  
The rank of the player.
  
*globalRank*  
Type: uint32_t  
  
The global rank of the player. If globalrank is 0, then the user has no global rank.
  
*columnValues*  
Type: const char**  
  
UTF-8 encoded JSON values for each column in the leaderboard row for the player.
  
*columnValuesCount*  
Type: size_t  
  
The count of string in socialNetworks array.
  
## Member of
  
[XblLeaderboardResult](xblleaderboardresult.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  