---
title: "/users/xuid({xuid})/scids/{scid}/stats/{statname)/people/{all|favorite}"
description: " /users/xuid({xuid})/scids/{scid}/stats/{statname)/people/{all|favorite}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/scids/{scid}/stats/{statname)/people/{all|favorite}
Accesses a social (ranked) leaderboard.
The domain for these URIs is `leaderboards.xboxlive.com`.

  * [URI parameters](#ID4EV)

<a id="ID4EV"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid| string| Identifier of the user.|
| scid| string| Identifier of the service configuration that contains the resource being accessed.|
| statname| string| Unique identifier of the user stat resource being accessed.|
| all\|favorite| enumeration| Whether to rank the stat values (scores) for all known contacts of the current user or only those contacts designated as favorite people by that user.|

<a id="ID4EOC"></a>


## Valid methods

[GET (/users/xuid({xuid})/scids/{scid}/stats/{statname)/people/{all\|favorite})](uri-usersxuidscidstatnamepeopleget.md)

&nbsp;&nbsp;Returns a social leaderboard by ranking the stat values (scores) for either all known contacts of the current user or only those contacts designated as favorite people by that user.

<a id="ID4EYC"></a>


## See also

<a id="ID4E1C"></a>


##### Parent

[Leaderboards URIs](atoc-reference-leaderboard.md)