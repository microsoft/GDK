---
title: GET (/users/{userId}/profile/settings/people/{userList})
description: " GET (/users/{userId}/profile/settings/people/{userList})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/{userId}/profile/settings/people/{userList})
Get the profile for a user or users, with People Moniker support. 
The domain for these URIs is `profile.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EKB)
  * [Query string parameters](#ID4EVB)
  * [Required Request Headers](#ID4EQC)
  * [Request body](#ID4E2D)
 
<a id="ID4EV"></a>

 
## Remarks
 
**userList** and **userIds** are mutually-exclusive parameters. If both or either are specified, you'll get a **BadRequest** back. **userList** is an array for future-proofing in scenarios where multiple named lists are useful to request. **userIds** is composed of decimal strings for XUIDs - JSON is bad at serializing 64-bit unsigned integers. Finally, settings in Xbox One will be named settings, with normal human-readable names, rather than 64-bit unsigned integers or obscure constants like **XONLINE_PROFILE_ASDF**.
  
<a id="ID4EKB"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| userId| string| Can be either 'xuid(12345)', 'gt(myGamertag)', or 'me'.| 
| userList| string| A named list of people to get settings for. Currently, People is the only list supported.| 
  
<a id="ID4EVB"></a>

 
## Query string parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | --- | --- | 
| settings| string| A comma-delimited list of setting names.| 
  
<a id="ID4EQC"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| x-xbl-contract-version| 32-bit signed integer| Value = 2| 
| content-type| string| Value = <code>application/json</code>| 
  
<a id="ID4E2D"></a>

 
## Request body
 
<a id="ID4EBE"></a>

 
### Sample request
 

```cpp
GET /users/me/profile/settings/people/people?settings=GameDisplayName,GameDisplayPicRaw,Gamerscore,Gamertag
      
```

  
<a id="ID4EKE"></a>

  
 
<a id="ID4EME"></a>

 
##### Response body 
The response is a **ReadMultiSettingsResponseV2** object. Assuming the calling user has only one friend:
  

```cpp
{
      "profileUsers":[
         {
            "id":"2533274791381930",
            "settings":[
               {
                  "id":"GameDisplayName",
                  "value":"John Smith"
               },
               {
                  "id":"GameDisplayPicRaw",
                  "value":"http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToBrrCmIEEXHC9UNrdJ6P7KIN0gxC2r1YECCd3mf2w1FDdmFCpSokJWa2z7xtVrlzOyVSc6pPRdWEXmYtpS2xE4F&format=png&w=64&h=64"
               },
               {
                  "id":"Gamerscore",
                  "value":"0"
               },
               {
                  "id":"Gamertag",
                  "value":"CracklierJewel9"
               }
            ]
         }
      ]
   }
         
```

   
<a id="ID4E3E"></a>

 
## See also
 
<a id="ID4E5E"></a>

 
##### Parent 

[/users/{userId}/profile/settings/people/{userList}?settings={settings}](uri-usersuseridprofilesettingspeopleuserlist.md)

 [Profile (JSON)](../../json/json-profile.md)

   