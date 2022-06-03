---
title: GET (/users/xuid({xuid})/history/titles)
description: " GET (/users/xuid({xuid})/history/titles)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/history/titles)
Gets a list of titles for which the user has unlocked or made progress on its achievements. This API does not return a user's full history of titles played or launched. 
The domain for these URIs is `achievements.xboxlive.com`.
 
  * [URI parameters](#ID4EY)
  * [Query string parameters](#ID4EDB)
  * [Authorization](#ID4EFD)
  * [Optional Request Headers](#ID4EGE)
  * [Request body](#ID4ERF)
 
<a id="ID4EY"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| 64-bit unsigned integer| Xbox User ID (XUID) of the user whose title history is being accessed.| 
  
<a id="ID4EDB"></a>

 
## Query string parameters
 
| Parameter| Required| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | 
| skipItems| No| 32-bit signed integer| Return items beginning after the given number of items. For example, <b>skipItems="3"</b> will retrieve items beginning with the fourth item retrieved. | 
| continuationToken| No| string| Return the items starting at the given continuation token. | 
| maxItems| No| 32-bit signed integer| Maximum number of items to return from the collection, which can be combined with <b>skipItems</b> and <b>continuationToken</b> to return a range of items. The service may provide a default value if <b>maxItems</b> is not present, and may return fewer than <b>maxItems</b>, even if the last page of results has not yet been returned. | 
  
<a id="ID4EFD"></a>

 
## Authorization
 
| Claim| Required?| Description| Behavior if missing| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| User| Caller is an authorized Xbox LIVE user.| The caller needs to be a valid user on Xbox LIVE.| 403 Forbidden| 
  
<a id="ID4EGE"></a>

 
## Optional Request Headers
 
| Header| Type| Description| 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| <b>X-RequestedServiceVersion</b>| string| Build name/number of the Xbox LIVE service to which this request should be directed. The request will only be routed to that service after verifying the validity of the header, the claims in the auth token, etc.| 
| <b>x-xbl-contract-version</b>| 32-bit unsigned integer| If present and set to 2, the V2 version of this API will be used. Otherwise, V1.| 
  
<a id="ID4ERF"></a>

 
## Request body
 
No objects are sent in the body of this request.
  
<a id="ID4EDG"></a>

 
## See also
 
<a id="ID4EFG"></a>

 
##### Parent 

[/users/xuid({xuid})/history/titles](uri-titlehistoryusersxuidhistorytitlesv2.md)

  
<a id="ID4EPG"></a>

 
##### Reference 

[UserTitle (JSON)](../../json/json-usertitlev2.md)

 [PagingInfo (JSON)](../../json/json-paginginfo.md)

 [Paging Parameters](../../additional/pagingparameters.md)

   