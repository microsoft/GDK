---
author: joannaleecy
title: XblLeaderboardResult
description: Represents the results of a leaderboard request.
kindex: XblLeaderboardResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLeaderboardResult  

Represents the results of a leaderboard request.  

## Syntax  
  
```cpp
typedef struct XblLeaderboardResult {  
    uint32_t totalRowCount;  
    XblLeaderboardColumn* columns;  
    size_t columnsCount;  
    XblLeaderboardRow* rows;  
    size_t rowsCount;  
    bool hasNext;  
    XblLeaderboardQuery nextQuery;  
} XblLeaderboardResult  
```
  
### Members  
  
*totalRowCount*  
Type: uint32_t  
  
The total number of rows in the leaderboard results.
  
*columns*  
Type: [XblLeaderboardColumn*](xblleaderboardcolumn.md)  
  
The collection of columns in the leaderboard results.
  
*columnsCount*  
Type: size_t  
  
The number of **columns**.
  
*rows*  
Type: [XblLeaderboardRow*](xblleaderboardrow.md)  
  
The collection of rows in the leaderboard results.
  
*rowsCount*  
Type: size_t  
  
The number of **rows**.
  
*hasNext*  
Type: bool  
  
Indicates whether there is a next page of results.
  
*nextQuery*  
Type: [XblLeaderboardQuery](xblleaderboardquery.md)  
  
The next query. Internal use only.
  
## Argument of
  
[XblLeaderboardGetLeaderboardResult](../functions/xblleaderboardgetleaderboardresult.md)  
[XblLeaderboardResultGetNextAsync](../functions/xblleaderboardresultgetnextasync.md)  
[XblLeaderboardResultGetNextResult](../functions/xblleaderboardresultgetnextresult.md)
  
## Requirements  
  
**Header:** leaderboard_c.h
  
## See also  
[leaderboard_c](../leaderboard_c_members.md)  
  
  