---
title: Progression (JSON)
description: " Progression (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Progression (JSON)
The user's progression toward unlocking the achievement. 
<a id="ID4EN"></a>

 
## Progression
 
The Progression object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| requirements| array of Requirement| The requirements to earn the achievement and how far along the user is toward unlocking it.| 
| timeUnlocked| DateTime| The time the achievement was first unlocked.| 
  
<a id="ID4ETB"></a>

 
## Sample JSON syntax
 

```json
{
  "requirements":
  [{
    "id":"12345678-1234-1234-1234-123456789012",
    "current":null,
    "target":"100"
  }],
  "timeUnlocked":"2013-01-17T03:19:00.3087016Z",
}
    
```

  
<a id="ID4E3B"></a>

 
## See also
 
<a id="ID4E5B"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   