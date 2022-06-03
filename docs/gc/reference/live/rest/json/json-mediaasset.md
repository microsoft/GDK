---
title: MediaAsset (JSON)
description: " MediaAsset (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# MediaAsset (JSON)
The media assets associated with the achievement or its rewards.
<a id="ID4EN"></a>


## MediaAsset

The MediaAsset object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| name| string| The name of the MediaAsset, such as "tile01".|
| type| MediaAssetType enumeration| The type of the media asset: <ul><li>icon (0): The achievement icon.</li><li>art (1): The digital art asset.</li></ul> | 
| url| string| The URL of the MediaAsset.|

<a id="ID4EFC"></a>


## Sample JSON syntax


```json
{
  "name":"Icon Name",
  "type":"Icon",
  "url":"http://www.xbox.com"
}

```


<a id="ID4EOC"></a>


## See also

<a id="ID4EQC"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)