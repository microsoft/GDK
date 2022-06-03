---
title: PresenceRecord (JSON)
description: " PresenceRecord (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PresenceRecord (JSON)
Data about the online presence of a single user.
<a id="ID4EN"></a>


## PresenceRecord

The PresenceRecord object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| xuid| string| The Xbox User ID (XUID) of the target user. The presence data provided is for this user.|
| devices| array of [DeviceRecord](json-devicerecord.md)| List of the user's device records.|
| state| string| User's activity on Xbox LIVE. Possible values: <ul><li>Online: User has at least one device record.</li><li>Away: User is signed into Xbox LIVE but not active in any title.</li><li>Offline: User is not present on any device.</li></ul> | 
| lastSeen| [LastSeenRecord](json-lastseenrecord.md)| The last seen information is only available when the user has no valid DeviceRecords. If the object was removed from the cache, its data might not be returned, because there is no persistent store.|

<a id="ID4E2C"></a>


## Sample JSON syntax


```json
{
  xuid:"0123456789",
  state:"online",
  devices:
  [{
    type:"D",
    titles:
    [{
      id:"12341234",
      name:"Contoso 5",
      state:"active",
      placement:"fill",
      timestamp:"2012-09-17T07:15:23.4930000",
      activity:
      {
        richPresence:"Team Deathmatch on Nirvana"
      }
    },
    {
      id:"12341235",
      name:"Contoso Waypoint",
      timestamp:"2012-09-17T07:15:23.4930000",
      placement:"snapped",
      state:"active",
      activity:
      {
        richPresence:"Using radar"
      }
    }]
  },
  {
    type:"W8",
    titles:
    [{
      id:"23452345",
      name:"Contoso Gamehelp",
      state:"active",
      placement:"full",
      timestamp:"2012-09-17T07:15:23.4930000",
      activity:
      {
        richPresence:"Nirvana page"
      }
    }]
  }]
}

```


<a id="ID4EED"></a>


## See also

<a id="ID4EGD"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)


<a id="ID4EQD"></a>


##### Reference

[POST (/users/batch)](../uri/presence/uri-usersbatchpost.md)

 [GET (/users/me)](../uri/presence/uri-usersmeget.md)

 [DELETE (/users/xuid({xuid})/devices/current/titles/current)](../uri/presence/uri-usersxuiddevicescurrenttitlescurrentdelete.md)

 [GET (/users/xuid({xuid}))](../uri/presence/uri-usersxuidget.md)