---
author: joannaleecy
title: matchmaking_c (contents)
description: Matchmaking C API
kindex: matchmaking_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# matchmaking_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblPreserveSessionMode](enums/xblpreservesessionmode.md) | Defines values used to indicate whether a match ticket is for a new game session or an existing session. |  
| [XblTicketStatus](enums/xblticketstatus.md) | Defines values used to indicate the status of the match request. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblMatchmakingCreateMatchTicketAsync](functions/xblmatchmakingcreatematchticketasync.md) | Sends a matchmaking request to the server and returns the match ticket with a ticket id. Call XblMatchmakingCreateMatchTicketResult upon completion to get the result. |  
| [XblMatchmakingCreateMatchTicketResult](functions/xblmatchmakingcreatematchticketresult.md) | Get the result for an XblMatchmakingCreateMatchTicketAsync call. |  
| [XblMatchmakingDeleteMatchTicketAsync](functions/xblmatchmakingdeletematchticketasync.md) | Deletes a the match ticket on the server. |  
| [XblMatchmakingGetHopperStatisticsAsync](functions/xblmatchmakinggethopperstatisticsasync.md) | Gets statistics about a hopper such as how many players are in it. |  
| [XblMatchmakingGetHopperStatisticsResult](functions/xblmatchmakinggethopperstatisticsresult.md) | Get the result for an XblMatchmakingGetHopperStatisticsAsync call. |  
| [XblMatchmakingGetHopperStatisticsResultSize](functions/xblmatchmakinggethopperstatisticsresultsize.md) | Get the result size for an XblMatchmakingGetHopperStatisticsAsync call. |  
| [XblMatchmakingGetMatchTicketDetailsAsync](functions/xblmatchmakinggetmatchticketdetailsasync.md) | Retrieves the properties of a match ticket from the server. |  
| [XblMatchmakingGetMatchTicketDetailsResult](functions/xblmatchmakinggetmatchticketdetailsresult.md) | Get the result for an XblMatchmakingGetMatchTicketDetailsAsync call. |  
| [XblMatchmakingGetMatchTicketDetailsResultSize](functions/xblmatchmakinggetmatchticketdetailsresultsize.md) | Get the result size for an XblMatchmakingGetMatchTicketDetailsAsync call. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblCreateMatchTicketResponse](structs/xblcreatematchticketresponse.md) | Contains information about server response to a create match ticket request. |  
| [XblHopperStatisticsResponse](structs/xblhopperstatisticsresponse.md) | Represents a server response to a hopper statistics request. |  
| [XblMatchTicketDetailsResponse](structs/xblmatchticketdetailsresponse.md) | Represents a server response to a request for match ticket details. |  
