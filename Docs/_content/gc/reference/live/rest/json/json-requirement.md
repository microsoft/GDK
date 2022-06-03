---
title: Requirement (JSON)
description: " Requirement (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Requirement (JSON)
The unlock criteria for the Achievement and how far the user is toward meeting them. 
<a id="ID4EN"></a>

 
## Requirement
 
The Requirement object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| id| string| The ID of the requirement.| 
| current| string| The current value of progression toward the requirement.| 
| target| string| The target value of the requirement.| 
| operationType| string| The operation type of the requirement. Valid values are Sum, Minimum, Maximum.| 
| ruleParticipationType| string| The participation type of the requirement. Valid values are Individual, Group.| 
  
<a id="ID4ETC"></a>

 
## See also
 
<a id="ID4EVC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   