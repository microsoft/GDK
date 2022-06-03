---
title: POST (/users/batch/profile/settings)
description: " POST (/users/batch/profile/settings)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/batch/profile/settings)
Get the profile for a user or users. 
The domain for these URIs is `profile.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [Authorization](#ID4EFB)
  * [Required Request Headers](#ID4EOB)
  * [Request body](#ID4EZC)
  * [Response body](#ID4EJD)
 
<a id="ID4EV"></a>

 
## Remarks
 
This is the only fully-qualified Profile URL allowed in . All other Profile APIs from clients are blocked.
  
<a id="ID4EFB"></a>

 
## Authorization
 
To access a profile, only a normal auth token and claims are needed.
  
<a id="ID4EOB"></a>

 
## Required Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | 
| x-xbl-contract-version| 32-bit unsigned integer| The contract version must be set to 2, to distinguish this call from the Xbox 360 API.| 
| content-type| string| Value = <code>application/json</code>| 
  
<a id="ID4EZC"></a>

 
## Request body
 
<a id="ID4E6C"></a>

 
### Sample request
 

```cpp
POST /users/batch/profile/settings
   {
      "userIds":[
         "2533274791381930"
       ],
      "settings":[
         "GameDisplayName",
         "GameDisplayPicRaw",
         "Gamerscore",
         "Gamertag"
      ]
   }
      
```

   
<a id="ID4EJD"></a>

 
## Response body
 
<a id="ID4EPD"></a>

 
### Sample response
 

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
                  "value":"http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToBrrCmIEEXHC9UNrdJ6P7KIN0gxC2r1YECCd3mf2w1FDdmFCpSokJWa2z7xtVrlzOyVSc6pPRdWEXmYtpS2xE4F"
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

   
<a id="ID4EZD"></a>

 
## See also
 
<a id="ID4E2D"></a>

 
##### Parent 

[/users/batch/profile/settings](uri-usersbatchprofilesettings.md)

  
<a id="ID4EFE"></a>

 
##### Reference 

[Profile (JSON)](../../json/json-profile.md)

   