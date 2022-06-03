---
author: joannaleecy
title: XblLeaderboardQuery
description: Represents the parameters for submitting a leaderboard query using event-based or title-based stats.
kindex: XblLeaderboardQuery
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardQuery  

Represents the parameters for submitting a leaderboard query using event-based or title-based stats.  

## Syntax  
  
```cpp
typedef struct XblLeaderboardQuery {  
    uint64_t xboxUserId;  
    char scid[XBL_SCID_LENGTH];  
    const char* leaderboardName;  
    const char* statName;  
    XblSocialGroupType socialGroup;  
    const char** additionalColumnleaderboardNames;  
    size_t additionalColumnleaderboardNamesCount;  
    XblLeaderboardSortOrder order;  
    uint32_t maxItems;  
    uint64_t skipToXboxUserId;  
    uint32_t skipResultToRank;  
    const char* continuationToken;  
    XblLeaderboardQueryType queryType;  
} XblLeaderboardQuery  
```
  
### Members  
  
*xboxUserId*  
Type: uint64_t  
  
Optional Xbox user ID of the requesting user. If doing a global leaderboard, then set to 0.
  
*scid*  
Type: char[XBL_SCID_LENGTH]  
  
The UTF-8 encoded service configuration ID (SCID) of the title.
  
*leaderboardName*  
Type: const char*  
  
Optional UTF-8 encoded leaderboard name to get a leaderboard for. Set to nullptr if querying a social leaderboard or a title managed stat backed leaderboard.
  
*statName*  
Type: const char*  
  
Optional UTF-8 encoded statistic name to get a leaderboard for. Used when querying a social leaderboard or title managed stat backed leaderboard.
  
*socialGroup*  
Type: [XblSocialGroupType](../enums/xblsocialgrouptype.md)  
  
Optional the social group of users to get leaderboard results. For example, to get a "friends only" leaderboard. Set to XblSocialGroupType_None to get a global leaderboard.
  
*additionalColumnleaderboardNames*  
Type: const char**  
  
Optional UTF-8 encoded array of names of stats for the additional columns.
  
*additionalColumnleaderboardNamesCount*  
Type: size_t  
  
Optional count of additionalColumnleaderboardNames passed in.
  
*order*  
Type: [XblLeaderboardSortOrder](../enums/xblleaderboardsortorder.md)  
  
Set sort order for the resulting leaderboard.
  
*maxItems*  
Type: uint32_t  
  
Set maximum items that the resulting leaderboard will contain. Set to 0 to let the service return the default number of max items.
  
*skipToXboxUserId*  
Type: uint64_t  
  
Set the resulting leaderboard will start with the user that requested the leaderboard. Set to 0 to not skip to a user.
  
*skipResultToRank*  
Type: uint32_t  
  
Set which rank the resulting leaderboard will start at. Set 0 to not skip to a specific rank.
  
*continuationToken*  
Type: const char*  
  
The UTF-8 encoded continuationToken used to get the next set of leaderboard data.
  
*queryType*  
Type: [XblLeaderboardQueryType](../enums/xblleaderboardquerytype.md)  
  
The type of leaderboard to query for.
  
## Member of
  
[XblLeaderboardResult](xblleaderboardresult.md)
  
## Argument of
  
[XblLeaderboardGetLeaderboardAsync](../functions/xblleaderboardgetleaderboardasync.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  