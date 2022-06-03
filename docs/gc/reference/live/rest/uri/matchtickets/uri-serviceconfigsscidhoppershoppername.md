---
title: "/serviceconfigs/{scid}/hoppers/{hoppername}"
description: " /serviceconfigs/{scid}/hoppers/{hoppername}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/hoppers/{hoppername}

Supports a POST operation to create match tickets.

> **Important:**  
> This URI is intended for use with contract 103 or later, and requires a header element of X-Xbl-Contract-Version: 103 or later on every request.

<a id="ID4ER"></a>


## Domain
momatch.xboxlive.com  
<a id="ID4EW"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| The service configuration identifier (SCID) for the session.|
| hoppername | string | The name of the hopper. |

<a id="ID4E2B"></a>


## Valid methods

[POST (/serviceconfigs/{scid}/hoppers/{hoppername})](uri-serviceconfigsscidhoppershoppernamepost.md)

&nbsp;&nbsp;Creates the specified match ticket.

<a id="ID4EFC"></a>


## See also

<a id="ID4EHC"></a>


##### Parent  

[Matchmaking URIs](atoc-reference-matchtickets.md)