---
title: quotaInfo (JSON)
description: " quotaInfo (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# quotaInfo (JSON)
Contains quota information about a title group. 
<a id="ID4EN"></a>

 
## quotaInfo
 
The quotaInfo object has the following specifications.
 
For global storage
 
| Member| Type| Description| 
| --- | --- | --- | 
| quotaBytes| 32-bit signed integer | Maximum number of bytes usable by the title.| 
| usedBytes| 32-bit signed integer | Number of bytes used by the title.| 
  
<a id="ID4EXB"></a>

 
## Sample JSON syntax
 
The following example shows the response for global storage:
 

```json
{
    "quotaInfo":
    {
        "usedBytes":4194304,
        "quotaBytes":536870912
    }
}
      
```

  
<a id="ID4ECC"></a>

 
## See also
 
<a id="ID4EEC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   