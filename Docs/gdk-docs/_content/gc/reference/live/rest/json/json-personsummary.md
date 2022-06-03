---
title: PersonSummary (JSON)
description: " PersonSummary (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PersonSummary (JSON)
Collection of [Person (JSON)](json-person.md) objects. 
<a id="ID4ER"></a>

 
## PersonSummary
 
The PersonSummary object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| hasCallerMarkedTargetAsFavorite| Boolean value| Whether the caller has marked the target as a favorite. Example values: true| 
| hasCallerMarkedTargetAsKnown| Boolean value| Whether the caller has marked the target as known. Example values: true| 
| isCallerFollowingTarget| Boolean value| Whether the caller is following the target. Example values: true| 
| isTargetFollowingCaller| Boolean value| Whether the target is following the caller. Example values: true| 
| legacyFriendStatus| string| Legacy friend status of the target as seen by the caller. Can be "None", "MutuallyAccepted", "OutgoingRequest", or "IncomingRequest". Example values: "MutuallyAccepted"| 
| recentChangeCount| 32-bit unsigned integer| Optional. Number of recent changes in the target's social graph. This value will only exist when a user is viewing their own summary. Example values: 5| 
| targetFollowerCount| >32-bit unsigned integer| Number of People that are following the target. Example values: 1308| 
| targetFollowingCount| 32-bit unsigned integer| Number of People that the target is following. Example values: 112| 
| watermark| string| Optional. Recent change watermark for the target. This value will only exist when a user is viewing their own summary. Example values: 5| 
  
<a id="ID4E4D"></a>

 
## Sample JSON syntax
 

```json
{
    "targetFollowingCount": 87,
    "targetFollowerCount": 19,
    "isCallerFollowingTarget": true,
    "isTargetFollowingCaller": false,
    "hasCallerMarkedTargetAsFavorite": true,
    "hasCallerMarkedTargetAsKnown": true,
    "legacyFriendStatus": "None",
    "recentChangeCount": 5,
    "watermark": "5246775845000319351"
}
    
```

  
<a id="ID4EGE"></a>

 
## See also
 
<a id="ID4EIE"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   