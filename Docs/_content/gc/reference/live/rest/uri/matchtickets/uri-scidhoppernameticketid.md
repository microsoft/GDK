---
title: "/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid}"
description: " /serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid}

Supports a DELETE operation for a match ticket.

> **Important:**  
> This URI is intended for use with contract 103 or later, and requires a header element of X-Xbl-Contract-Version: 103 or later on every request.

<a id="ID4ER"></a>


## Domain
momatch.xboxlive.com  
<a id="ID4EW"></a>


## Remarks
This URI supports the values xuid, gt, and me for the owner identifier in configuration of the target user.  
<a id="ID4E2"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| The service configuration identifier (SCID) for the session.|
| name| string| The name of the hopper.|
| ticketId| GUID| The ticket ID.|

<a id="ID4EJC"></a>


## Valid methods

[DELETE (/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid})](uri-scidhoppernameticketiddelete.md)

&nbsp;&nbsp;Removes a match ticket.

<a id="ID4ETC"></a>


## See also

<a id="ID4EVC"></a>


##### Parent  

[Matchmaking URIs](atoc-reference-matchtickets.md)