---
title: Reward (JSON)
description: " Reward (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Reward (JSON)
The reward associated with the achievement.
<a id="ID4EN"></a>


## Reward

The Reward object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| name| string| The user-facing name of the Reward.|
| description| string| The user-facing description of the Reward.|
| value| string| The Reward's value.|
| type| RewardType enumeration| The Reward type: <ul><li>invalid (0): An unknown and unsupported reward type was configured.</li><li>Gamerscore (1): The reward adds points to the player's Gamerscore.</li><li>inApp (2): The reward is defined and delivered by the title.</li><li>Art (3): The reward is a digital asset.</li></ul> | 
| valueType| ProgressValueDataType enumeration| The type of value. See [Requirement (JSON)](json-requirement.md) for more information.|

<a id="ID4EBD"></a>


## Sample JSON syntax


```json
{
  "name":null,
  "description":null,
  "value":"10",
  "type":"Gamerscore",
  "valueType":"Int"
}

```


<a id="ID4EKD"></a>


## See also

<a id="ID4EMD"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)