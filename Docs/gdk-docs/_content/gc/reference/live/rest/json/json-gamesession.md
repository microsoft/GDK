---
title: GameSession (JSON)
description: " GameSession (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameSession (JSON)
A JSON object representing game data for a multiplayer session. 
<a id="ID4ER"></a>

  
 
The GameSession JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| creationTime| DateTime| The date and time when the session was created, in UTC. | 
| customData| array of 8-bit unsigned integers| 1024 bytes of game-specific session data. This value is opaque to the server. | 
| displayName| string| The display name of the game session, with a maximum length of 128 characters. This value is opaque to the server. | 
| hasEnded| Boolean value| True if the session has ended, and false otherwise. Setting this field to true marks the game session as read-only, preventing further data from being submitted to the session. | 
| isClosed| Boolean value| True if the session is closed and no more players can be added, and false otherwise. If this value is true, requests to join the session are rejected. | 
| maxPlayers| 32-bit signed integer| Maximum number of players that can be in the session concurrently. The range of values is 2-16. Once the session contains the maximum number of players, further requests to join the session are rejected. | 
| playersCanBeRemovedBy| PlayerAcl| A value that indicates the player who is allowed to remove other players from the session. Possible values are NoOne, Self, and AnyPlayer. | 
| roster| array of player objects| An array of players in the session. The roster contains current players and players who were previously in the session, but have left. The order of players in the roster never changes. New players are added to the end of the array. | 
| seatsAvailable| 32-bit signed integer| The number of players who can still join the session before the maximum number of players is reached. This value is read-only, and is always less than the value of the maxPlayers field. | 
| sessionId| string| The session ID assigned by the MPSD when the session is created. This value is usually included in the URI when accessing the information stored in a session.| 
| titleId| 32-bit unsigned integer| The ID of the title creating the game session.| 
| variant| 32-bit signed integer| The game variant. This value is opaque to the server.| 
| visibility| VisibilityLevel| A value that indicates session visibility. Possible values are: PlayersCurrentlyInSession, PlayersEverInSession, and Everyone.| 
  
<a id="ID4EEF"></a>

 
## Sample JSON syntax
 

```json
{
    "sessionId": "702e5aaf-e7bd-4a7c-abea-9dd4be10edec",
    "titleId": 1297287259,
    "variant": 1,
    "displayName": "Contoso Cards",
    "creationTime": "2011-06-23T17:13:06Z",
    "customData": null,
    "maxPlayers": 4,
    "seatsAvailable": 4,
    "isClosed": false,
    "hasEnded": false,
    "roster": [],
    "visibility": "PlayersCurrentlyInSession",
    "playersCanBeRemovedBy": "Self",
 }
    
```

  
<a id="ID4ENF"></a>

 
## See also
 
<a id="ID4EPF"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EZF"></a>

 
##### Reference 

[GameMessage (JSON)](json-gamemessage.md)

 [GameSessionSummary (JSON)](json-gamesessionsummary.md)

 [Player (JSON)](json-player.md)

   