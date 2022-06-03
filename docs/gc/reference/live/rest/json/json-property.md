---
title: Property (JSON)
description: " Property (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Property (JSON)
Contains property data provided by the client for matchmaking request criteria.
<a id="ID4EN"></a>


## Property

The Property object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| id| string| An id for this property.|
| type| 32-bit signed integer | Type of the property. Supported values are: <ul><li>0 = integer</li><li>1 = string</li></ul>| 
| value| string| Value of this property.|

<a id="ID4EGC"></a>


## Sample JSON syntax


```json
{
    "id":"1",
    "value":"20",
    "type":0
}

```


<a id="ID4EPC"></a>


## See also

<a id="ID4ERC"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)