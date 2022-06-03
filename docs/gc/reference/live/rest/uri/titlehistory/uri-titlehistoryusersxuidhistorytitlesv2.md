---
title: "/users/xuid({xuid})/history/titles"
description: " /users/xuid({xuid})/history/titles"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/history/titles
 
This Universal Resource Identifier (URI) provides access to a user's Achievement-related title history.
 
The domain for these URIs is `achievements.xboxlive.com`.
 
<a id="ID4E1"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose title history is being accessed.| 
  
<a id="ID4EAC"></a>

 
## Valid methods

[GET](uri-titlehistoryusersxuidhistorytitlesgetv2.md)

&nbsp;&nbsp;Gets a list of titles for which the user has unlocked or made progress on its achievements. This API does not return a user's full history of titles played or launched.
 
<a id="ID4EKC"></a>

 
## See also
 
<a id="ID4EMC"></a>

 
##### Parent 

[Achievement Title History URIs](atoc-reference-titlehistoryv2.md)

   