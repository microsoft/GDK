---
title: SessionEntry (JSON)
description: " SessionEntry (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# SessionEntry (JSON)
Contains data for a fitness session. 
<a id="ID4EN"></a>

 
## SessionEntry
 
The SessionEntry object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| durationInSeconds| 32-bit signed integer | Duration—in seconds—of the session. | 
| joules| 32-bit signed integer | Energy—in joules—burned in the session. | 
| met| single-precision floating-point number| Average met value over the session duration. The MET value is the ratio of an individual's metabolic rate during an activity relative to the individual's metabolic rate at rest. Because the metabolic rate for resting is 1.0 regardless of an individual's weight, and MET values are relative to an individual's resting metabolic rate, they can be used to compare the intensity of an activity being performed by individuals of different weights.| 
| serverTimestamp| DateTime| Time—based on UTC—entry was entered on server. | 
| source| 8-bit unsigned integer| Session source.| 
| timestamp| DateTime| Time—based on Coordinated Universal Time (UTC)—entry was created on the client. | 
| titleId| 64-bit unsigned integer| Title—in decimal—that created the entry.| 
  
<a id="ID4EFE"></a>

 
## Sample JSON syntax
 

```json
{
   "titleId" : "1234567",
   "timestamp" : "2011-11-18T08:08:46Z",
   "serverTimestamp" : "2011-11-20T04:04:23Z",
   "durationInSeconds" : 240,
   "joules" :  1600,
   "met" :  "124"
   "source" :  "1"
}
    
```

  
<a id="ID4EOE"></a>

 
## See also
 
<a id="ID4EQE"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   