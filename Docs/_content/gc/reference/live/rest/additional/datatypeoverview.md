---
title: Data Type Overview
description: Data Type Overview.
kindex: Data Type Overview
ms.date: 10/12/2017
ms.topic: article
ms.author: joanlee
security: public
author: joannaleecy
---

# Data Type Overview
 
Xbox Live Services uses a variety of data types related to identity and authentication.
These articles provide an overview of those types.
 
| Type| Description| 
| --- | --- | 
| gamertag| A unique, human-readable screen name for the user.| 
| Player| A JSON object containing the user's XUID and gamertag, as well the player's index in the session (or "seat"), whether the player is still participating in the session, and a small blob of custom data.| 
| profile| Information about the user accessed through profile URI addresses and HTTP methods, usually the user's UserSettings, but also possibly including gamercard, gamertag, XUID, and so on.| 
| setting| One of the title-specific settings in a UserSettings object.| 
| UserClaims| A simple JSON object containing the user's XUID and gamertag.| 
| UserSettings| A JSON object containing a collection of title-specific settings or preferences for the current authenticated user. UserSettings can contain arbitrary data, possibly related to in-game activity.| 
| XUID| The user's Xbox User ID, a unique unsigned long long integer. Not meant to be human-readable.| 


<a id="ID4E6D"></a>

## See also


<a id="ID4EBE"></a>

##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)


<a id="ID4ENE"></a>

##### Reference

[Player (JSON)](../json/json-player.md)

[UserClaims (JSON)](../json/json-userclaims.md)

[UserSettings (JSON)](../json/json-usersettings.md)