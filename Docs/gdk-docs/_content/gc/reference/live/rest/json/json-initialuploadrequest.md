---
title: InitialUploadRequest (JSON)
description: " InitialUploadRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# InitialUploadRequest (JSON)
The body of a POST GameClip upload request. 
<a id="ID4EN"></a>

 
## InitialUploadRequest
 
The InitialUploadRequest object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| <b>greatestMomentId</b>| string| The string ID for the text to use as the name for the clip. This is managed and localized in the config file for the title by the developer of the title.| 
| <b>userCaption</b>| string| Optional. Alternate user-entered name for game clip up to a maximum length of 250 characters.| 
| <b>sessionRef</b>| string| Optional. Game session reference during which the recording was done.| 
| <b>dateRecorded</b>| DateTime| The time the recording was started, in UTC. Marshalled as a string in ISO 8601 format (see <a href="https://www.w3.org/TR/NOTE-datetime">Date and Time Formats</a> for more information).| 
| <b>durationInSeconds</b>| 32-bit unsigned integer| The length of the clip in seconds.| 
| <b>expectedBlocks</b>| 32-bit unsigned integer| Optional. Number of blocks into which file will be divided. Omit if file will be transmitted in a single request.| 
| <b>fileSize</b>| 32-bit unsigned integer| File size in bytes of the video that will be uploaded.| 
| <b>type</b>| [GameClipType Enumeration](../enums/gvr-enum-gamecliptypes.md)| The type of clip, marshaled as a string value of the enumeration that is comma-delimited.| 
| <b>source</b>| [GameClipSource Enumeration](../enums/gvr-enum-gameclipsource.md)| Specifies how the clip was sourced, marshaled as a string value of the enumeration.| 
| <b>visibility</b>| [GameClipVisibility Enumeration](../enums/gvr-enum-gameclipvisibility.md)| Specifies the visibility of the game clip once it is published in the system.| 
| <b>titleData</b>| string| Optional. Property bag for title-specific properties associated with this clip. Stored and returned as-is. Title developers can use this field to persist their own metadata about a clip.| 
| <b>titleData</b>| string| Optional. Property bag for console-specific properties associated with this clip. Stored and returned as-is. Console Platform can use this field to persist their own metadata about a clip.| 
| <b>systemProperties</b>| string| Optional. Property bag for console-specific properties associated with this clip. Stored and returned as is. Console Platform can use this field to persist their own metadata about a clip.| 
| <b>usersInSession</b>| array of string| Optional. A list of the users in the current session.| 
| <b>thumbnailSource</b>| [ThumbnailSource Enumeration](../enums/gvr-enum-thumbnailsource.md)| Optional. The source of the thumbnail.| 
| <b>thumbnailOffsetMillseconds</b>| 32-bit signed integer| Specifies the offset (in milliseconds) for offset generated thumbnails. Only specified when <b>thumbnailSource</b> is set to Offset.| 
| <b>savedByUser</b>| Boolean value| Optional. Sets the clip to be saved to the user's quota instead of FIFO storage. Defaults to false.| 
  
<a id="ID4ERH"></a>

 
## Sample JSON syntax
 

```json
{
   "greatestMomentId": "123abc",
   "userCaption": "OMG Look at this!",
   "sessionRef": "4587552a-a5ad-4c4c-a787-5bc5af70e4c9",
   "dateRecorded": "2012-12-23T11:08:08Z",
   "durationInSeconds": 27,
   "expectedBlocks": 7,
   "fileSize": 1234567,
   "type": "MagicMoment, Achievement",
   "source": "Console",
   "visibility": "Default",
   "titleData": "{ 'Boss': 'The Invincible' }",
   "systemProperties": "{ 'Id': '123456', 'Location': 'C:\\videos\\123456.mp4' }",
   "thumbnailSource": "Offset",
   "thumbnailOffsetMillseconds": 20000,
   "savedByUser": false
 }
    
```

  
<a id="ID4E1H"></a>

 
## See also
 
<a id="ID4E3H"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   