---
title: PeopleList (JSON)
description: " PeopleList (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PeopleList (JSON)
Collection of [Person](json-person.md) objects. 
<a id="ID4ER"></a>

 
## PeopleList
 
The PeopleList object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| people| array of [Person](json-person.md)| The [Person](json-person.md) objects that make up the people list.| 
| totalCount| 32-bit unsigned integer| Total number of [Person](json-person.md) objects available in the set. This value can be used by clients for paging because it represents the size of the whole set, not just the most recent response. Example value: 680.| 
  
<a id="ID4EAC"></a>

 
## Sample JSON syntax
 

```json
{
    "people": [
        {
            "xuid": "2603643534573573",
            "isFavorite": true,
            "isFollowingCaller": false,
            "socialNetworks": ["LegacyXboxLive"]
        },
        {
            "xuid": "2603643534573572",
            "isFavorite": true,
            "isFollowingCaller": false,
            "socialNetworks": ["LegacyXboxLive"]
        },
        {
            "xuid": "2603643534573577",
            "isFavorite": false,
            "isFollowingCaller": false
        },
    ],
    "totalCount": 3
}
    
```

  
<a id="ID4EJC"></a>

 
## See also
 
<a id="ID4ELC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EVC"></a>

 
##### Reference 

[GET (/users/{ownerId}/people)](../uri/people/uri-usersowneridpeopleget.md)

 [POST (/users/{ownerId}/people/xuids)](../uri/people/uri-usersowneridpeoplexuidspost.md)

   