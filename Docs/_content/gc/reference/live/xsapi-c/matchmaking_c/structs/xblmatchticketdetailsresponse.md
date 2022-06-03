---
author: joannaleecy
title: XblMatchTicketDetailsResponse
description: Represents a server response to a request for match ticket details.
kindex: XblMatchTicketDetailsResponse
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMatchTicketDetailsResponse  

Represents a server response to a request for match ticket details.  

## Syntax  
  
```cpp
typedef struct XblMatchTicketDetailsResponse {  
    XblTicketStatus matchStatus;  
    int64_t estimatedWaitTime;  
    XblPreserveSessionMode preserveSession;  
    XblMultiplayerSessionReference ticketSession;  
    XblMultiplayerSessionReference targetSession;  
    char* ticketAttributes;  
} XblMatchTicketDetailsResponse  
```
  
### Members  
  
*matchStatus*  
Type: [XblTicketStatus](../enums/xblticketstatus.md)  
  
Status of a match request.
  
*estimatedWaitTime*  
Type: int64_t  
  
Estimated wait time for a match request to be matched with other players.
  
*preserveSession*  
Type: [XblPreserveSessionMode](../enums/xblpreservesessionmode.md)  
  
An enum value to specify whether the match should preserve the session on which the match has been requested.
  
*ticketSession*  
Type: XblMultiplayerSessionReference  
  
The session on which the match was requested.
  
*targetSession*  
Type: XblMultiplayerSessionReference  
  
The session on which a match request has been found.
  
*ticketAttributes*  
Type: char*  
  
The attributes of a match request.
  
## Requirements  
  
**Header:** matchmaking_c.h
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  