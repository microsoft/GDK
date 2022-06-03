---
title: BatchRequest (JSON)
description: " BatchRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# BatchRequest (JSON)
An array of properties with which to filter presence information, such as users, devices, and titles.
<a id="ID4EN"></a>


## BatchRequest

The BatchRequest object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| users| array of string| List XUIDs of users whose presence you want to learn, with a maximum of 1100 XUIDs at a time.|
| deviceTypes| array of string| List of device types used by the users you want to know about. If the array is left empty, it defaults to all possible device types (that is, none are filtered out).|
| titles| array of 32-bit unsigned integer| List of device types whose users you want to know about. If the array is left empty, it defaults to all possible titles (that is, none are filtered out).|
| level| string| Possible values: <ul><li>user - get user nodes</li><li>device - get user and device nodes</li><li>title - get basic title level information</li><li>all - get rich presence information, media information, or both</li></ul>The default is "title".| 
| onlineOnly| Boolean value| If this property is true, the batch operation will filter out records for offline users (including cloaked ones). If it is not supplied, both online and offline users will be returned.|

<a id="ID4EAD"></a>


## Sample JSON syntax


```json
{
  users:
  [
    "1234567890",
    "4567890123",
    "7890123456"
  ]
}


```


<a id="ID4EJD"></a>


## See also

<a id="ID4ELD"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)


<a id="ID4EXD"></a>


##### Reference   