---
title: TitleRecord (JSON)
description: " TitleRecord (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# TitleRecord (JSON)
Information about a title, including its name and a last-modified timestamp. 
<a id="ID4EN"></a>

 
## TitleRecord
 
A TitleRecord must contain a DeviceRecord or a LastSeenRecord, but may not contain both.
 
The TitleRecord object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| id| 32-bit unsigned integer| TitleId of the record.| 
| name| string| Localized name of the title.| 
| activity| [ActivityRecord](json-activityrecord.md)| The activity of the user in the title. Only returned if depth is "all".| 
| lastModified| DateTime| UTC timestamp when the record was last updated.| 
| placement| string| The location of the app within the user interface. Possibilities include "fill", "full", "snapped", or "background". The default is "full" for devices without the ability to place apps.| 
| state| string| The state of the title. Can be "active" or "inactive" (the default). The title sets the state based on its own criteria for activity and inactivity.| 
  
<a id="ID4E6C"></a>

 
## Sample JSON syntax
 

```json
{
      id:"12341234",
      name:"Contoso 5",
      state:"active",
      placement:"fill",
      timestamp:"2012-09-17T07:15:23.4930000",
      activity:
      {
        richPresence:"Team Deathmatch on Nirvana"
      }
    }
    
```

  
<a id="ID4EID"></a>

 
## See also
 
<a id="ID4EKD"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EUD"></a>

 
##### Reference 

[POST (/users/xuid({xuid})/devices/current/titles/current)](../uri/presence/uri-usersxuiddevicescurrenttitlescurrentpost.md)

   