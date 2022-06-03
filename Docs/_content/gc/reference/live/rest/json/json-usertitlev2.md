---
title: UserTitle (JSON)
description: " UserTitle (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# UserTitle (JSON)
Contains user title data. 
<a id="ID4EN"></a>

 
## UserTitle
 
The UserTitle object has the following specification. All properties are required.
 
| Member| Type| Description| 
| --- | --- | --- | 
| lastUnlock| DateTime| The time an achievement was last earned.| 
| titleId| 32-bit unsigned integer| The unique identifier for the title.| 
| titleVersion| string| The version of the title.| 
| serviceConfigId| string| ID of the primary service config set associated with the title.| 
| titleType| string| The title type.| 
| platform| string| The supported platform.| 
| name| string| The text name of this title. Maximum length 22.| 
| earnedAchievements| 32-bit unsigned integer| The number of achievements earned for the title, including unlocked achievements and successfully completed challenges.| 
| currentGamerscore| 32-bit unsigned integer| The total gamerscore this user has earned in this title.| 
| maxGamerscore| 32-bit unsigned integer| The total possible gamerscore for this title.| 
  
<a id="ID4EFE"></a>

 
## See also
 
<a id="ID4EHE"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   