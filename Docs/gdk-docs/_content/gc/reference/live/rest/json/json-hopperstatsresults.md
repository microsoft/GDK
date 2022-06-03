---
title: HopperStatsResults (JSON)
description: " HopperStatsResults (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# HopperStatsResults (JSON)
A JSON object representing the statistics for a hopper. 
<a id="ID4EN"></a>

  
 
The HopperStatsResults JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| hopperName| string| The name of the selected hopper.| 
| waitTime| 32-bit signed integer| Average matching time for the hopper (an integral number of seconds). | 
| population| 32-bit signed integer| The number of people waiting for matches in the hopper.| 
  
<a id="ID4EW"></a>

 
## Sample JSON syntax 
 

```json
{
      "hopperName":"contosoawesome2",
      "waitTime":30,
      "population":1
    }
  
    
```

  
<a id="ID4EGB"></a>

 
## See also
 
<a id="ID4EIB"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EUB"></a>

 
##### Reference 

[GET (/serviceconfigs/{scid}/hoppers/{name}/stats)](../uri/matchtickets/uri-serviceconfigsscidhoppershoppernamestatsget.md)

   