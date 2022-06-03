---
title: GameSessionSummary (JSON)
description: " GameSessionSummary (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameSessionSummary (JSON)
A JSON object representing summary data for a game session. 
<a id="ID4EN"></a>

  
 
The GameSessionSummary JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| creationTime| DateTime| The date and time when the session was created, in UTC. | 
| customData| array of 8-bit unsigned integers| 1024 bytes of game-specific session data. This value is opaque to the server. | 
| displayName| string| The display name of the game session, with a maximum length of 128 characters. This value is opaque to the server. | 
| hasEnded| Boolean value| True if the session has ended, and false otherwise. Setting this field to true marks the game session as read-only, preventing further data from being submitted to the session. | 
| sessionId| string The session ID. | 
| titleId| 32-bit unsigned integer| The ID of the title creating the game session.| 
| variant| 32-bit signed integer| The game variant. This value is opaque to the server.| 
  
<a id="ID4EID"></a>

 
## Sample JSON syntax
 

```json
{
    "sessionId": "702e5aaf-e7bd-4a7c-abea-9dd4be10edec",
    "titleId": 1297287259,
    "variant": 1,
    "displayName": "Contoso Cards",
    "creationTime": "2011-06-23T17:13:06Z",
    "customData": null,
    "hasEnded": false,
}
    
```

  
<a id="ID4ERD"></a>

 
## See also
 
<a id="ID4ETD"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4E4D"></a>

 
##### Reference 

[GameSession (JSON)](json-gamesession.md)

   