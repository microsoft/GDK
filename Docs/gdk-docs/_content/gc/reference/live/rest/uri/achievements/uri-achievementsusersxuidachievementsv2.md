---
title: "/users/xuid({xuid})/achievements"
description: " /users/xuid({xuid})/achievements"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/achievements
 
This Universal Resource Identifier (URI) provides access to user achievements.
 
The domain for these URIs is `achievements.xboxlive.com`.
 
<a id="ID4E1"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose (resource) is being accessed. Must match the XUID of the authenticated user.| 
  
<a id="ID4EAC"></a>

 
## Valid methods

[GET](uri-achievementsusersxuidachievementsgetv2.md)

&nbsp;&nbsp;Gets the list of achievements defined on the title, those unlocked by the user, or those the user has in progress.
 
<a id="ID4EKC"></a>

 
## See also
 
<a id="ID4EMC"></a>

 
##### Parent 

[Achievements URIs](atoc-reference-achievementsv2.md)

   