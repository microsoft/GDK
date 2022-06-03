---
title: Presence URIs
description: " Presence URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Presence URIs
 
This section provides detail about the Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for *presence*.
 
Only games running on an Xbox 360, on a Windows Phone device, or on Windows can use this service.
 
The domain for these URIs is userpresence.xboxlive.com.
 
You can subscribe to a user's presence changes by using the Real Time Activity (RTA) service.
 
<a id="ID4ERB"></a>

 
## In this section

[/users/batch](uri-usersbatch.md)

&nbsp;&nbsp;Access presence for a batch of users.

[/users/me](uri-usersme.md)

&nbsp;&nbsp;Access the current user's presence.

[/users/me/groups/{moniker}](uri-usersmegroupsmoniker.md)

&nbsp;&nbsp;Accesses the PresenceRecord for my group.

[/users/xuid({xuid})](uri-usersxuid.md)

&nbsp;&nbsp;Access the presence of another user or client.

[/users/xuid({xuid})/devices/current/titles/current](uri-usersxuiddevicescurrenttitlescurrent.md)

&nbsp;&nbsp;Access the presence of a title or a title's user.

[/users/xuid({xuid})/groups/{moniker}](uri-usersxuidgroupsmoniker.md)

&nbsp;&nbsp;Accesses the PresenceRecord for a group.

[/users/xuid({xuid})/groups/{moniker}/broadcasting](uri-usersxuidgroupsmonikerbroadcasting.md)

&nbsp;&nbsp;Accesses the presence record of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI.

[/users/xuid({xuid})/groups/{moniker}/broadcasting/count](uri-usersxuidgroupsmonikerbroadcastingcount.md)

&nbsp;&nbsp;Accesses the count of the broadcasting users specified by the groups moniker related to the XUID that appears in the URI.
 
<a id="ID4EMC"></a>

 
## See also
 
<a id="ID4EOC"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   