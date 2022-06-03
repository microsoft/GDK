---
title: MultiplayerSessionReference (JSON)
description: " MultiplayerSessionReference (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# MultiplayerSessionReference (JSON)
A JSON object representing the **MultiplayerSessionReference**. 
<a id="ID4EQ"></a>

  
 
The MultiplayerSessionReference JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.| 
| templateName | string | Name of the current instance of the session template. Part 2 of the session identifier. | 
| name | string | Name of the session. Part 3 of the session identifier. | 
  
<a id="ID4EZ"></a>

 
## Sample JSON syntax 
 

```json
{
  "scid": "8d050174-412b-4d51-a29b-d55a34edfdb7",
  "templateName": "integration",
  "name": "19de0095d8bb41048f19edbbb6bc6b04"
}
  
    
```

  
<a id="ID4EJB"></a>

 
## See also
 
<a id="ID4ELB"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EVB"></a>

 
##### Reference 

[MultiplayerSession (JSON)](json-multiplayersession.md)

   