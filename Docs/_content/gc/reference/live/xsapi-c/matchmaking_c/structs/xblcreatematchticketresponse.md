---
author: joannaleecy
title: XblCreateMatchTicketResponse
description: Contains information about server response to a create match ticket request.
kindex: XblCreateMatchTicketResponse
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblCreateMatchTicketResponse  

Contains information about server response to a create match ticket request.  

## Syntax  
  
```cpp
typedef struct XblCreateMatchTicketResponse {  
    char matchTicketId[XBL_SCID_LENGTH];  
    int64_t estimatedWaitTime;  
} XblCreateMatchTicketResponse  
```
  
### Members  
  
*matchTicketId*  
Type: char[XBL_SCID_LENGTH]  
  
Ticket ID of a match request.
  
*estimatedWaitTime*  
Type: int64_t  
  
Estimated wait time for a match request to be matched with other players.
  
## Requirements  
  
**Header:** matchmaking_c.h
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  