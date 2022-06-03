---
title: XuidList (JSON)
description: " XuidList (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# XuidList (JSON)
List of XUIDs on which to perform an operation. 
<a id="ID4EN"></a>

 
## XuidList
 
The XuidList object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| xuids| array of string| List of Xbox User ID (XUID) values on which an operation should be performed or data should be returned.| 
  
<a id="ID4EMB"></a>

 
## Sample JSON syntax
 

```json
{
    "xuids": [
        "2533274790395904", 
        "2533274792986770", 
        "2533274794866999"
    ]
}
    
```

  
<a id="ID4EVB"></a>

 
## See also
 
<a id="ID4EXB"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EBC"></a>

 
##### Reference 

[POST (/users/{ownerId}/people/xuids)](../uri/people/uri-usersowneridpeoplexuidspost.md)

   