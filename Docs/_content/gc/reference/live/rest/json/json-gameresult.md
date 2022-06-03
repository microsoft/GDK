---
title: GameResult (JSON)
description: " GameResult (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameResult (JSON)
A JSON object representing data that describes the results of a game session. 
<a id="ID4EN"></a>

  
 
The GameResult JSON object has the following members.
 
| Member| Type| Description| 
| --- | --- | --- | 
| blob| array of 8-bit unsigned integers| Custom title-specific result data.| 
| outcome| string| The outcome of the player's participation in the game session. Valid values are "Win", "Loss", or "Tie". | 
| score| 64-bit signed integer| The score that the player received in the game session.| 
| time| 64-bit signed integer| The player's time for the game session.| 
| xuid| 64-bit unsigned integer| The Xbox user ID of the player to whom the results apply.| 
  
<a id="ID4EPC"></a>

 
## Sample JSON syntax
 

```json
{
   "xuid": 2533274790412952,
   "outcome": "Win",
   "score": 100
}
    
```

  
<a id="ID4EYC"></a>

 
## See also
 
<a id="ID4E1C"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   