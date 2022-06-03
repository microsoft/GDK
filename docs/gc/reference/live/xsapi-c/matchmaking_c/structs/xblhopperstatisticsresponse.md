---
author: joannaleecy
title: XblHopperStatisticsResponse
description: Represents a server response to a hopper statistics request.
kindex: XblHopperStatisticsResponse
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblHopperStatisticsResponse  

Represents a server response to a hopper statistics request.  

## Syntax  
  
```cpp
typedef struct XblHopperStatisticsResponse {  
    char* hopperName;  
    int64_t estimatedWaitTime;  
    uint32_t playersWaitingToMatch;  
} XblHopperStatisticsResponse  
```
  
### Members  
  
*hopperName*  
Type: char*  
  
Name of the hopper in which a match was requested.
  
*estimatedWaitTime*  
Type: int64_t  
  
Estimated wait time for a match request to be matched with other players.
  
*playersWaitingToMatch*  
Type: uint32_t  
  
The number of players in the hopper waiting to be matched.
  
## Requirements  
  
**Header:** matchmaking_c.h
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  