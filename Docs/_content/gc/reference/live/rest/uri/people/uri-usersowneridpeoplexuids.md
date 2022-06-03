---
title: "/users/{ownerId}/people/xuids"
description: " /users/{ownerId}/people/xuids"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/people/xuids
Accesses people by XUID from caller's people collection. 
The domain for these URIs is `social.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).| 
  
<a id="ID4EOB"></a>

 
## Valid methods

[POST](uri-usersowneridpeoplexuidspost.md)

&nbsp;&nbsp;Gets people by XUID from caller's people collection.
 
<a id="ID4EYB"></a>

 
## See also
 
<a id="ID4E1B"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   