---
title: "/users/xuid({xuid})/groups/{moniker}/broadcasting/count"
description: " /users/xuid({xuid})/groups/{moniker}/broadcasting/count"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid({xuid})/groups/{moniker}/broadcasting/count
Accesses the count of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI. 
The domain for these URIs is `userpresence.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| string| Xbox User ID (XUID) of the user related to the XUIDs in the Group.| 
| moniker| string| String defining the group of users. The only accepted moniker at present is "People" with an uppercase 'P'.| 
  
<a id="ID4E4B"></a>

 
## Valid methods

[GET (/users/xuid({xuid})/groups/{moniker}/broadcasting/count )](uri-usersxuidgroupsmonikerbroadcastingcountget.md)

&nbsp;&nbsp;Retrieves the count of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI.
 
<a id="ID4EHC"></a>

 
## See also
 
<a id="ID4EJC"></a>

 
##### Parent 

[Presence URIs](atoc-reference-presence.md)

   