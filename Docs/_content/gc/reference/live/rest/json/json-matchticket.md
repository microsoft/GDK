---
title: MatchTicket (JSON)
description: " MatchTicket (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# MatchTicket (JSON)
A JSON object representing a match ticket, used by players to locate other players through the multiplayer session directory (MPSD). 
<a id="ID4EN"></a>

  
 
The MatchTicket JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| serviceConfig| GUID| Service configuration identifier (SCID) for the session.| 
| hopperName| string| Name of the hopper in which this ticket should be placed.| 
| giveUpDuration| 32-bit signed integer| Maximum wait time (integral number of seconds).| 
| preserveSession| enumeration| A value indicating if the session must be reused as the session into which to match. Possible values are "always" or "never". | 
| ticketSessionRef| MultiplayerSessionReference| <b>MultiplayerSessionReference</b> object for the session in which the player or group is currently playing. This member is always required. | 
| ticketAttributes| array of objects| Collection of user-provided attributes and values about the tickets for the players.| 
| players| array of objects| Collection of player objects, each with a property bag of user-provided attributes. | 
  
<a id="ID4EW"></a>

 
## Sample JSON syntax
 

```json
{
        "serviceConfig": "07617C5B-3423-4505-B6C6-10A16E1E5DDB",
        "hopperName": "TestHopper",
        "giveUpDuration": 10,
        "preserveSession": "never",
        "ticketSessionRef": {
        "scid": "AFFEABDF-0000-0000-0000-000000000001",
        "templateName": "TestTemplate",
        "sessionName": "5E551041-0000-0000-0000-000000000001"
    },
    "ticketAttributes": {
        "desiredMap": "Test Map",
        "desiredGameType": "Test GameType"
    },
    "players": [
        {
            "xuid": 123412345123,
            "playerAttributes": {
                "skill": 5,
                "ageRange": "teenager"
            }
        },
        {
          "xuid": 123412345124,
          "playerAttributes": {
              "skill": 15,
              "ageRange": "twenty-something"
          }
        }
      ]
    }
  
    
```

  
<a id="ID4EEB"></a>

 
## See also
 
<a id="ID4EGB"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   