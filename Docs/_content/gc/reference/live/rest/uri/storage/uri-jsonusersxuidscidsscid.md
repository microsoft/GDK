---
title: "/json/users/xuid({xuid})/scids/{scid}"
description: " /json/users/xuid({xuid})/scids/{scid}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /json/users/xuid({xuid})/scids/{scid}
Retrieves quota information for this storage type. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| unsigned 64-bit integer| The Xbox User ID (XUID) of the player who making the request.| 
| scid| guid| the ID of the service config to look up.| 
  
<a id="ID4E3B"></a>

 
## Valid methods

[GET](uri-jsonusersxuidscidsscid-get.md)

&nbsp;&nbsp;Retrieves quota information for this storage type. 
 
<a id="ID4EGC"></a>

 
## See also
 
<a id="ID4EIC"></a>

 
##### Parent 

[Title Storage URIs](atoc-reference-storagev2.md)

   