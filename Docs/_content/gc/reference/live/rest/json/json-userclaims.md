---
title: UserClaims (JSON)
description: " UserClaims (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# UserClaims (JSON)
Returns information about the current authenticated user. 
<a id="ID4EN"></a>

 
## UserClaims
 
The UserClaims object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| gamertag| string| gamertag of the user.| 
| xuid| 64-bit unsigned integer| The Xbox User ID (XUID) of the user.| 
  
<a id="ID4EZB"></a>

 
## Sample JSON syntax
 

```json
{
   "xuid" : 2533274790412952,
   "gamertag" : "gamer"

}
    
```

  
<a id="ID4ECC"></a>

 
## See also
 
<a id="ID4EEC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   