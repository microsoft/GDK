---
title: TitleRequest (JSON)
description: " TitleRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# TitleRequest (JSON)
Request for information about a title. 
<a id="ID4EN"></a>

 
## TitleRequest
 
The TitleRequest object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| id| 32-bit unsigned integer| Identifier of the title.| 
| activity| [ActivityRequest](json-activityrequest.md)| In-title information, including rich presence and media information, if available.| 
| state| string| Whether a user is active or not. This field is required to mark a user as inactive. The default is "active".| 
| placement| string| The placement mode of the title. Possible values include "full", "fill", "snapped", or "background". The default is "full".| 
  
<a id="ID4EJC"></a>

 
## Sample JSON syntax
 

```json
{
  id:"12341234",
  placement:"snapped",
  state:"active",
  activity:
  {
    richPresence:
    {
      id:"playingMapWeapon",
      scid:"82b11353-08ba-48ca-9f1a-21627b189b0f"
    }
  }
}
    
```

  
<a id="ID4ESC"></a>

 
## See also
 
<a id="ID4EUC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4E5C"></a>

 
##### Reference 

[POST (/users/xuid({xuid})/devices/current/titles/current)](../uri/presence/uri-usersxuiddevicescurrenttitlescurrentpost.md)

   