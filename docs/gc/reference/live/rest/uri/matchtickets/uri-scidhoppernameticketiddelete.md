---
title: DELETE (/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid})
description: " DELETE (/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid})

Removes a match ticket.

> **Important:**  
> This method is intended for use with contract 103 or later, and requires a header element of X-Xbl-Contract-Version: 103 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4E2)
  * [Authorization](#ID4EGB)
  * [HTTP status codes](#ID4EOC)
  * [Request body](#ID4EXC)
  * [Response body](#ID4ECD)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method deletes the specified ticket ID from the named hopper at the service configuration ID (SCID) level. This method can be wrapped by **Microsoft.Xbox.Services.Matchmaking.MatchmakingService.DeleteMatchTicketAsync**.  
<a id="ID4E2"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| The service configuration identifier (SCID) for the session.|
| name| string| The name of the hopper.|
| ticketId| GUID| The ticket ID.|

<a id="ID4EGB"></a>


## Authorization

| Type| Required| Description| Response if missing|
| --- | --- | --- | --- | --- | --- | --- | --- |
| XUID (user ID)| yes| The user making the request must be a member of the ticket session referred to by the ticket.| 403|
| Privileges and Device Type| yes| When the user's deviceType is set to console, only users with the multiplayer privilege in their claims are allowed to make calls to the matchmaking service.| 403|

<a id="ID4EOC"></a>


## HTTP status codes

The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EXC"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4ECD"></a>


## Response body

No objects are sent in the body of the response.

<a id="ID4EPD"></a>


## See also

<a id="ID4ERD"></a>


##### Parent  

[/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid}](uri-scidhoppernameticketid.md)