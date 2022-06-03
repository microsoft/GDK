---
author: joannaleecy
title: XblTicketStatus
description: Defines values used to indicate the status of the match request.
kindex: XblTicketStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTicketStatus  

Defines values used to indicate the status of the match request.    

## Syntax  
  
```cpp
enum class XblTicketStatus  : uint32_t  
{  
    Unknown,  
    Expired,  
    Searching,  
    Found,  
    Canceled  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The status of the match request has not been returned by the server yet or the server returned an unrecognized response. |  
| Expired | Matchmaking has not found a match and the search request has expired according to its give up duration. |  
| Searching | Matchmaking has not found a match yet and it is still searching. |  
| Found | Matchmaking has found a match and the ticket contains a reference to the session that is to be created. |  
| Canceled | Matchmaking has been canceled for this ticket. |  
  
## Requirements  
  
**Header:** matchmaking_c.h
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  