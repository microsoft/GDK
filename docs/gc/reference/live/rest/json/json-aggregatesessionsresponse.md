---
title: AggregateSessionsResponse (JSON)
description: " AggregateSessionsResponse (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# AggregateSessionsResponse (JSON)
Contains aggregated data for a user's fitness sessions. 
<a id="ID4EN"></a>

 
## AggregateSessionsResponse
 
The AggregateSessionsResponse object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| totalDurationInSeconds| 64-bit signed integer| Total duration of sessions in seconds over the aggregation period.| 
| totalJoules| 64-bit signed integer| Total energy burned—in joules—over the aggregation period. | 
| totalSessions| 64-bit signed integer| Total number of sessions over the aggregation period.| 
| weightedAverageMets| single-precision floating-point number | Weighted average metabolic equivalent of task (MET) value over the aggregation period. The MET value is the ratio of an individual's metabolic rate during an activity relative to the individual's metabolic rate at rest. Because the metabolic rate for resting is 1.0 regardless of an individual's weight, and MET values are relative to an individual's resting metabolic rate, they can be used to compare the intensity of an activity being performed by individuals of different weights.| 
  
<a id="ID4ESC"></a>

 
## Sample JSON syntax
 

```json
{
   "totalSessions" : 300,
   "totalDurationInSeconds" : 1240,
   "totalJoules" :  21600,
   "weightedAvgMet" : 21,
}

    
```

  
<a id="ID4E2C"></a>

 
## See also
 
<a id="ID4E4C"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   