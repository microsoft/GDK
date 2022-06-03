---
title: Multiplayer Activity URIs
description: " Multiplayer Activity URIs"
ms.date: 9/21/2020
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Multiplayer Activity URIs
 
This section provides detail about the Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for the *Multiplayer Activity* system.
 
The domain for these URIs is multiplayeractivity.xboxlive.com.
 
<a id="ID4EPB"></a>

 
## In this section


[/titles/{titleId}/users/{xuid}/activities](swagger-uris/uri-GetActivity.md)
  
Gets the activity for a user playing a specific title. Uses the GET operation. Client and Service callable. 
  
[/titles/{titleId}/users/{xuid}/activities](swagger-uris/uri-UpdateActivity.md)
  
Sets or updates the activity for a user playing a specific title. Uses the POST operation. Client and Service callable. 
  
[/titles/{titleId}/users/{xuid}/activities](swagger-uris/uri-DeleteActivity.md)
  
Deletes the activity for a user playing a specific title. Uses the DELETE operation. Client and Service callable.
  
[/titles/{titleId}/activities/query](swagger-uris/uri-ExternalGetActivityBatch.md)
  
Gets a batch of multiplayer activities for a list of users. Uses the POST operation. Client and Service callable.
  
[/titles/{titleId}/recentplayers](swagger-uris/uri-PostUniRecentPlayers.md)

Appends to or updates a user's list of recent players (unidirectional). Uses the POST operation. Client callable only. 
  
[/titles/{titleId}/recentplayers/server](swagger-uris/uri-PostServerUniRecentPlayers.md)

Appends to or updates a set of users' lists of recent players (unidirectional). This is essentially a batch API of the client API, for servers. Uses the POST operation. Service callable only.  
  
[/titles/{titleId}/recentplayergroups/server](swagger-uris/uri-PostServerRecentPlayerGroup.md)

Appends to or updates all users' recent players within a group (bidirectional). Uses the POST operation. Service callable only.

[/titles/{titleId}/invites](swagger-uris/uri-SendInvite.md)

Send an invite to an Xbox Live user. Uses the POST operation. Client callable only.

[/titles/{titleId}/invites/server](swagger-uris/uri-SendServerInvite.md)

Sends an invite to an Xbox user with the given connection string.  Uses the POST operation. Service callable only.

<a id="ID4EAC"></a>

##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   