---
title: "/users/xuid({xuid})/outbox"
description: " /users/xuid({xuid})/outbox"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/outbox
Provides send-only access to a user's messaging outbox for Xbox LIVE Services. 
The domain for these URIs is `msg.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid | unsigned 64-bit integer | The Xbox User ID (XUID) of the player who is making the request. | 
  
<a id="ID4EXB"></a>

 
## Valid methods 

[POST (/users/xuid({xuid})/outbox)](uri-usersxuidoutboxpost.md)

&nbsp;&nbsp;Sends a specified message to a list of recipients. 
 
<a id="ID4EFC"></a>

 
## See also
 
<a id="ID4EHC"></a>

 
##### Parent  

[Users URIs](atoc-reference-users.md)

   