---
author: joannaleecy
title: leaderboard_c (contents)
description: Leaderboard C API
kindex: leaderboard_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# leaderboard_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblLeaderboardSortOrder](enums/xblleaderboardsortorder.md) | The order to sort the leaderboard in. |  
| [XblLeaderboardStatType](enums/xblleaderboardstattype.md) | Enumerates the data type of a leaderboard statistic. |  
| [XblSocialGroupType](enums/xblsocialgrouptype.md) | Predefined Xbox Live social groups. |  
| [XblLeaderboardQueryType](enums/xblleaderboardquerytype.md) | Enum used to specify the type of leaderboard in a Leaderboard query. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblLeaderboardGetLeaderboardAsync](functions/xblleaderboardgetleaderboardasync.md) | Get a leaderboard for a title using event-based or title-based stats. |  
| [XblLeaderboardGetLeaderboardResult](functions/xblleaderboardgetleaderboardresult.md) | Get the result for an XblLeaderboardGetLeaderboardAsync call. |  
| [XblLeaderboardGetLeaderboardResultSize](functions/xblleaderboardgetleaderboardresultsize.md) | Get the result size for an XblLeaderboardGetLeaderboardAsync call. |  
| [XblLeaderboardResultGetNextAsync](functions/xblleaderboardresultgetnextasync.md) | Gets the result of next page of the leaderboard for a player of the specified title. |  
| [XblLeaderboardResultGetNextResult](functions/xblleaderboardresultgetnextresult.md) | Get the result for an XblLeaderboardResultGetNextAsync call. |  
| [XblLeaderboardResultGetNextResultSize](functions/xblleaderboardresultgetnextresultsize.md) | Get the result size for an XblLeaderboardResultGetNextAsync call. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblLeaderboardColumn](structs/xblleaderboardcolumn.md) | Represents a column in a collection of leaderboard items. |  
| [XblLeaderboardQuery](structs/xblleaderboardquery.md) | Represents the parameters for submitting a leaderboard query using event-based or title-based stats. |  
| [XblLeaderboardResult](structs/xblleaderboardresult.md) | Represents the results of a leaderboard request. |  
| [XblLeaderboardRow](structs/xblleaderboardrow.md) | Represents a row in a collection of leaderboard items. |  
