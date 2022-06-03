---
title: DELETE (/users/xuid({xuid})/inbox/{messageId})
description: " DELETE (/users/xuid({xuid})/inbox/{messageId})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# DELETE (/users/xuid({xuid})/inbox/{messageId})
Deletes a user message in the user's inbox. 
The domain for these URIs is `msg.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [URI parameters](#ID4ECB)
  * [Authorization](#ID4EPB)
  * [Request body](#ID4E1B)
  * [HTTP status codes](#ID4EHC)
  * [JavaScript Object Notation (JSON) Response](#ID4EAE)
  * [Effect of privacy settings on resource](#ID4EYF)
 
<a id="ID4EV"></a>

 
## Remarks 
 
The delete operation is idempotent.
 
The only content type this API supports is "application/json", which is required in the HTTP headers of each call. 
  
<a id="ID4ECB"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid | unsigned 64-bit integer | The Xbox User ID (XUID) of the player who is making the request. | 
| messageId | string[50] | ID of the message being retrieved or deleted. | 
  
<a id="ID4EPB"></a>

 
## Authorization 
 
You must have your own user claim to delete a user message.
  
<a id="ID4E1B"></a>

 
## Request body 
 
No objects are sent in the body of this request.
  
<a id="ID4EHC"></a>

 
## HTTP status codes 
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Description| 
| --- | --- | --- | --- | --- | 
| 204| Success.| 
| 403| The XUID cannot be converted or a valid XUID claim cannot be found.| 
| 404| Message ID in the URI cannot be parsed or an XUID is missing in the URI.| 
| 500| General server-side error.| 
  
<a id="ID4EAE"></a>

 
## JavaScript Object Notation (JSON) Response 
 
In case of error, the service may return an errorResponse object, which may contain values from the environment of the service.
 
| Property| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | 
| errorSource| string| An indication of where the error originated.| 
| errorCode| int| Numeric code associated with the error (can be null).| 
| errorMessage| string| Details of the error if configured to show details.| 
  
<a id="ID4EYF"></a>

 
## Effect of privacy settings on resource 
 
Only you can delete your own user messages. 
  
<a id="ID4EDG"></a>

 
## See also
 
<a id="ID4EFG"></a>

 
##### Parent  

[/users/xuid({xuid})/inbox](uri-usersxuidinbox.md)

  
<a id="ID4ETG"></a>

 
##### Reference  [Standard HTTP status codes](../../additional/httpstatuscodes.md)

   