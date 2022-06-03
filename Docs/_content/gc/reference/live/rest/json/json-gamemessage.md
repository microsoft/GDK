---
title: GameMessage (JSON)
description: " GameMessage (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameMessage (JSON)
A JSON object defining data for a message in a game session's message queue. 
<a id="ID4EN"></a>

  
 
The GameMessage JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| data| array of 8-bit unsigned integers| The Base64-encoded data that the game client wants to send to the other game clients. This value is opaque to the server. | 
| senderXuid| 64-bit unsigned integer| The Xbox user ID of the player sending the message. | 
| sequenceNumber| 32-bit signed integer| The sequence number of the game message. This value is assigned by the server. Sequence numbers are guaranteed to be monotonically increasing, but might not be consecutive. Sequence numbers are unique within a message queue, but not between message queues. | 
| queueIndex| 32-bit signed integer| The index of the session message queue for the message. Possible values are 0-3.| 
| timeStamp| DateTime| Time when the game message was created in the queue by the server, in UTC. | 
  
<a id="ID4ERC"></a>

 
## Sample JSON syntax
 

```json
{
    "queueIndex": 0,
    "sequenceNumber": 5,
    "senderXuid": 65536,
    "timestamp": "2011-06-23T18:49:50Z",
    "data": null
}
    
```

  
<a id="ID4E1C"></a>

 
## See also
 
<a id="ID4E3C"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EGD"></a>

 
##### Reference 

[GameSession (JSON)](json-gamesession.md)

   