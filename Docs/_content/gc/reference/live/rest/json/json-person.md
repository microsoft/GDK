---
title: Person (JSON)
description: " Person (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Person (JSON)
Metadata about a single Person in the People system. 
<a id="ID4EN"></a>

 
## Person
 
The Person object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| xuid| string| Required. Xbox User ID (XUID) in decimal form. Example value: 2603643534573573.| 
| isFavorite| Boolean value| Required. Whether this person is one that the user cares about more. Because users can have a very large number of people in their People list, favorite people should be prioritized in experiences and shown before others that are not favorites.| 
| isFollowingCaller| Boolean value| Optional. Whether this person is following the user on whose behalf the API call was made.| 
| socialNetworks| array of string| Optional. Within which external networks the user and this person have a relationship.| 
  
<a id="ID4EHC"></a>

 
## Sample JSON syntax
 

```json
{
    "xuid": "2603643534573581",
    "isFavorite": false,
    "isFollowingCaller": false,
    "socialNetworks": ["LegacyXboxLive"]
}
    
```

  
<a id="ID4EQC"></a>

 
## See also
 
<a id="ID4ESC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4E3C"></a>

 
##### Reference 

[/users/{ownerId}/people/{targetid}](../uri/people/uri-usersowneridpeopletargetid.md)

 [/users/{ownerId}/people/xuids](../uri/people/uri-usersowneridpeoplexuids.md)

   