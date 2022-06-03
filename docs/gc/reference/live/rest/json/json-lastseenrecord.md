---
title: LastSeenRecord (JSON)
description: " LastSeenRecord (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# LastSeenRecord (JSON)
Information about when the system last saw a user, available when the user has no valid DeviceRecord. 
<a id="ID4EN"></a>

 
## LastSeenRecord
 
The LastSeenRecord object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| deviceType| string| The type of the device on which the user was last present.| 
| titleId| 32-bit unsigned integer| The identifier of the title on which the user was last present.| 
| titleName| string| The name of the title on which the user was last present.| 
| timestamp| DateTime| UTC timestamp indicating when the user was last present.| 
  
<a id="ID4EHC"></a>

 
## Sample JSON syntax
 

```json
{
  deviceType:W8,	
  titleId:"23452345",
  titleName:"My Awesome Game",
  timestamp:"2012-09-17T07:15:23.4930000"
}
    
```

  
<a id="ID4EQC"></a>

 
## See also
 
<a id="ID4ESC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4E5C"></a>

 
##### Reference   