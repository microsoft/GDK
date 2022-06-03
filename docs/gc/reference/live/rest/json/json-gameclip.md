---
title: GameClip (JSON)
description: " GameClip (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameClip (JSON)
 
<a id="ID4EO"></a>

 
## GameClip
 
The GameClip object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| <b>gameClipId</b>| string| The ID assigned to the game clip.| 
| <b>state</b>| GameClipState| The state of the game clip in the system.| 
| <b>dateRecorded</b>| DateTime| The date and time that the recording was started, in UTC (ISO 8601 format).| 
| <b>lastModified</b>| DateTime| Last modified time of the game clip or its metadata, in UTC (ISO 8601 format).| 
| <b>userCaption</b>| string| The user-entered non-localized string for the game clip.| 
| <b>type</b>| GameClipTypes| The type of clip. Can be multiple values, and will be comma-delimited if so.| 
| <b>source</b>| GameClipSource| How the clip was sourced.| 
| <b>visibility</b>| GameClipVisibility| The visibility of the game clip once it is published in the system.| 
| <b>durationInSeconds</b>| 32-bit unsigned integer| The duration of the game clip in seconds.| 
| <b>scid</b>| string| SCID to which the game clip is associated.| 
| <b>rating</b>| double-precision floating-point number| The rating associated with the game clip, in the range 0.0 to 5.0.| 
| <b>ratingCount</b>| 32-bit unsigned integer| The number of times this clip has been rated.| 
| <b>views</b>| 32-bit unsigned integer| The number of views associated with the game clip.| 
| <b>titleData</b>| string| The title-specific property bag.| 
| <b>titleData</b>| string| The console-specific property bag.| 
| <b>thumbnails</b>| array of GameClipThumbnail| Array of GameClipThumbnail objects.| 
| <b>gameClipUris</b>| array of GameClipUri| Array of GameClipUri objects.| 
| <b>xuid</b>| string| The XUID of the owner of the game clip, marshaled as a string.| 
| <b>clipName</b>| string| The localized version of the clip's name, based on the input locale of the request as looked up from the title management system.| 
  
<a id="ID4ERH"></a>

 
## Sample JSON syntax
 

```json
{
     "id": "7ce5c1a7-1255-46d3-a90e-34a0e2dfab06",
     "xuid": "2716903703773872",
     "state": "Published", 
     "dateRecorded": "2012-12-23T12:00:00Z",
     "lastModified": "2012-10-31T10:45:00Z",
     "clipName": "Forza 4",
     "userCaption": "My awesome car flip",
     "type": "DeveloperInitiated, Achievement",
     "source": "TitleDirect",
     "visibility": "Default",
     "durationInSeconds": 30,
     "scid": "ecb5497e-76d4-4a8a-870d-e76a26306b7d",
     "rating": 1.0,
     "views": 5,
     "thumbnails": [
       {
         "uri": "http://gameclips.xbox.com/thumbnails/7ce5c1a7-1255-46d3-a90e-34a0e2dfab06/small.jpg",
         "fileSize": 123,
         "width": 120,
         "height": 250
       }
     ],
     "gameClipUris": [
       {
         "uri": "http://gameclips.xbox.com/clips/7ce5c1a7-1255-46d3-a90e-34a0e2dfab06/clip.mp4",
         "fileSize": 1234565,
         "uriType": "Download",
         "expiration": "9999-12-31T23:59:59.9999999"
       }
     ]
   }
    
```

  
<a id="ID4E1H"></a>

 
## See also
 
<a id="ID4E3H"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   