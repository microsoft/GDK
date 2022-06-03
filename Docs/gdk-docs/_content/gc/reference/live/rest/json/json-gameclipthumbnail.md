---
title: GameClipThumbnail (JSON)
description: " GameClipThumbnail (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GameClipThumbnail (JSON)
Contains the information related to an individual thumbnail. There can be multiple sizes per clip, and it is up to the client to select the proper one for display. 
<a id="ID4EN"></a>

 
## GameClipThumbnail
 
The GameClipThumbnail object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| <b>uri</b>| string| The URI for the thumbnail image.| 
| <b>fileSize</b>| 32-bit unsigned integer| The total file size of the thumbnail image.| 
| <b>thumbnailType</b>| ThumbnailType| The type of thumbnail image.| 
  
<a id="ID4EAC"></a>

 
## Sample JSON syntax
 

```json
{
         "uri": "http://gameclips.xbox.com/thumbnails/7ce5c1a7-1255-46d3-a90e-34a0e2dfab06/small.jpg",
         "fileSize": 123,
         "width": 120,
         "height": 250
       }
    
```

  
<a id="ID4EJC"></a>

 
## See also
 
<a id="ID4ELC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   