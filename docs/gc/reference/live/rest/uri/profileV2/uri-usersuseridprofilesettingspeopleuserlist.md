---
title: "/users/{userId}/profile/settings/people/{userList}?settings={settings}"
description: " /users/{userId}/profile/settings/people/{userList}?settings={settings}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/{userId}/profile/settings/people/{userList}?settings={settings}
Access the profile for a user or users, with People Moniker support. 
The domain for these URIs is `profile.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| userId| string| Can be either 'xuid(12345)', 'gt(myGamertag)', or 'me'.| 
| userList| string| A named list of people to get settings for. Currently, People is the only list supported.| 
  
<a id="ID4E1B"></a>

 
## Valid methods

[GET (/users/{userId}/profile/settings/people/{userList})](uri-usersuseridprofilesettingspeopleuserlistget.md)

&nbsp;&nbsp;Get the profile for a user or users, with People Moniker support.
 
<a id="ID4EEC"></a>

 
## See also
 
<a id="ID4EGC"></a>

 
##### Parent 

[Profiles URIs](atoc-reference-profiles.md)

 [Profile (JSON)](../../json/json-profile.md)

   