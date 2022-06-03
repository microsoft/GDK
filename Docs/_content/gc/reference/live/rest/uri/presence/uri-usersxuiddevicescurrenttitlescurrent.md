---
title: "/users/xuid({xuid})/devices/current/titles/current"
description: " /users/xuid({xuid})/devices/current/titles/current"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/devices/current/titles/current
Access the presence of a title or a title's user. 
The domain for these URIs is `userpresence.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the target user.| 
  
<a id="ID4EUB"></a>

 
## Valid methods

[DELETE (/users/xuid({xuid})/devices/current/titles/current)](uri-usersxuiddevicescurrenttitlescurrentdelete.md)

&nbsp;&nbsp;Remove the presence of a closing title, instead of waiting for the [PresenceRecord](../../json/json-presencerecord.md) to expire.

[POST (/users/xuid({xuid})/devices/current/titles/current)](uri-usersxuiddevicescurrenttitlescurrentpost.md)

&nbsp;&nbsp;Update a title with a user's presence.
 
<a id="ID4EBC"></a>

 
## See also
 
<a id="ID4EDC"></a>

 
##### Parent 

[Presence URIs](atoc-reference-presence.md)

   