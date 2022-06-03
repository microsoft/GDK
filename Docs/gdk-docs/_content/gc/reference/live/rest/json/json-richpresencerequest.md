---
title: RichPresenceRequest (JSON)
description: " RichPresenceRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# RichPresenceRequest (JSON)
Request for information about which rich presence information should be used. 
<a id="ID4EN"></a>

 
## RichPresenceRequest
 
The RichPresenceRequest object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| id| string| The <b>friendlyName</b> of the rich presence string to use.| 
| scid| string| Scid that tells us where the rich presence strings are defined.| 
| params| array of string| Array of <b>friendlyName</b> strings with which to finish the rich presence string. Only enumeration-friendly names should be specified, not stats. Leaving this empty will remove any previous value.| 
  
<a id="ID4EDC"></a>

 
## Sample JSON syntax
 

```json
{
      id:"playingMapWeapon",
      scid:"abba0123-08ba-48ca-9f1a-21627b189b0f",
    }
    
```

  
<a id="ID4EMC"></a>

 
## See also
 
<a id="ID4EOC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   