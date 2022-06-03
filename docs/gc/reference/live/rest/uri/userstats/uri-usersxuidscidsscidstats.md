---
title: "/users/xuid({xuid})/scids/{scid}/stats"
description: " /users/xuid({xuid})/scids/{scid}/stats"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/scids/{scid}/stats
Accesses a service configuration scoped by a comma-delimited list of user statistic names on behalf of the specified user. 
The domain for these URIs is `userstats.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| GUID| Xbox User ID (XUID) of the user on whose behalf to access the service configuration.| 
| scid| GUID| Identifier of the service configuration that contains the resource being accessed.| 
  
<a id="ID4E4B"></a>

 
## Valid methods

[GET](uri-usersxuidscidsscidstatsget.md)

&nbsp;&nbsp;Gets a service configuration scoped by a comma-delimited list of user statistic names on behalf of the specified user.

[GET with value metadata](uri-usersxuidscidsscidstatsgetvaluemetadata.md)

&nbsp;&nbsp;Gets a list of specified statistics, including metadata associated with the statistic values, for a user in a specified service configuration.
 
<a id="ID4EKC"></a>

 
## See also
 
<a id="ID4EMC"></a>

 
##### Parent 

[User Statistics URIs](atoc-reference-userstats.md)

   