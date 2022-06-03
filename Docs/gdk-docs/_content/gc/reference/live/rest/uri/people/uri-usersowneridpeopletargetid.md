---
title: "/users/{ownerId}/people/{targetid}"
description: " /users/{ownerId}/people/{targetid}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{ownerId}/people/{targetid}
Accesses a person by target ID from caller's people collection. 
The domain for these URIs is `social.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| ownerId| string| Identifier of the user whose resource is being accessed. Must match the authenticated user. The possible values are "me", xuid({xuid}), or gt({gamertag}).| 
| targetid| string| Identifier of the user whose data is being retrieved from the owner's People list, either an Xbox User ID (XUID) or a gamertag. Example values: xuid(2603643534573581), gt(SomeGamertag).| 
  
<a id="ID4EQB"></a>

 
## Valid methods

[GET](uri-usersowneridpeopletargetidget.md)

&nbsp;&nbsp;Gets a person by target ID from caller's people collection.
 
<a id="ID4E1B"></a>

 
## See also
 
<a id="ID4E3B"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   