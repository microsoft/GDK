---
title: "/users/{ownerId}/people"
description: " /users/{ownerId}/people"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/people
Accesses caller's people collection. 
The domain for these URIs is `social.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).| 
  
<a id="ID4EOB"></a>

 
## Valid methods

[GET](uri-usersowneridpeopleget.md)

&nbsp;&nbsp;Gets caller's people collection.
 
<a id="ID4EYB"></a>

 
## See also
 
<a id="ID4E1B"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   