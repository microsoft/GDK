---
title: "/users/xuid({xuid})/achievements/{scid}/{achievementid}"
description: " /users/xuid({xuid})/achievements/{scid}/{achievementid}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/achievements/{scid}/{achievementid}
Returns details about the achievement, including its configured metadata and user-specific data. 

> **Note:**   
> Only supported for the platform. 

 
The domain for these URIs is `achievements.xboxlive.com`.
 
  * [URI parameters](#ID4E2)
 
<a id="ID4E2"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose resource is being accessed. Must match the XUID of the authenticated user.| 
| scid| GUID| Unique identifier of the service configuration whose achievement is being accessed.| 
| achievementid| 32-bit unsigned integer| Unique (within the specified SCID) identifier of the achievement that is being accessed.| 
  
<a id="ID4EMC"></a>

 
## Valid methods

[GET (/users/xuid({xuid})/achievements/{scid}/{achievementid})](uri-usersxuidachievementsscidachievementidget.md)

&nbsp;&nbsp;Gets the details of the Achievement.
 
<a id="ID4EWC"></a>

 
## See also
 
<a id="ID4EYC"></a>

 
##### Parent 

[Achievements URIs](atoc-reference-achievementsv2.md)

   