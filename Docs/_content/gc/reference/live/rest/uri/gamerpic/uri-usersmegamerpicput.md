---
title: PUT (/users/me/gamerpic)
description: " PUT (/users/me/gamerpic)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PUT (/users/me/gamerpic)
Uploads a 1080x1080 gamerpic. 
  * [Request body](#ID4EQ)
  * [HTTP status codes](#ID4EZ)
  * [Response body](#ID4EXC)
 
<a id="ID4EQ"></a>

 
## Request body
 
The request body is a gamerpic (1080x1080 PNG file).
  
<a id="ID4EZ"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | 
| 200| OK| Successful GET.| 
| 201| Created.| Upload was successful.| 
| 403| Forbidden| The privilege is revoked.| 
| 500| Error| Something went wrong.| 
  
<a id="ID4EXC"></a>

 
## Response body
 
No objects are sent in the body of the response.
  
<a id="ID4ECD"></a>

 
## See also
 
<a id="ID4EED"></a>

 
##### Parent 

[/users/me/gamerpic](uri-usersmegamerpic.md)

   